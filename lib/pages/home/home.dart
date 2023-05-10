import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gptool/models/conversation.dart';
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

  late final _inputFocusNode = FocusNode(
    onKey: (FocusNode node, RawKeyEvent evt) {
      final pressEnterToSend = showNavigationDrawer;
      if (pressEnterToSend &&
          !evt.isShiftPressed &&
          evt.logicalKey.keyLabel == 'Enter') {
        if (evt is RawKeyDownEvent) {
          _send();
        }
        return KeyEventResult.handled;
      } else {
        return KeyEventResult.ignored;
      }
    },
  );

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
                      print("onSubmitted");
                      // _send();
                    },
                    textInputAction: TextInputAction.newline,
                    focusNode: _inputFocusNode,
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

  buildAppBar() {
    final conversations = ref.watch(conversationsProvider);
    return AppBar(actions: [
      if (conversations.length > 1)
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  actions: [
                    TextButton(
                        onPressed: () {
                          context.pop();
                        },
                        child: const Text("Cancel")),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          ref
                              .read(conversationsProvider.notifier)
                              .delete(ref.read(currentConversationProvider));
                        },
                        child: const Text("OK"))
                  ],
                  title: const Text("Delete this conversation?"),
                  content: const Text(
                      "The messages within this conversation will also be deleted."),
                );
              },
            );
          },
          icon: const Icon(Icons.delete_forever_outlined),
          // child: const Icon(Icons.delete_forever_outlined),
        )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    const conversationBody = ConversationBody();
    return Scaffold(
      appBar: showNavigationDrawer ? null : buildAppBar(),
      drawer: showNavigationDrawer ? null : conversationBody,
      body: showNavigationDrawer
          ? SafeArea(
              bottom: false,
              top: false,
              child: Row(
                children: <Widget>[
                  conversationBody,
                  Expanded(
                      child: Column(
                    children: [
                      buildAppBar(),
                      Expanded(child: buildMessageList()),
                    ],
                  )),
                ],
              ),
            )
          : buildMessageList(),
    );
  }
}
