import '../../models/conversation.dart';
import 'index.dart';

const String table = 'conversation';

class ConversationDBProvider {
  static final ConversationDBProvider _instance =
      ConversationDBProvider._internal();
  ConversationDBProvider._internal();

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

  Future<int> delete(int id) async {
    return await AppDatabase()
        .db
        .delete(table, where: '$id = ?', whereArgs: [id]);
  }

  Future<int> update(Conversation conversation) async {
    return await AppDatabase().db.update(table, conversation.toJson(),
        where: 'id = ?', whereArgs: [conversation.id]);
  }
}
