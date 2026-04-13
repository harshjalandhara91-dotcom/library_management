import 'package:cloud_firestore/cloud_firestore.dart';

class BookService {
  static final _db = FirebaseFirestore.instance;
  static const _collection = 'books';

  // ── Load all books ────────────────────────────────────────────────────
  static Future<List<Map<String, dynamic>>> loadBooks() async {
    final snapshot = await _db
        .collection(_collection)
        .orderBy('createdAt', descending: true)
        .get();

    return snapshot.docs.map((doc) {
      final data = doc.data();
      data['id'] = doc.id;
      return data;
    }).toList();
  }

  // ── Add book ──────────────────────────────────────────────────────────
  static Future<void> addBook({
    required String title,
    required String author,
    required String isbn,
    required int quantity,
  }) async {
    await _db.collection(_collection).add({
      'title': title,
      'author': author,
      'isbn': isbn,
      'quantity': quantity,
      'issued': false,
      'issuedTo': null,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  // ── Update book ───────────────────────────────────────────────────────
  static Future<void> updateBook(String id, Map<String, dynamic> data) async {
    data['updatedAt'] = FieldValue.serverTimestamp();
    await _db.collection(_collection).doc(id).update(data);
  }

  // ── Delete book ───────────────────────────────────────────────────────
  static Future<void> deleteBook(String id) async {
    await _db.collection(_collection).doc(id).delete();
  }

  // ── Toggle issue/return ───────────────────────────────────────────────
  static Future<void> toggleIssue(String id, bool currentStatus) async {
    await _db.collection(_collection).doc(id).update({
      'issued': !currentStatus,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }
}