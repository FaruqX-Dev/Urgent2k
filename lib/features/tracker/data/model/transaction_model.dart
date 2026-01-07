// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

enum TransactionType { income, expense }
class TransactionModel {
  final String id;
  final double amount;
  final String category;
  final DateTime timeStamp;
  final String note;
 final String type;
  TransactionModel({
    required this.id,
    required this.amount,
    required this.category,
    required this.timeStamp,
    required this.note,
    required this.type,
  });
 
  

  TransactionModel copyWith({
    String? id,
    double? amount,
    String? category,
    DateTime? timeStamp,
    String? note,
    String? type,
  }) {
    return TransactionModel(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      category: category ?? this.category,
      timeStamp: timeStamp ?? this.timeStamp,
      note: note ?? this.note,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'amount': amount,
      'category': category,
      'timeStamp': timeStamp.millisecondsSinceEpoch,
      'note': note,
      'type': type,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id'] as String,
      amount: map['amount'] as double,
      category: map['category'] as String,
      timeStamp: DateTime.fromMillisecondsSinceEpoch(map['timeStamp'] as int),
      note: map['note'] as String,
      type: map['type'] as String,
    );
  }

}