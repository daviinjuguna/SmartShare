import 'package:SmartShare/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);//scale screen effectively according to ui
    return Container(
      margin: EdgeInsets.symmetric(vertical: SizeConfig.screenHeight * 0.02),
      width: SizeConfig.screenWidth * 0.8,
      child: Row(
        children: <Widget>[
          buildDivider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal*3),
            child: Text(
              "OR",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          buildDivider(),
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return Expanded(
      child: Divider(
        color: "grey".toColor(),
        height: 1.5,
      ),
    );
  }
}