import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String? senderId;
  final String? senderName;
  final String? message;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Message({
    this.senderId,
    this.senderName,
    this.message,
    this.createdAt,
    this.updatedAt,
  });

  Message copyWith({
    String? senderId,
    String? senderName,
    String? message,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Message(
      senderId: senderId ?? this.senderId,
      senderName: senderName ?? this.senderName,
      message: message ?? this.message,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (senderId != null) {
      result.addAll({'senderId': senderId});
    }
    if (senderName != null) {
      result.addAll({'senderName': senderName});
    }
    if (message != null) {
      result.addAll({'message': message});
    }
    if (createdAt != null) {
      result.addAll({'createdAt': Timestamp.fromDate(createdAt!)});
    }
    if (updatedAt != null) {
      result.addAll({'updatedAt': Timestamp.fromDate(updatedAt!)});
    }

    return result;
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      senderId: map['senderId'],
      senderName: map['senderName'],
      message: map['message'],
      createdAt: map['createdAt'] != null
          ? (map['createdAt'] as Timestamp).toDate()
          : null,
      updatedAt: map['updatedAt'] != null
          ? (map['updatedAt'] as Timestamp).toDate()
          : null,
    );
  }

  factory Message.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final json = {...snapshot.data()!};

    return Message.fromMap(json);
  }
}