import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management_firebase/app/provider/auth_provider.dart';
import 'package:user_management_firebase/app/utils/constants.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: double.infinity,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    reusableTextField("Enter Email", Icons.person, false,
                        emailEditingController),
                    const SizedBox(height: 20),
                    reusableTextField("Enter Password", Icons.lock, true,
                        passEditingController),
                    const SizedBox(height: 20),
                    signInSignUpButton(context, true, () {
                      Provider.of<AuthServices>(context, listen: false).signup(
                          emailEditingController.text,
                          passEditingController.text,
                          context);
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    signupOption(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
