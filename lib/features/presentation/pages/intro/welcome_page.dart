import 'package:SmartShare/core/routes/router.gr.dart';
import 'package:SmartShare/core/utils/size_config.dart';
import 'package:SmartShare/features/presentation/widgets/components/custom_button.dart';
import 'package:SmartShare/features/presentation/widgets/components/fade_animation.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: SizeConfig.screenHeight,
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockHorizontal * 6,
              vertical: SizeConfig.safeBlockHorizontal * 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  FadeAnimation(
                      1,
                      Text(
                        "Welcome to eKonnect",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.safeBlockHorizontal * 8),
                      )),
                  SizedBox(height: SizeConfig.safeBlockHorizontal * 2),
                  FadeAnimation(
                      1.2,
                      Text(
                        "Please login to verify your identity",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: SizeConfig.safeBlockHorizontal * 4),
                      )),
                ],
              ),
              FadeAnimation(
                  1.4,
                  Container(
                    height: SizeConfig.screenHeight / 3,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/illustration.png"),
                      ),
                    ),
                  )),
              Column(
                children: [
                  FadeAnimation(
                      1.5,
                      CustomButton(
                          color: Color(0xff3ff7cf),
                          press: () => ExtendedNavigator.of(context)
                              .push(Routes.loginPage),
                          text: "Login")),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal * 2,
                  ),
                  FadeAnimation(
                      1.6,
                      CustomButton(
                          color: Color(0xfffee56f),
                          press: () => ExtendedNavigator.of(context)
                              .push(Routes.registerPage),
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
