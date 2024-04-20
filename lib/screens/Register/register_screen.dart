import 'package:flutter/material.dart';
import 'package:login_course_app/screens/products/product_screen.dart';
import 'package:login_course_app/utils/app_colors.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_providers.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_textstyles.dart';
import '../../widgets/custom_textfield.dart';
import '../bottom_nav/bottom_navigation_s_c.dart';

class RegistrationScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Registration'),
      ),
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40.0),
            CircleAvatar(
              backgroundColor: Colors.grey.shade100,
              radius: 50.0, // Adjust the radius as needed
              child: ClipOval(
                child: Image.asset(
                  'assets/women_working.png',
                  fit: BoxFit.cover,
                  width: 80.0,
                  height: 80.0,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'User Registration',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  CustomTextField(
                    controller: _emailController,
                    type: TextFieldType.email,
                    hintText: 'Email',
                  ),
                  const SizedBox(height: 16.0),
                  CustomTextField(
                    controller: _passwordController,
                    type: TextFieldType.password,
                    hintText: 'Password',
                  ),
                  const SizedBox(height: 16.0),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.redAccent.shade100,
                    ),
                    child: TextButton(
                      onPressed: () async {
                        bool success = await Provider.of<AuthProviders>(context,
                                listen: false)
                            .registerUser(
                          _emailController.text.trim(),
                          _passwordController.text.trim(),
                        );
                        if (success) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => BottomNavigationSC()));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 4,
                            backgroundColor: AppColors.grey,
                            content: Text(
                              "Cant Sign-in",
                              style: AppTextStyles.labelTextStyle
                                  .copyWith(color: Colors.redAccent),
                            ),
                          ));
                        }
                      },
                      child: const Text(AppStrings.register),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
