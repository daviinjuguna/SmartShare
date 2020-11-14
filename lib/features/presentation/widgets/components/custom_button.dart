import 'package:SmartShare/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key key, @required this.press, @required this.text, this.color})
      : super(key: key);

  final Function press;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      padding: EdgeInsets.only(
          top: SizeConfig.safeBlockHorizontal * 3 / 5,
          left: SizeConfig.safeBlockHorizontal * 3 / 5),
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(SizeConfig.safeBlockHorizontal * 10),
          border: Border(
            bottom: BorderSide(color: Colors.black),
            top: BorderSide(color: Colors.black),
            left: BorderSide(color: Colors.black),
            right: BorderSide(color: Colors.black),
          )),
      child: buildMaterialButton(
          true, //defaultButton
          text,
          press,
          color),
    );
  }
}

MaterialButton buildMaterialButton(
    bool defaultButton, String text, Function press, Color color) {
  return MaterialButton(
    minWidth: double.infinity,
    height: SizeConfig.safeBlockHorizontal * 12,
    onPressed: press,
    color: defaultButton ? color : Colors.transparent,
    elevation: 0,
    shape: defaultButton
        ? RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(SizeConfig.safeBlockHorizontal * 10))
        : RoundedRectangleBorder(
            side: BorderSide(color: Colors.black),
            borderRadius:
                BorderRadius.circular(SizeConfig.safeBlockHorizontal * 10)),
    child: Text(
      text,
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
    ),
  );
}
