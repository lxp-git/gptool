import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gptool/models/conversation.dart';
import 'package:gptool/utils/key_value_store_helper.dart';

import '../utils/db/conversation.dart';
import '../utils/db/index.dart';
import '../utils/db/message.dart';
import 'guide.dart';
import 'home/home.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent));
    Future.wait([AppDatabase().open(), KeyValueStoreHelper().init()])
        .then((value) async {
      Conversations.defaultConversations =
          await ConversationDBProvider().findAll();
      if (Conversations.defaultConversations.isEmpty ||
          (await MessageDBProvider().findAll(
                  conversationId: Conversations.defaultConversations.first.id))
              .isNotEmpty) {
        Conversations.defaultConversations.add(await ConversationDBProvider()
            .insert(
                Conversation(title: "New Chat", createdAt: DateTime.now())));
      }
      if (KeyValueStoreHelper().secretKey != null &&
          KeyValueStoreHelper().secretKey!.isNotEmpty) {
        Navigator.of(context).replace(
            newRoute: MaterialPageRoute(builder: (context) {
              return const MyHomePage();
            }),
            oldRoute: ModalRoute.of(context)!);
      } else {
        Navigator.of(context).replace(
            newRoute: MaterialPageRoute(builder: (context) {
              return const GuidePage();
            }),
            oldRoute: ModalRoute.of(context)!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
