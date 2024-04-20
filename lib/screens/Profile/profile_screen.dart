import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_course_app/screens/login/login_screen.dart';
import 'package:login_course_app/utils/app_textstyles.dart';

import '../../utils/app_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});


  Future<void> _logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: AppTextStyles.appBarTextStyle,
        centerTitle: true,
        title: const Text(AppStrings.profile),
      ),
      body: SingleChildScrollView( // Allow scrolling if content overflows
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          children: [
            _buildProfilePicture(),
            const SizedBox(height: 20.0), // Spacing between sections
            _buildUserInfoSection(),
            const SizedBox(height: 30.0), // Spacing before logout
            ElevatedButton.icon(
              onPressed: () => _logout(context),
              icon: const Icon(Icons.logout, color: Colors.red),
              label: const Text(AppStrings.logout, style: TextStyle(color: Colors.red)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Adjust background color if needed
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfilePicture() {

    return const CircleAvatar(
      radius: 50.0,
      backgroundImage: AssetImage('assets/women_working.png'),
    );
  }

  Widget _buildUserInfoSection() {
    return const Column(
      children: [
        Card(
          child: ListTile(
            title: Text('Mohammed EK'),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('mohammedek159@gmail.com'),
          ),
        ),
      ],
    );
  }
}