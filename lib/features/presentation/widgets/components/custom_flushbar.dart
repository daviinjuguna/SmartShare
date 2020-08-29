import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

Flushbar loadingFlashbar(
  String title,String message, Color color
){
  return Flushbar(
    title: title,
    message: message,
    showProgressIndicator: true,
    progressIndicatorBackgroundColor: Colors.white,
    flushbarPosition:FlushbarPosition.BOTTOM,
    flushbarStyle: FlushbarStyle.GROUNDED,
    reverseAnimationCurve: Curves.decelerate,
    forwardAnimationCurve: Curves.elasticOut,
    backgroundColor:color,
    icon: Icon(LineAwesomeIcons.smiling_face,color: Colors.white,),
  );
}

Flushbar errorFlushbar(
  String message,
){
  return Flushbar(
    title: "Error",
    message: message,
    flushbarPosition:FlushbarPosition.BOTTOM,
    flushbarStyle: FlushbarStyle.GROUNDED,
    reverseAnimationCurve: Curves.decelerate,
    forwardAnimationCurve: Curves.elasticOut,
    backgroundColor:Colors.red[400],
    duration: Duration(seconds: 1),
    icon: Icon(LineAwesomeIcons.frowning_face, color: Colors.white,),
    isDismissible: false,
  );
}

Flushbar successFlushbar(
  String message,
){
  return Flushbar(
    title: "Success",
    message: message,
    flushbarPosition: FlushbarPosition.BOTTOM,
    flushbarStyle: FlushbarStyle.FLOATING,
    reverseAnimationCurve: Curves.decelerate,
    forwardAnimationCurve: Curves.elasticOut,
    backgroundColor: Colors.green,
    duration: Duration(seconds: 1),
    icon: Icon(LineAwesomeIcons.laugh_face_with_beaming_eyes_1,color: Colors.white,),
  );
}