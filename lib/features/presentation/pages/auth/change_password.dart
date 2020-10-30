import 'package:SmartShare/core/routes/router.gr.dart';
import 'package:SmartShare/core/utils/size_config.dart';
import 'package:SmartShare/features/presentation/widgets/components/background.dart';
import 'package:SmartShare/features/presentation/widgets/components/custom_button.dart';
import 'package:SmartShare/features/presentation/widgets/components/fade_animation.dart';
import 'package:SmartShare/features/presentation/widgets/components/fully_recovered.dart';
import 'package:SmartShare/features/presentation/widgets/components/textfield.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController _pinController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible;
  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }
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
          icon: Icon(LineAwesomeIcons.angle_left, size: SizeConfig.safeBlockHorizontal*6, color: Colors.black,),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: SizeConfig.screenHeight,
        child: CustomBackground(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal*8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: SizeConfig.safeBlockHorizontal*5,),
                FadeAnimation(1.1, Text("Change your password here", style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal*4,
                  color: Colors.grey[700]
                ),)),
                SizedBox(height: SizeConfig.safeBlockHorizontal*3,),
                FadeAnimation(1.2, CustomTextField(
                  obscureText: false, 
                  controller: _pinController, 
                  keyboardType: TextInputType.number, 
                          // validation: (){},
                  prefix: Icon(LineAwesomeIcons.tty), 
                  lableText: "Pin", 
                  hintText: "Enter the six digit pin")),
                  SizedBox(height: SizeConfig.safeBlockHorizontal*2,),
                  FadeAnimation(1.3, PasswordTextField(
                    obscureText: !_passwordVisible,
                    controller: _passwordController,
                    keyboardType: TextInputType.text,
                    prefix: Icon(LineAwesomeIcons.lock),
                    suffix: IconButton(
                      icon: Icon(_passwordVisible ? LineAwesomeIcons.eye:LineAwesomeIcons.eye_slash),
                      onPressed: (){
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      }
                    ),
                    lableText: "New Password",
                    hintText: "Enter the new password")),
                  SizedBox(height: SizeConfig.safeBlockHorizontal*3,),
                  FadeAnimation(1.3, buildMaterialButton(
                    false, //then color is transparent whether anything,since default button is false
                    "Submit",
                    (){}, 
                    Colors.white
                  )),
                  SizedBox(height: SizeConfig.safeBlockHorizontal,),
                  FadeAnimation(1.4,
                    RecoveredPasswordText(
                      press: ()=>ExtendedNavigator.of(context).replace(Routes.loginPage), 
                      color: Color(0xfffee56f),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}