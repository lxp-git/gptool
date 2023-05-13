import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gptool/widgets/context_menu_region.dart';

import '../../models/message.dart';
import '../../utils/utils.dart';

class MessageItem extends ConsumerStatefulWidget {
  final Message message;
  const MessageItem({super.key, required this.message});

  @override
  _MessageItemState createState() => _MessageItemState();
}

class _MessageItemState extends ConsumerState<MessageItem> {
  int? editingMessageId;
  TextEditingController editingController = TextEditingController();

  Widget markdown(Message message, Decoration? decoration) {
    return editingMessageId == message.id
        ? Container(
            padding: const EdgeInsets.all(16),
            decoration: decoration,
            child: Column(
              children: [
                TextField(
                    maxLines: 5, minLines: 1, controller: editingController),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          ref
                              .read(
                                  currentConversationMessagesProvider.notifier)
                              .updateMessage(editingController.text, message);
                        },
                        child: const Text("Save")),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            editingMessageId = null;
                          });
                        },
                        child: const Text("Cancel"))
                  ],
                )
              ],
            ))
        : ContextMenuRegion(
            contextMenuBuilder: (BuildContext context, Offset offset) =>
                AdaptiveTextSelectionToolbar.buttonItems(
                  anchors: TextSelectionToolbarAnchors(
                    primaryAnchor: offset,
                  ),
                  buttonItems: <ContextMenuButtonItem>[
                    ...message.map(
                        text: (value) => [
                              ContextMenuButtonItem(
                                  onPressed: () {
                                    setState(() {
                                      editingController.text = message.content;
                                      editingMessageId = message.id;
                                    });
                                  },
                                  type: ContextMenuButtonType.custom,
                                  label: "Edit"),
                            ],
                        openAI: (value) => []),
                    ...message.map(
                        text: (value) => [
                              ContextMenuButtonItem(
                                  onPressed: () {
                                    ref
                                        .read(
                                            currentConversationMessagesProvider
                                                .notifier)
                                        .delete(message);
                                  },
                                  type: ContextMenuButtonType.custom,
                                  label: "Delete")
                            ],
                        openAI: (value) => []),
                  ],
                ),
            child: Container(
                padding: const EdgeInsets.all(16),
                decoration: decoration,
                child: MarkdownBody(
                    data: message.content,
                    selectable: true,
                    shrinkWrap: true)));
  }

  @override
  Widget build(BuildContext context) {
    final message = widget.message;
    return Container(
      padding: const EdgeInsets.all(16),
      child: isMe(message.userId)
          ? Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(flex: 1, child: Container()),
                Flexible(
                    flex: 4,
                    child: markdown(
                      message,
                      BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15))
                                  .copyWith(
                                      bottomRight: const Radius.circular(0)),
                          color: Theme.of(context).highlightColor),
                    ))
              ],
            )
          : Row(
              children: [
                Flexible(
                    flex: 4,
                    child: markdown(
                      message,
                      BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15))
                                  .copyWith(
                                      bottomLeft: const Radius.circular(0)),
                          color: Theme.of(context).highlightColor),
                    )),
                Flexible(flex: 1, child: Container())
              ],
            ),
    );
  }
}
