import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/key_value_store_helper.dart';

class GuidePage extends StatefulWidget {
  const GuidePage({super.key});

  @override
  State<GuidePage> createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  final TextEditingController _apiKeyTextEditingController =
      TextEditingController(text: KeyValueStoreHelper().secretKey);
  final String _draft = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                                .copyWith(decoration: TextDecoration.underline),
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
                      final prefs = await SharedPreferences.getInstance();
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
              ),
              TextButton(
                  onPressed: () {
                    KeyValueStoreHelper().secretKey =
                        _apiKeyTextEditingController.text;
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil("home", (route) => false);
                  },
                  child: const Text("Start"))
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
