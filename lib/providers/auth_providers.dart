import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_course_app/screens/products/product_screen.dart';

class AuthProviders extends ChangeNotifier {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Login successful
      print('User logged in: ${userCredential.user}');
    } on FirebaseAuthException catch (e) {

      print('Login failed: ${e.message}');
      throw e.message.toString();
    } catch (e) {
      // Handle other errors
      print('Login failed: $e');
      throw 'Login failed. Please try again later.';
    }
  }


  Future<bool> registerUser(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      // Handle specific FirebaseAuthException errors
      print('Registration failed: ${e.message}');
      return false;
    } catch (e) {
      // Handle other errors
      print('Registration failed: $e');
      return false;
    }
  }

}
