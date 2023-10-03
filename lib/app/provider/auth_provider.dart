import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../view/home/homescreen.dart';

class AuthServices extends ChangeNotifier {
  
  create(String email, String password, String name, BuildContext context) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Created New Account')));

      String uid = value.user!.uid;
      // Add user to Firestore
      FirebaseFirestore.instance.collection('users').doc(uid).set({
        'email': email,
        'timestamp': FieldValue.serverTimestamp(),
        'name': name,
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    }).onError((error, stackTrace) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Error')));
    });
    notifyListeners();
  }

  signup(String email, String password, BuildContext context) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Login Successful')));
    }).then(
      (_) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      },
    );
    notifyListeners();
  }
}
