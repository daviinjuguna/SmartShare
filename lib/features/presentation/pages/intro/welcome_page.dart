import 'package:SmartShare/core/utils/size_config.dart';
import 'package:SmartShare/features/presentation/widgets/components/custom_button.dart';
import 'package:SmartShare/features/presentation/widgets/components/fade_animation.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: SizeConfig.screenHeight,
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal*6,vertical: SizeConfig.safeBlockHorizontal*10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  FadeAnimation(1, Text("Welcome", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.safeBlockHorizontal*8
                  ),)),
                  SizedBox(height: SizeConfig.safeBlockHorizontal*2),
                  FadeAnimation(1.2, Text("Automatic identity verification which enables you to verify your identity", 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: SizeConfig.safeBlockHorizontal*4
                  ),)),
                ],
              ),
              FadeAnimation(1.4, Container(
                height: SizeConfig.screenHeight/3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/illustration.png"),
                  ),
                ),
              )),
              Column(
                children: [
                  FadeAnimation(1.5, CustomButton(
                    color: Color(0xff3ff7cf),
                    press: ()=>Navigator.of(context).pushNamed("/login"), 
                    text: "Login")),
                  SizedBox(height: SizeConfig.safeBlockHorizontal*2,),
                  FadeAnimation(1.6, CustomButton(
                    color: Color(0xfffee56f),
                    press: ()=>Navigator.of(context).pushNamed("/register"), 
                    text: "Register"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}