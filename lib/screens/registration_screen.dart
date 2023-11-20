import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fire_chat_app/helpers/firebase_repository.dart';
import 'package:flutter_fire_chat_app/widgets/custom_textfield.dart';

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
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
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
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        await _repo.registerViaEmailAndPassword(
          name: _nameCtrl.text,
          email: _emailCtrl.text,
          password: _passwordCtrl.text,
        );

        // ignore: use_build_context_synchronously
        _showNotification('Registration succesful!');

        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, '/login');
      } on FirebaseAuthException catch (authErr) {
        _showNotification(authErr.message ?? 'Something went wrong!');
      } catch (e) {
        _showNotification('Something went wrong!');
      }

      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 25),
                  CustomTextField(
                    controller: _nameCtrl,
                    hintText: 'Name',
                    prefixIcon: const Icon(Icons.person),
                    validator: (value) {
                      if ((value?.isEmpty ?? false) || value == null) {
                        return 'Name is required.';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: _emailCtrl,
                    hintText: 'Email',
                    prefixIcon: const Icon(Icons.email),
                    validator: (value) {
                      if ((value?.isEmpty ?? false) || value == null) {
                        return 'Email is required.';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: _passwordCtrl,
                    isObscured: _isObscuredPassword,
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.password),
                    suffixIcon: IconButton(
                      onPressed: _showHidePassword,
                      icon: _isObscuredPassword
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                    ),
                    validator: (value) {
                      if ((value?.isEmpty ?? false) || value == null) {
                        return 'Password is required.';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: _cPasswordCtrl,
                    isObscured: _isObscuredCPassword,
                    hintText: 'Confirm Password',
                    prefixIcon: const Icon(Icons.password),
                    suffixIcon: IconButton(
                      onPressed: _showHideConfirmPassword,
                      icon: _isObscuredCPassword
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                    ),
                    validator: (value) {
                      if ((value?.isEmpty ?? false) || value == null) {
                        return 'Password is required.';
                      } else if (value != _passwordCtrl.text) {
                        return 'Password mismatch.';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: 700,
                    child: ElevatedButton(
                      onPressed: _onRegister,
                      child: (_isLoading)
                          ? const CircularProgressIndicator()
                          : const Text('Register'),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: const Text('Back to Sign In'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
