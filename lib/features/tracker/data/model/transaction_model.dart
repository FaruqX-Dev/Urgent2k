import 'package:cloud_firestore/cloud_firestore.dart';

enum TransactionType { income, expense }

class TransactionModel {
  final String id;
  final String userId;
  final double amount;
  final String category; // e.g., 'Food', 'Transport'
  final String note;
  final DateTime timestamp;
  final TransactionType type;

  TransactionModel({
    required this.id,
    required this.userId,
    required this.amount,
    required this.category,
    required this.note,
    required this.timestamp,
    required this.type,
  });

  // Convert a Firestore Document to a TransactionModel
  factory TransactionModel.fromMap(Map<String, dynamic> map, String documentId) {
    return TransactionModel(
      id: documentId,
      userId: map['userId'] ?? '',
      amount: (map['amount'] ?? 0.0).toDouble(),
      category: map['category'] ?? 'General',
      note: map['note'] ?? '',
      timestamp: (map['timestamp'] as Timestamp).toDate(),
      type: map['type'] == 'income' ? TransactionType.income : TransactionType.expense,
    );
  }

  // Convert a TransactionModel to a Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'amount': amount,
      'category': category,
      'note': note,
      'timestamp': Timestamp.fromDate(timestamp),
      'type': type == TransactionType.income ? 'income' : 'expense',
    };
  }


  TransactionModel copyWith({
    double? amount,
    String? category,
    String? note,
    DateTime? timestamp,
    TransactionType? type,
  }) {
    return TransactionModel(
      id: id,
      userId: userId,
      amount: amount ?? this.amount,
      category: category ?? this.category,
      note: note ?? this.note,
      timestamp: timestamp ?? this.timestamp,
      type: type ?? this.type,
    );
  }
}