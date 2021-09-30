import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wedoflutter/models/message_model.dart';
import 'package:wedoflutter/provider/google_sign_in.dart';
import 'package:wedoflutter/widgets/custom_list_item.dart';
import 'package:wedoflutter/screens/chat_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var firestoreInstance = FirebaseFirestore
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
        actions: [
          IconButton(
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
            },
            icon: const Icon(Icons.logout),
            //label: const Text('Logout'),
          ),
        ],
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
