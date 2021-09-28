import 'package:flutter/material.dart';

class RightChatBubbleFooter extends StatelessWidget {
  const RightChatBubbleFooter(
      {Key? key, required this.imageUrl, required this.time})
      : super(key: key);

  final String imageUrl;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          time,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black45,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            //borderRadius: const BorderRadius.all(Radius.circular(40)),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
              )
            ],
          ),
          child: CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage(imageUrl),
          ),
        ),
      ],
    );
  }
}
