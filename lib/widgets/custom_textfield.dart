import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_course_app/utils/app_colors.dart';

enum TextFieldType { email, password }

class CustomTextField extends StatefulWidget {
  final TextFieldType type;
  final String? hintText;
  final TextEditingController? controller;

  const CustomTextField({
    required this.type,
    this.hintText,
    this.controller,
    super.key,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.type == TextFieldType.email ? TextInputType.emailAddress : TextInputType.text,
      obscureText: widget.type == TextFieldType.password ? _obscureText : false,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.grey.withOpacity(0.2),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.grey.withOpacity(0.2),
          )
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: AppColors.grey.withOpacity(0.2),
            )
        ),
        hintText: widget.hintText,
        prefixIcon: widget.type == TextFieldType.email ?
         Icon(Icons.mail_outline_outlined,color: AppColors.iconGrey,) :  Icon(Icons.lock_outline,color: AppColors.iconGrey,),
        suffixIcon: widget.type == TextFieldType.password
            ? IconButton(
          icon: Icon(_obscureText ? Icons.visibility_outlined : Icons.visibility_off,color: AppColors.iconGrey,),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        )
            : null,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
