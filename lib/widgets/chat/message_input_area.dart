import 'package:flutter/material.dart';

class MessageInputArea extends StatelessWidget {
  const MessageInputArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 70,
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.photo),
            iconSize: 25,
            color: Theme.of(context).primaryColor,
          ),
          const Expanded(
            child: TextField(
              decoration: InputDecoration.collapsed(
                hintText: 'Envoyer un message',
              ),
              textCapitalization: TextCapitalization.sentences,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.send),
            iconSize: 25,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
