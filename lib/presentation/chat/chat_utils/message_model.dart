import 'package:cloud_firestore/cloud_firestore.dart';

class MessagesModel {
  final String id;
  final String username;
  final String message;
  final int employeeId;
  final DateTime createdAt;

  MessagesModel(
      {required this.id,
      required this.username,
      required this.message,
      required this.createdAt,
      required this.employeeId});

  factory MessagesModel.fromFirestore(
      Map<String, dynamic> data, String documentId) {
    return MessagesModel(
        id: documentId,
        username: data['username'] ?? '',
        message: data['message'] ?? '',
        employeeId: data['employee_id'],
        createdAt: (data['createdAt'] as Timestamp).toDate());
  }
}
