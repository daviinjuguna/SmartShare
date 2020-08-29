import 'package:SmartShare/features/presentation/widgets/components/input_decoration.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function validation;
  final Icon prefix;
  final String lableText;
  final String hintText;

  const CustomTextField({Key key,
  @required this.obscureText,
  @required this.controller,
  @required this.keyboardType,
  this.validation,
  @required this.prefix,
  @required this.lableText,
  @required this.hintText,}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidate: true,
      autocorrect: false,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validation,
      decoration:inputDecoration(
        lableText,
        hintText,
        prefix),
    );
  }
}

class PasswordTextField extends StatelessWidget {
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function validation,onChanged;
  final Icon prefix;
  final IconButton suffix;
  final String lableText;
  final String hintText;

  const PasswordTextField({Key key,
  @required this.obscureText,
  @required this.controller,
  @required this.keyboardType,
  this.validation,
  @required this.prefix,
  @required this.suffix,
  @required this.lableText,
  @required this.hintText, 
  this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidate: true,
      autocorrect: false,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validation,
      onChanged: onChanged,
      decoration:passwordInputDecoration(
        lableText,
        hintText,
        prefix,
        suffix),
    );
  }
}