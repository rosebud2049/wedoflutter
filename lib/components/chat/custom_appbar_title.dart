import 'package:flutter/material.dart';

class CustomAppBarTitle extends StatelessWidget {
  const CustomAppBarTitle({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
              text: name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              )),
          const TextSpan(
            text: '\n',
          ),
          const TextSpan(
              text: "Online",
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w400,
              )),
        ],
      ),
    );
  }
}
