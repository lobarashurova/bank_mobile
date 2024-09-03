import 'package:cloud_firestore/cloud_firestore.dart';

class MessagesModel {
  final String id;
  final String username;
  final String message;
  final DateTime createdAt;

  MessagesModel(
      {required this.id,
      required this.username,
      required this.message,
      required this.createdAt});

  factory MessagesModel.fromFirestore(
      Map<String, dynamic> data, String documentId) {
    return MessagesModel(
        id: documentId,
        username: data['username'] ?? '',
        message: data['message'] ?? '',
        createdAt: (data['createdAt'] as Timestamp).toDate());
  }
}
