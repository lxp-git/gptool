import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gptool/models/message.dart';
import 'package:gptool/pages/conversation.dart';

import 'message.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  String _draft = "";
  TextEditingController editingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  _send() async {
    ref.read(currentConversationMessagesProvider.notifier).sendMessage(_draft);
  }

  late bool showNavigationDrawer;
  int screenIndex = 0;
  int? editingMessageId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    showNavigationDrawer = MediaQuery.of(context).size.width >= 450;
  }

  void handleScreenChanged(int selectedScreen) {
    setState(() {
      screenIndex = selectedScreen;
    });
  }

  Widget buildMessageList() {
    final messageList = ref.watch(currentConversationMessagesProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
            child: ListView.separated(
                reverse: true,
                itemBuilder: (context, index) {
                  final message = messageList[index];
                  return MessageItem(message: message);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 16);
                },
                itemCount: messageList.length)),
        const Divider(),
        SafeArea(
            minimum: const EdgeInsets.only(bottom: 16, top: 16),
            bottom: true,
            top: false,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.only(left: 16),
                  child: TextField(
                    controller: ref
                        .read(currentConversationMessagesProvider.notifier)
                        .textEditingController,
                    onChanged: (value) {
                      setState(() {
                        _draft = value;
                      });
                    },
                    onSubmitted: (value) {
                      _send();
                    },
                    decoration: const InputDecoration(filled: true),
                    maxLines: 5,
                    minLines: 1,
                    // expands: true,
                  ),
                )),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 48,
                      child: IconButton(
                        onPressed: _draft.trim().isNotEmpty ? _send : null,
                        icon: const Icon(Icons.send),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                      ),
                    )
                  ],
                )
              ],
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    const conversationBody = ConversationBody();
    return Scaffold(
      appBar: showNavigationDrawer ? null : AppBar(),
      drawer: showNavigationDrawer ? null : conversationBody,
      body: showNavigationDrawer
          ? SafeArea(
              bottom: false,
              top: false,
              child: Row(
                children: <Widget>[
                  conversationBody,
                  const VerticalDivider(thickness: 1, width: 1),
                  Expanded(
                    child: buildMessageList(),
                  ),
                ],
              ),
            )
          : buildMessageList(),
    );
  }
}
