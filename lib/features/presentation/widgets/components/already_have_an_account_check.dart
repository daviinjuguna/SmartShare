import 'package:SmartShare/core/utils/size_config.dart';
import 'package:flutter/material.dart';


class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  final Color color;
  const AlreadyHaveAnAccountCheck({
    Key key,
    this.login = true,
    @required this.press, @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); 
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don’t have an account ? " : "Already have an account ? ",
          style: TextStyle(color: Colors.grey[700]),
        ),
        SizedBox(width: SizeConfig.screenWidth*0.05,),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Sign Up" : "Sign In",
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