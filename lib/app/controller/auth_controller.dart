import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view/home/homescreen.dart';

class AuthServices extends ChangeNotifier {
  create(String email, String password, BuildContext context) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Created New Account')));

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    }).onError((error, stackTrace) {
      print('Error ${error.toString()}');
    });
    notifyListeners();
  }

  signup(String email, String password, BuildContext context) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      // Successfully signed in
      String uid = value.user!.uid;

      // Add user data to Firestore
      FirebaseFirestore.instance.collection('users').doc(uid).set({
        'email': email,
        'timestamp': FieldValue.serverTimestamp(),
      }).then((_) {
        // Navigate to the home screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }).catchError((error) {
        print("Error adding user data to Firestore: ${error.toString()}");
      });
    }).onError((error, stackTrace) {
      print("Error ${error.toString()}");
    });
    notifyListeners();
  }
}
