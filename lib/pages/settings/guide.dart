import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/key_value_store_helper.dart';
import 'package:gptool/models/export.dart' as models;

class GuidePage extends StatefulWidget {
  const GuidePage({super.key});

  @override
  State<GuidePage> createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  final TextEditingController _apiKeyTextEditingController =
      TextEditingController(text: KeyValueStoreHelper().secretKey);
  String _draft = "";
  String _mode = "ChatGPTNextWeb";

  final TextEditingController _domainTextEditingController =
      TextEditingController(
          text: KeyValueStoreHelper().chatGPTNextWebConfiguration?.domain);
  final TextEditingController _pathTextEditingController =
      TextEditingController(
          text: KeyValueStoreHelper().chatGPTNextWebConfiguration?.path);
  final TextEditingController _accessCodeTextEditingController =
      TextEditingController(
          text: KeyValueStoreHelper().chatGPTNextWebConfiguration?.accessCode);

  _onChange(text) {
    KeyValueStoreHelper().chatGPTNextWebConfiguration = models.ChatGPTNextWeb(
        domain: _domainTextEditingController.text,
        path: _pathTextEditingController.text,
        accessCode: _accessCodeTextEditingController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _mode == "ChatGPTNextWeb"
                  ? Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          Expanded(
                              child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                      child: TextField(
                                          onChanged: _onChange,
                                          controller:
                                              _domainTextEditingController,
                                          decoration: const InputDecoration(
                                              filled: true,
                                              hintText:
                                                  "chat-gpt-next-web.vercel.app",
                                              labelText: "Deployed domain"))),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Flexible(
                                      flex: 1,
                                      child: TextField(
                                          onChanged: _onChange,
                                          controller:
                                              _pathTextEditingController,
                                          decoration: const InputDecoration(
                                              filled: true,
                                              hintText: "v1/chat/completions",
                                              labelText: "Path"))),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Flexible(
                                      flex: 1,
                                      child: TextField(
                                          onChanged: _onChange,
                                          controller:
                                              _accessCodeTextEditingController,
                                          decoration: const InputDecoration(
                                              filled: true,
                                              hintText: "**************",
                                              labelText: "Access-Code"))),
                                ],
                              ),
                            ],
                          ))
                        ])
                  : Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Text(">"),
                            TextButton(
                                onPressed: () {
                                  launchUrl(Uri.parse(
                                      "https://platform.openai.com/account/api-keys"));
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      "https://platform.openai.com/account/api-keys",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium!
                                          .copyWith(
                                              decoration:
                                                  TextDecoration.underline),
                                    )
                                  ],
                                )),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: TextField(
                              onChanged: (value) async {
                                setState(() {
                                  _draft = value;
                                });
                                final prefs =
                                    await SharedPreferences.getInstance();
                                await prefs.setString('SECRET_KEY', _draft);
                              },
                              controller: _apiKeyTextEditingController,
                              showCursor: true,
                              decoration: const InputDecoration(
                                  filled: true,
                                  // fillColor: Colors.amber,
                                  hintText: "sk-****************************",
                                  labelText: "Api Key"),
                            ))
                          ],
                        )
                      ],
                    ),
              const SizedBox(height: 20),
              TextButton(
                  onPressed: () {
                    KeyValueStoreHelper().secretKey =
                        _apiKeyTextEditingController.text;
                    context.go("/home");
                  },
                  child: const Text("Get Started")),
              IconButton(
                  onPressed: () {
                    setState(() {
                      _mode = _mode == "OpenAI" ? "ChatGPTNextWeb" : "OpenAI";
                    });
                  },
                  icon: const Icon(Icons.swap_horiz_outlined)),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
