import 'dart:convert';

import '../../models/message.dart';
import 'index.dart';

const String table = 'message';

Map<String, Object?> removeRuntimeType(value) {
  final map = value.toJson();
  map.remove("runtimeType");
  return map;
}

Map<String, Object?> extraToString(value) {
  final map = removeRuntimeType(value);
  map["extra"] = jsonEncode(map["extra"]);
  return map;
}

Message addRuntimeType(Map<String, Object?> json) {
  final newJSON = {...json};
  if (json["extra"] == null) {
    newJSON["runtimeType"] = "text";
  } else {
    newJSON["runtimeType"] = "openAI";
    newJSON["extra"] = jsonDecode(json["extra"] as String);
  }
  return Message.fromJson(newJSON);
}

class MessageDBProvider {
  static final MessageDBProvider _instance = MessageDBProvider._internal();
  MessageDBProvider._internal();

  factory MessageDBProvider() {
    return _instance;
  }

  Future<Message> insert(Message message) async {
    return message.copyWith(
        id: await AppDatabase().db.insert(table,
            message.map(text: removeRuntimeType, openAI: extraToString)));
  }

  Future<Message?> get(int id) async {
    List<Map<String, dynamic>> maps = await AppDatabase()
        .db
        .query(table, columns: null, where: 'id = ?', whereArgs: [id]);
    if (maps.isNotEmpty) {
      return addRuntimeType(maps.first);
    }
    return null;
  }

  Future<List<Message>> findAll(
      {int? conversationId, int? limit, String orderBy = "id desc"}) async {
    String? where;
    List<Object?>? whereArgs;
    if (conversationId != null) {
      where = "conversationId = ?";
      whereArgs = [conversationId];
    }

    List<Map<String, dynamic>> maps = await AppDatabase().db.query(table,
        where: where, whereArgs: whereArgs, limit: limit, orderBy: orderBy);
    return List.generate(maps.length, (index) {
      return addRuntimeType(maps[index]);
    });
  }

  Future<int> deleteAfter(int id) async {
    return await AppDatabase()
        .db
        .delete(table, where: 'id >= ?', whereArgs: [id]);
  }

  Future<int> update(Message message) async {
    return await AppDatabase().db.update(
        table, message.map(text: removeRuntimeType, openAI: extraToString),
        where: 'id = ?', whereArgs: [message.id]);
  }
}
