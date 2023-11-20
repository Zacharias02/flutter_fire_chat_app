import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_fire_chat_app/helpers/firebase_service.dart';
import 'package:flutter_fire_chat_app/models/message.dart';

/// This class will help you connect to Firebase Authentication and Cloud Firestore.
class FirebaseRepository {
  FirebaseRepository._();

  /// Singleton to ensure only one class instance is created.
  static final FirebaseRepository _instance = FirebaseRepository._();
  factory FirebaseRepository() => _instance;

  final FirebaseService _service = FirebaseService();

  // Sign in via Firebase Authentication and it will return a message.
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    // Sign in function
    await _service.auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // Register via Firebase Authentication
  Future<void> registerViaEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    // Register function
    final res = await _service.auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Update user's name.
    res.user?.updateDisplayName(name);

    // Sign out function
    await signOut();
  }

  // Sign out to Firebase Authentication
  Future<void> signOut() => _service.auth.signOut();

  // Send message and stores to Cloud Firestore as document.
  Future<void> sendMessage(String message) async {
    final model = Message(
      senderId: FirebaseAuth.instance.currentUser!.uid,
      senderName: FirebaseAuth.instance.currentUser!.displayName,
      message: message,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await _service.messagesRef.doc().set(model.toMap());
  }

  // Get all data from messages collection.
  Stream<QuerySnapshot<Message>> getMessages() => _service.messagesRef
      .orderBy('updatedAt', descending: true)
      .withConverter<Message>(
        fromFirestore: (snapshot, _) => Message.fromFirestore(snapshot),
        toFirestore: (model, _) => model.toMap(),
      )
      .snapshots();
}