import 'package:flutter/material.dart';
import 'package:login_course_app/screens/bottom_nav/bottom_navigation_s_c.dart';
import 'package:login_course_app/utils/app_strings.dart';
import 'package:login_course_app/utils/app_textstyles.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_providers.dart';
import '../../utils/app_colors.dart';
import '../../widgets/custom_textfield.dart';
import '../Register/register_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(

          surfaceTintColor: AppColors.whiteColor,
          elevation: 0,
          leading: IconButton(
              onPressed: () {}, icon: const Icon(Icons.arrow_back_ios_rounded)),
        ),
      ),
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.65,
                width: MediaQuery.of(context).size.width * 0.85,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade100,
                      radius: 50.0,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/women_working.png',
                          fit: BoxFit.cover,
                          width: 80.0,
                          height: 80.0,
                        ),
                      ),
                    ),
                    const Text(
                      AppStrings.log_in,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0,
                      ),
                    ),
                    // Email Field
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          AppStrings.email,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        CustomTextField(
                          controller: _emailController,
                          type: TextFieldType.email,
                          hintText:  AppStrings.email,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          AppStrings.passwordHint,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        CustomTextField(
                          controller: _passwordController,
                          type: TextFieldType.password,
                          hintText:  AppStrings.email,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(color: AppColors.darkGrey),
                          ),
                        ),
                      ],
                    ),
                    // Login Button
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.redAccent.shade100,
                      ),
                      child: TextButton(
                        onPressed: () async {
                          try {
                            await Provider.of<AuthProviders>(context,
                                    listen: false)
                                .login(_emailController.text.trim(),
                                    _passwordController.text.trim());
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        BottomNavigationSC()));
                          } catch (error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                elevation: 4,
                                backgroundColor: AppColors.grey,
                                content: Text(
                                  error.toString(),
                                  style: AppTextStyles.labelTextStyle
                                      .copyWith(color: Colors.redAccent),
                                ),
                              ),
                            );
                          }
                        },
                        child: const Text(
                          AppStrings.login,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5.0),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 14.0),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => RegistrationScreen()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Do not have an account?',
                    style: TextStyle(
                      color: AppColors.iconGrey,
                    ),
                  ),
                  Text(
                    ' Sign up',
                    style: TextStyle(
                        color: AppColors.darkGrey,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
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
