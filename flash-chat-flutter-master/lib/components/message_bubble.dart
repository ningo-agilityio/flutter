import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String text;
  final String sender;
  final bool isMe;

  MessageBubble({this.text, this.sender, this.isMe});

  Material getCurrentSenderMsgStyle(isMe) {
    if (isMe) {
      return Material(
        elevation: 5.0,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
        color: Colors.lightBlueAccent,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            '$text',
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.white,
            ),
          ),
        ),
      );
    } else {
      return Material(
        elevation: 5.0,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30.0),
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            '$text',
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.black45,
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              sender,
              style: TextStyle(fontSize: 12.0, color: Colors.black54),
            ),
          ),
          getCurrentSenderMsgStyle(isMe),
        ],
      ),
    );
  }
}
