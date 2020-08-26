import 'package:SmartShare/core/utils/size_config.dart';
import 'package:flutter/material.dart';

InputDecoration passwordInputDecoration(
  String lableText,String hintText, Icon prefix,IconButton suffix
){
  return InputDecoration(
    labelText: lableText,
    hintText: hintText,
    prefixIcon: prefix,
    suffixIcon: suffix,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal*6),
    ),
  );
}

InputDecoration inputDecoration(
  String lableText,String hintText, Icon prefix,
){
  return InputDecoration(
    labelText: lableText,
    hintText: hintText,
    prefixIcon: prefix,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal*6),
    ),
  );
}