import 'package:flutter/material.dart';

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.time,
    required this.text,
    required this.unread,
    required this.isOnline,
  }) : super(key: key);

  final String name;
  final String imageUrl;
  final String time;
  final String text;
  final bool unread;
  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: unread
                ? BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(40)),
                    // shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 5,
                      )
                    ],
                    border: Border.all(
                      width: 2,
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                : BoxDecoration(
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
              radius: 35,
              backgroundImage: AssetImage(imageUrl),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.65,
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        isOnline
                            ? Container(
                                margin: const EdgeInsets.only(left: 5),
                                width: 7,
                                height: 7,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).primaryColor,
                                ),
                              )
                            : Container(
                                child: null,
                              ),
                      ],
                    ),
                    Text(
                      time,
                      style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w300,
                          color: Colors.black54),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
