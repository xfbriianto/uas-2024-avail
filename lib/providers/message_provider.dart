// File: providers/message_provider.dart

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/message_model.dart';

class MessageProvider with ChangeNotifier {
  List<Message> _messages = [];

  List<Message> get messages => _messages;

  // Load messages from a static JSON file
  Future<void> loadMessages() async {
    try {
      final String response = await rootBundle.loadString('assets/data/datamessage.json');
      final List<dynamic> data = json.decode(response);
      _messages = data.map((json) => Message.fromJson(json)).toList();
      notifyListeners();
    } catch (error) {
      throw Exception('Failed to load messages: $error');
    }
  }

  // Add a new message
  void addMessage(Message message) {
    _messages.add(message);
    notifyListeners();
  }

  // Find messages by user ID
  List<Message> getMessagesByUser(String userId) {
    return _messages.where((message) => message.senderId == userId || message.recipientId == userId).toList();
  }
}