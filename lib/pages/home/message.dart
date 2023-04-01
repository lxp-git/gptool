import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  Widget markdown(Message message) {
    return MarkdownBody(
        data: message.content,
        contextMenuBuilder: (context, editableTextState) =>
            AdaptiveTextSelectionToolbar.buttonItems(
              anchors: editableTextState.contextMenuAnchors,
              buttonItems: <ContextMenuButtonItem>[
                ContextMenuButtonItem(
                    onPressed: () {
                      setState(() {
                        editingController.text = message.content;
                        editingMessageId = message.id;
                      });
                    },
                    type: ContextMenuButtonType.custom,
                    label: "Edit"),
                ContextMenuButtonItem(
                  onPressed: () {
                    editableTextState
                        .copySelection(SelectionChangedCause.toolbar);
                  },
                  type: ContextMenuButtonType.copy,
                ),
                ContextMenuButtonItem(
                    onPressed: () {},
                    type: ContextMenuButtonType.custom,
                    label: "Delete"),
              ],
            ),
        selectable: true,
        shrinkWrap: true);
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
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15))
                                .copyWith(
                                    bottomRight: const Radius.circular(0)),
                        color: Theme.of(context).highlightColor),
                    child: markdown(message),
                  ),
                  onLongPress: () {},
                )
              ],
            )
          : Row(
              children: [
                Flexible(
                    flex: 4,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15))
                                  .copyWith(
                                      bottomLeft: const Radius.circular(0)),
                          color: Theme.of(context).highlightColor),
                      child: editingMessageId == message.id
                          ? Column(
                              children: [
                                TextField(
                                    maxLines: 5,
                                    minLines: 1,
                                    controller: editingController),
                                Row(
                                  children: [
                                    TextButton(
                                        onPressed: () {},
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
                            )
                          : markdown(message),
                    )),
                Flexible(flex: 1, child: Container())
              ],
            ),
    );
  }
}
