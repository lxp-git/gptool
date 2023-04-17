import 'package:gptool/utils/db/message.dart';

import '../../models/conversation.dart';
import 'index.dart';

class ConversationDBProvider {
  static final ConversationDBProvider _instance =
      ConversationDBProvider._internal();
  ConversationDBProvider._internal();

  static const String table = 'conversation';

  factory ConversationDBProvider() {
    return _instance;
  }

  Future<Conversation> insert(Conversation conversation) async {
    final map = conversation.toJson();
    return conversation.copyWith(id: await AppDatabase().db.insert(table, map));
  }

  Future<Conversation?> find(int id) async {
    List<Map<String, dynamic>> maps = await AppDatabase()
        .db
        .query(table, columns: null, where: 'id = ?', whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Conversation.fromJson(maps.first);
    }
    return null;
  }

  Future<List<Conversation>> findAll({String? orderBy = "id DESC"}) async {
    List<Map<String, dynamic>> maps =
        await AppDatabase().db.query(table, orderBy: orderBy);
    return maps.map((e) => Conversation.fromJson(e)).toList();
  }

  Future<List<Object?>> delete(int id) async {
    final batch = AppDatabase().db.batch();
    batch.delete(MessageDBProvider.table,
        where: 'conversationId = ?', whereArgs: [id]);
    batch.delete(table, where: 'id = ?', whereArgs: [id]);
    return await batch.commit();
  }

  Future<int> update(Conversation conversation) async {
    return await AppDatabase().db.update(table, conversation.toJson(),
        where: 'id = ?', whereArgs: [conversation.id]);
  }
}
