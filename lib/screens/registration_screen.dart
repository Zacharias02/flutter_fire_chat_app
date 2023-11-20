import 'package:flutter/material.dart';
import 'package:flutter_fire_chat_app/helpers/firebase_repository.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseRepository _repo = FirebaseRepository();

  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();
  final TextEditingController _cPasswordCtrl = TextEditingController();

  bool _isObscuredPassword = true;
  bool _isObscuredCPassword = true;

  bool _isLoading = false;

  void _showNotification(String message) {
    //TODO (6): Implement notification when
    // showing an error upong signing in.
  }

  void _showHidePassword() {
    setState(() {
      _isObscuredPassword = !_isObscuredPassword;
    });
  }

  void _showHideConfirmPassword() {
    setState(() {
      _isObscuredCPassword = !_isObscuredCPassword;
    });
  }

  Future<void> _onRegister() async {
    //TODO (7): Implement registration in process.
  }

  @override
  Widget build(BuildContext context) {
    //TODO (8): Design your registration screen.
    return const Scaffold(
      body: Center(child: Placeholder()),
    );
  }
}
