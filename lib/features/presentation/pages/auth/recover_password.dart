import 'package:SmartShare/core/routes/router.gr.dart';
import 'package:SmartShare/core/utils/size_config.dart';
import 'package:SmartShare/features/presentation/widgets/components/background.dart';
import 'package:SmartShare/features/presentation/widgets/components/custom_button.dart';
import 'package:SmartShare/features/presentation/widgets/components/fade_animation.dart';
import 'package:SmartShare/features/presentation/widgets/components/textfield.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class RecoverPassword extends StatefulWidget {
  RecoverPassword({Key key}) : super(key: key);

  @override
  _RecoverPasswordState createState() => _RecoverPasswordState();
}

class _RecoverPasswordState extends State<RecoverPassword> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            LineAwesomeIcons.angle_left,
            size: SizeConfig.safeBlockHorizontal * 6,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: SizeConfig.screenHeight,
        child: CustomBackground(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal * 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 5,
                ),
                FadeAnimation(
                    1.1,
                    Text(
                      "Recover your password here",
                      style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 4,
                          color: Colors.grey[700]),
                    )),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 3,
                ),
                FadeAnimation(
                    1.2,
                    CustomTextField(
                        obscureText: false,
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        // validation: (){},
                        prefix: Icon(LineAwesomeIcons.envelope),
                        lableText: "Email",
                        hintText: "Enter your email")),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 2,
                ),
                FadeAnimation(
                    1.3,
                    buildMaterialButton(
                        false, //then color is transparent whether anything,since default button is false
                        "Submit",
                        () => ExtendedNavigator.of(context)
                            .push(Routes.changePassword),
                        Colors.white)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
