// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/foundation.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:gptool/models/models.dart';
// import 'package:gptool/utils/db/conversation.dart';
// import 'package:sqflite_common_ffi/sqflite_ffi.dart';

// void main() {
//   var factory = databaseFactoryFfi;
//   if (!kIsWeb) {
//     sqfliteFfiInit();
//   }
//   group('provider', () {
//     test('insert', () async {
//       var provider = ConversationDBProvider();
//       await provider.open();
//       final id = DateTime.now().millisecondsSinceEpoch.toString();
//       final newMessageId = await provider.insert(GPTResponseMessage(
//           id: id,
//           content: "test open api response",
//           userId: "1",
//           extra: [],
//           createdAt: DateTime.now()));
//       expect(newMessageId.id, id);
//       await provider.close();
//     });
//   });
// }
