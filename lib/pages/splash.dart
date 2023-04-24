import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:gptool/models/conversation.dart';
import 'package:gptool/utils/key_value_store_helper.dart';
import 'package:gptool/models/export.dart' as models;
import 'package:url_launcher/url_launcher.dart';

import '../utils/db/conversation.dart';
import '../utils/db/index.dart';
import '../utils/db/message.dart';

class SplashPage extends StatefulWidget {
  String? path;
  String? query;
  SplashPage({super.key, this.path, this.query});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    if (widget.query != null) {
      Uri.splitQueryString(widget.query!);
    }
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
        Conversations.defaultConversations.insert(
            0,
            await ConversationDBProvider().insert(
                Conversation(title: "New Chat", createdAt: DateTime.now())));
      }

      if (widget.query != null) {
        final qrCode = Uri.splitQueryString(widget.query!);
        if (qrCode["domain"] != null &&
            qrCode["path"] != null &&
            qrCode["access-code"] != null) {
          qrCode["accessCode"] = qrCode["access-code"]!;
          KeyValueStoreHelper().chatGPTNextWebConfiguration =
              models.ChatGPTNextWeb.fromJson(qrCode);
          launchUrl(
              Uri(
                  scheme: "gptool",
                  host: "link",
                  path: "/",
                  queryParameters: {"qr": Uri.encodeComponent(widget.query!)}),
              webOnlyWindowName: "_self");
        }
      }
      if (KeyValueStoreHelper().secretKey?.isNotEmpty != null ||
          KeyValueStoreHelper()
                  .chatGPTNextWebConfiguration
                  ?.domain
                  .isNotEmpty !=
              null) {
        context.replace("/home");
      } else {
        context.replace("/guide");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
