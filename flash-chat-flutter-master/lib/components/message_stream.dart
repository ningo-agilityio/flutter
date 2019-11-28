import 'package:flash_chat/components/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageStream extends StatelessWidget {
  const MessageStream({
    Key key,
    @required Firestore fireStore,
  })  : _fireStore = fireStore,
        super(key: key);

  final Firestore _fireStore;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _fireStore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data.documents;
        List<MessageBubble> messagesWidgets = [];
        for (var msg in messages) {
          final text = msg.data['text'];
          final sender = msg.data['sender'];
          messagesWidgets.add(
            MessageBubble(
              text: text,
              sender: sender,
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
