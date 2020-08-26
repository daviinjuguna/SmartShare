import 'package:SmartShare/core/utils/size_config.dart';
import 'package:SmartShare/features/presentation/widgets/components/fade_animation.dart';
import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {
  final Widget child;

  const CustomBackground({Key key, @required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: double.infinity,
      height: SizeConfig.screenHeight,
      child: Stack(
        children: [
          Positioned(
            height: SizeConfig.screenHeight*0.389,
            right: 0,
            left: 0,
            bottom: 0,
            child: FadeAnimation(1.2, Container(
              width: SizeConfig.screenWidth,
              decoration:BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background.png"),
                  fit: BoxFit.cover
                ),
              )
            )),
          ),
          child,
        ],
      ),
    );
  }
}