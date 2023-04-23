import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gptool/models/conversation.dart';

class ConversationPage extends StatefulWidget {
  const ConversationPage({super.key});
  @override
  State<ConversationPage> createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ConversationBody(),
    );
  }
}

class ConversationBody extends ConsumerWidget {
  const ConversationBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final conversations = ref.watch(conversationsProvider);
    final currentConversation = ref.watch(currentConversationProvider);
    int selectedIndex = conversations.indexOf(currentConversation);
    selectedIndex = selectedIndex == -1 ? 0 : selectedIndex;
    return Stack(children: [
      NavigationDrawer(
        onDestinationSelected: (int index) {
          ref
              .read(currentConversationProvider.notifier)
              .selectConversation(conversations[index]);
        },
        selectedIndex: selectedIndex,
        children: <Widget>[
          const SizedBox(height: 16),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
          //   child: Text(
          //     'Actions',
          //     style: Theme.of(context).textTheme.titleSmall,
          //   ),
          // ),
          TextButton(
            onPressed: () {
              ref.read(conversationsProvider.notifier).addConversation();
            },
            child: const ListTile(
              leading: Icon(Icons.add_outlined),
              title: Text('New Chat'),
              horizontalTitleGap: 0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text(
              'Conversations',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          ...conversations.map((conversation) {
            return NavigationDrawerDestination(
              label: Text(conversation.title),
              icon: const Icon(Icons.messenger_outline),
              selectedIcon: const Icon(Icons.messenger),
            );
          }),
          // const Padding(
          //   padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          //   child: Divider(),
          // ),
        ],
      ),
      Positioned(
          bottom: 0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: TextButton(
                  onPressed: () {
                    context.go("/guide");
                  },
                  onLongPress: () {
                    print("onLongPress");
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.settings,
                        size: 24,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text('Settings')
                    ],
                  ),
                ),
              )
            ],
          ))
    ]);
  }
}
