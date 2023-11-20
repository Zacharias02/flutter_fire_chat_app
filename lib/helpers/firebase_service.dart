import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_fire_chat_app/helpers/firebase_options.dart';

class FirebaseService {
  FirebaseService._();

  /// Singleton to ensure only one class instance is created.
  static final FirebaseService _instance = FirebaseService._();
  factory FirebaseService() => _instance;

  /// This function will intialize Firebase to your Flutter project.
  static Future<void> init() async => await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);

  // --- Firebase Authentication --- //

  /// This will get your FirebaseAuth instance and will
  /// help check whether your signed in or not.
  FirebaseAuth get auth => _auth;

  /// This will get your user credentials
  /// after successful sign in.
  User? get user => _currentUser;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final User? _currentUser = FirebaseAuth.instance.currentUser;

  // --- Cloud Firestore --- //

  /// This will get firestore reference for messages collection.
  CollectionReference get messagesRef => _messages;

  // Initialize references
  final _messages = FirebaseFirestore.instance.collection('messages');
}