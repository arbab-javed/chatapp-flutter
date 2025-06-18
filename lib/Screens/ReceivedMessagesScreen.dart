import 'package:flutter/material.dart';
import '../CustomUI/ReplyCard.dart';

class ReceivedMessagesScreen extends StatelessWidget {
  const ReceivedMessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final receivedMessages = [
      {'message': 'Hello! How are you?', 'time': '10:00'},
      {'message': 'This is a received message.', 'time': '10:01'},
      {'message': 'Flutter makes UI beautiful!', 'time': '10:02'},
      {'message': 'Let\'s meet at 5 PM.', 'time': '10:05'},
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Received Messages'),
        actions: [
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Calling...'),
                  content: Text('Calling contact'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Close'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10),
        itemCount: receivedMessages.length,
        itemBuilder: (context, index) {
          final msg = receivedMessages[index];
          return ReplyCard(
            message: msg['message']!,
            time: msg['time']!,
          );
        },
      ),
    );
  }
} 