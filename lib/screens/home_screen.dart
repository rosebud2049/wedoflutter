import 'package:flutter/material.dart';
import 'package:wedoflutter/models/message_model.dart';
import 'package:wedoflutter/components/custom_list_item.dart';
import 'package:wedoflutter/screens/chat_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 8,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: const Text("Inbox"),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (BuildContext context, int index) {
          final Message chat = chats[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ChatScreen(
                  user: chat.sender,
                ),
              ),
            ),
            child: CustomListItem(
              name: chat.sender.name,
              imageUrl: chat.sender.imageUrl,
              time: chat.time,
              text: chat.text,
              unread: chat.unread,
              isOnline: chat.sender.isOnline,
            ),
          );
        },
      ),
    );
  }
}
