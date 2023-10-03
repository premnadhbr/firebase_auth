import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management_firebase/app/provider/auth_provider.dart';
import 'package:user_management_firebase/app/utils/constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF64B5F6), Color(0xFF26A69A)], // Blue to Teal
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  reusableTextField(
                      "Username", Icons.person, false, usernameController),
                  const SizedBox(height: 20),
                  reusableTextField(
                      "Email", Icons.email, false, emailController),
                  const SizedBox(height: 20),
                  reusableTextField(
                      "Password", Icons.lock, true, passwordController),
                  signInSignUpButton(
                    context,
                    false,
                    () {
                      Provider.of<AuthServices>(context, listen: false).create(
                          emailController.text,
                          passwordController.text,
                          usernameController.text,
                          context);
                    },
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
