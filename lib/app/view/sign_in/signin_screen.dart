import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user_management_firebase/app/utils/constants.dart';
import 'package:user_management_firebase/app/view/home/homescreen.dart';

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
                    reusableTextField("Enter UserName", Icons.person, false,
                        emailEditingController),
                    const SizedBox(height: 20),
                    reusableTextField("Enter Password", Icons.lock, true,
                        passEditingController),
                    const SizedBox(height: 20),
                    signInSignUpButton(context, true, () {
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: emailEditingController.text,
                              password: passEditingController.text)
                          .then((value) {
                        // Successfully signed in
                        String uid = value.user!.uid;
                        String email = emailEditingController.text;
                        // Add user data to Firestore
                        FirebaseFirestore.instance
                            .collection('users')
                            .doc(uid)
                            .set({
                          'email': emailEditingController.text,
                          'timestamp': FieldValue
                              .serverTimestamp(), 
                        }).then((_) {
                          // Navigate to the home screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                          );
                        }).catchError((error) {
                          print(
                              "Error adding user data to Firestore: ${error.toString()}");
                        });
                      }).onError((error, stackTrace) {
                        print("Error ${error.toString()}");
                      });
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
