import 'package:SmartShare/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class ForgotPasswordText extends StatelessWidget {
  final Function press;
  final Color color;
  const ForgotPasswordText({
    Key key,
    @required this.press, @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); 
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Forgot password ?",
          style: TextStyle(color: Colors.grey[700]),
        ),
        SizedBox(width: SizeConfig.screenWidth*0.05,),
        GestureDetector(
          onTap: press,
          child: Text(
            "Click Here",
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}