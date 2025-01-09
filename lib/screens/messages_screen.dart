// File: screens/messages_screen.dart
import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: 10, // Replace with dynamic message count
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text('${index + 1}'),
            ),
            title: Text('Message ${index + 1}'),
            subtitle: Text('This is the detail of message ${index + 1}.'),
            onTap: () {
              // Handle message tap
            },
          );
        },
      ),
    );
  }
}
