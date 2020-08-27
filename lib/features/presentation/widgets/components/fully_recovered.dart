import 'package:SmartShare/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class RecoveredPasswordText extends StatelessWidget {
  final Function press;
  final Color color;
  const RecoveredPasswordText({
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
          "Changed your password ?",
          style: TextStyle(color: Colors.grey[700]),
        ),
        SizedBox(width: SizeConfig.screenWidth*0.05,),
        GestureDetector(
          onTap: press,
          child: Text(
            "Sign Up",
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