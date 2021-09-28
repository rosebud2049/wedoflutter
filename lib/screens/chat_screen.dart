import 'package:flutter/material.dart';
import 'package:wedoflutter/models/message_model.dart';
import 'package:wedoflutter/models/user_model.dart';
import 'package:wedoflutter/components/chat/right_chat_bubble.dart';
import 'package:wedoflutter/components/chat/right_chat_bubble_footer.dart';
import 'package:wedoflutter/components/chat/left_chat_bubble.dart';
import 'package:wedoflutter/components/chat/left_chat_bubble_footer.dart';
import 'package:wedoflutter/components/chat/message_input_area.dart';
import 'package:wedoflutter/components/chat/custom_appbar_title.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _renderChatBubble(Message message, bool isMe, bool isSameUser) {
    if (isMe) {
      return Column(
        children: [
          RightChatBubble(text: message.text),
          !isSameUser
              ? RightChatBubbleFooter(
                  imageUrl: message.sender.imageUrl, time: message.time)
              : Container(
                  child: null,
                ),
        ],
      );
    } else {
      return Column(
        children: [
          LeftChatBubble(text: message.text),
          !isSameUser
              ? LeftChatBubbleFooter(
                  imageUrl: message.sender.imageUrl, time: message.time)
              : Container(
                  child: null,
                ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    int previousUserId = -1;
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: CustomAppBarTitle(
          name: widget.user.name,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.all(20),
              itemBuilder: (BuildContext context, int index) {
                final Message message = messages[index];
                final bool isMe = message.sender.id == currentUser.id;
                final bool isSameUser = previousUserId == message.sender.id;
                previousUserId = message.sender.id;
                return _renderChatBubble(message, isMe, isSameUser);
              },
              itemCount: messages.length,
            ),
          ),
          const MessageInputArea()
        ],
      ),
    );
  }
}
