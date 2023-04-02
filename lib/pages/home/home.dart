import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gptool/models/message.dart';
import 'package:gptool/pages/conversation.dart';

import '../../utils/key_value_store_helper.dart';
import 'message.dart';

class ExampleDestination {
  const ExampleDestination(this.label, this.icon, this.selectedIcon);

  final String label;
  final Widget icon;
  final Widget selectedIcon;
}

const List<ExampleDestination> destinations = <ExampleDestination>[
  ExampleDestination(
      'page 0', Icon(Icons.widgets_outlined), Icon(Icons.widgets)),
  ExampleDestination(
      'page 1', Icon(Icons.format_paint_outlined), Icon(Icons.format_paint)),
  ExampleDestination(
      'page 2', Icon(Icons.text_snippet_outlined), Icon(Icons.text_snippet)),
  ExampleDestination(
      'page 3', Icon(Icons.invert_colors_on_outlined), Icon(Icons.opacity)),
];

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _apiKeyTextEditingController =
      TextEditingController(text: KeyValueStoreHelper().secretKey);
  String _draft = "";
  TextEditingController editingController = TextEditingController();
  // List<Message> _messageList = [];

  @override
  void initState() {}

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

  Widget buildBottomBarScaffold() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Page Index =  $screenIndex'),
          ],
        ),
      ),
      drawer: NavigationBar(
        selectedIndex: screenIndex,
        onDestinationSelected: (int index) {
          setState(() {
            screenIndex = index;
          });
        },
        destinations: destinations.map((ExampleDestination destination) {
          return NavigationDestination(
            label: destination.label,
            icon: destination.icon,
            selectedIcon: destination.selectedIcon,
            tooltip: destination.label,
          );
        }).toList(),
      ),
    );
  }

  void handleScreenChanged(int selectedScreen) {
    setState(() {
      screenIndex = selectedScreen;
    });
  }

  Widget buildLargeScreenScaffold(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        top: false,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: NavigationRail(
                minWidth: 50,
                labelType: NavigationRailLabelType.all,
                destinations:
                    destinations.map((ExampleDestination destination) {
                  return NavigationRailDestination(
                    label: Text(destination.label),
                    icon: destination.icon,
                    selectedIcon: destination.selectedIcon,
                  );
                }).toList(),
                selectedIndex: screenIndex,
                useIndicator: true,
                onDestinationSelected: (int index) {
                  setState(() {
                    screenIndex = index;
                  });
                },
              ),
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('Page Index =  $screenIndex'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
                    controller: _textEditingController,
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
                        onPressed: _draft.isNotEmpty ? _send : null,
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
    // return showNavigationDrawer
    //     ? buildLargeScreenScaffold(context)
    //     : buildBottomBarScaffold();
    final messageList = ref.watch(currentConversationMessagesProvider);
    return Scaffold(
      drawer: showNavigationDrawer
          ? null
          : NavigationBar(
              selectedIndex: screenIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  screenIndex = index;
                });
              },
              destinations: destinations.map((ExampleDestination destination) {
                return NavigationDestination(
                  label: destination.label,
                  icon: const Icon(Icons.message_outlined),
                  selectedIcon: const Icon(Icons.message_rounded),
                  tooltip: destination.label,
                );
              }).toList(),
            ),
      body: showNavigationDrawer
          ? SafeArea(
              bottom: false,
              top: false,
              child: Row(
                children: <Widget>[
                  const ConversationBody(),
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
