import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:urgent2k/features/tracker/data/model/transaction_model.dart';


class TransactionRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add a new transaction
  Future<void> addTransaction(TransactionModel transaction) async {
    try {
      // We use the local ID we generated to set the document ID
      await _firestore
          .collection('transactions')
          .doc(transaction.id)
          .set(transaction.toMap());
    } catch (e) {
      rethrow; // Handle this in your provider/UI
    }
  }

  // Stream of transactions for a specific day
  Stream<List<TransactionModel>> getTransactionsByDay(String userId, DateTime date) {
    // Define the 24-hour window for the selected date
    final startOfDay = DateTime(date.year, date.month, date.day, 0, 0, 0);
    final endOfDay = DateTime(date.year, date.month, date.day, 23, 59, 59);

    return _firestore
        .collection('transactions')
        .where('userId', isEqualTo: userId)
        .where('timestamp', isGreaterThanOrEqualTo: Timestamp.fromDate(startOfDay))
        .where('timestamp', isLessThanOrEqualTo: Timestamp.fromDate(endOfDay))
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => TransactionModel.fromMap(doc.data(), doc.id))
          .toList();
    });
  }

  // Edit an existing transaction
  Future<void> updateTransaction(TransactionModel transaction) async {
    await _firestore
        .collection('transactions')
        .doc(transaction.id)
        .update(transaction.toMap());
  }

  // Remove a transaction
  Future<void> deleteTransaction(String transactionId) async {
    await _firestore.collection('transactions').doc(transactionId).delete();
  }
}