import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gptool/pages/settings/guide.dart';
import 'package:gptool/pages/home/home.dart';
import 'package:gptool/utils/db/conversation.dart';
import 'package:gptool/utils/db/index.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'models/conversation.dart';
import 'utils/db/message.dart';
import 'utils/key_value_store_helper.dart';
import 'package:gptool/models/export.dart' as models;

void main() async {
  usePathUrlStrategy();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  _MyAppState();

  String _initialLocation = "";

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
        Conversations.defaultConversations.insert(
            0,
            await ConversationDBProvider().insert(
                Conversation(title: "New Chat", createdAt: DateTime.now())));
      }
      String? query = Uri.base.queryParameters["qr"];
      if (query != null) {
        final qrCode = Uri.splitQueryString(query);
        if (qrCode["domain"] != null &&
            qrCode["path"] != null &&
            qrCode["access-code"] != null) {
          qrCode["accessCode"] = qrCode["access-code"]!;
          KeyValueStoreHelper().chatGPTNextWebConfiguration =
              models.ChatGPTNextWeb.fromJson(qrCode);
          if (kIsWeb) {
            launchUrl(
                Uri(
                    scheme: "gptool",
                    host: "link",
                    path: "/",
                    queryParameters: {"qr": Uri.encodeComponent(query)}),
                webOnlyWindowName: "_self");
          }
        }
      }
      setState(() {
        if ((KeyValueStoreHelper().secretKey != null &&
                KeyValueStoreHelper().secretKey!.isNotEmpty) ||
            (KeyValueStoreHelper().chatGPTNextWebConfiguration != null &&
                KeyValueStoreHelper()
                    .chatGPTNextWebConfiguration!
                    .domain
                    .isNotEmpty &&
                KeyValueStoreHelper()
                    .chatGPTNextWebConfiguration!
                    .path
                    .isNotEmpty &&
                KeyValueStoreHelper()
                    .chatGPTNextWebConfiguration!
                    .accessCode
                    .isNotEmpty)) {
          _initialLocation = "/";
        } else {
          _initialLocation = "/guide";
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _initialLocation.isEmpty
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : DynamicColorBuilder(
            builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
            return MaterialApp.router(
              title: 'GPTool',
              theme: ThemeData.light(useMaterial3: true)
                  .copyWith(colorScheme: lightDynamic),
              darkTheme: ThemeData.dark(useMaterial3: true)
                  .copyWith(colorScheme: darkDynamic),
              routerConfig: GoRouter(
                initialLocation: _initialLocation,
                routes: [
                  GoRoute(
                    path: '/',
                    builder: (_, state) {
                      return const MyHomePage();
                    },
                    routes: [
                      GoRoute(
                        path: 'guide',
                        builder: (_, __) => const GuidePage(),
                      ),
                    ],
                  ),
                ],
              ),
            );
          });
  }
}
