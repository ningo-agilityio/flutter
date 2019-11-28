import 'package:flash_chat/components/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageStream extends StatelessWidget {
  final Firestore fireStore;
  final loggedInUser;

  MessageStream({this.fireStore, this.loggedInUser});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: fireStore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        // Reverse the order of list message
        final messages = snapshot.data.documents;
        List<MessageBubble> messagesWidgets = [];
        for (var msg in messages) {
          final text = msg.data['text'];
          final sender = msg.data['sender'];
          final current = loggedInUser.email;

          messagesWidgets.add(
            MessageBubble(
              text: text,
              sender: sender,
              isMe: current == sender,
            ),
          );
        }
        return Expanded(
          child: ListView(
            // Scrollable list view
            children: messagesWidgets,
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 20.0,
            ),
          ),
        );
      },
    );
  }
}
