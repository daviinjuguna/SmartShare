import 'package:SmartShare/core/utils/size_config.dart';
import 'package:SmartShare/features/presentation/widgets/components/already_have_an_account_check.dart';
import 'package:SmartShare/features/presentation/widgets/components/background.dart';
import 'package:SmartShare/features/presentation/widgets/components/custom_button.dart';
import 'package:SmartShare/features/presentation/widgets/components/fade_animation.dart';
import 'package:SmartShare/features/presentation/widgets/components/forgot_password.dart';
import 'package:SmartShare/features/presentation/widgets/components/or_divider.dart';
import 'package:SmartShare/features/presentation/widgets/components/social_icon.dart';
import 'package:SmartShare/features/presentation/widgets/components/textfield.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
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
      body: SingleChildScrollView(
        child: CustomBackground(
          child: Container(
            height: SizeConfig.screenHeight,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal*8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          FadeAnimation(1, Text("Sign In", style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal*8,
                            fontWeight: FontWeight.bold
                          ),)),
                          SizedBox(height: SizeConfig.safeBlockHorizontal,),
                          FadeAnimation(1.2, Text("Login to your account", style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal*4,
                            color: Colors.grey[700]
                          ),)),
                        ],
                      ),
                      SizedBox(height: SizeConfig.safeBlockHorizontal*3,),
                      Column(
                        children: [
                          FadeAnimation(1.2, CustomTextField(
                            obscureText: false,
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
//                          validation: (){},
                            prefix: Icon(LineAwesomeIcons.envelope), 
                            lableText: "Email", 
                            hintText: "Enter your email")),
                          SizedBox(height: SizeConfig.safeBlockHorizontal*2,),
                          FadeAnimation(1.3, PasswordTextField(
                            obscureText: !_passwordVisible, 
                            controller: _passwordController, 
                            keyboardType: TextInputType.text,  
//                          validation:(){},
                            prefix: Icon(LineAwesomeIcons.lock),
                            suffix: IconButton(
                              icon: Icon(_passwordVisible ? LineAwesomeIcons.eye:LineAwesomeIcons.eye_slash),
                              onPressed: (){
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              }
                            ), 
                            lableText: "Password", 
                            hintText: "Enter your password")),
                        ],
                      ),
                      SizedBox(height: SizeConfig.safeBlockHorizontal*3,),
                      FadeAnimation(1.4, CustomButton(
                        press: ()=>Navigator.of(context).pushReplacementNamed("/dashboard"), 
                        text: "Sign In",
                              color:Color(0xff3ff7cf),
                      )),
                      SizedBox(height: SizeConfig.safeBlockHorizontal*2,),
                      FadeAnimation(1.5, AlreadyHaveAnAccountCheck(
                        press: ()=>Navigator.of(context).pushNamed("/register"),//route to register
                        color: Color(0xff3ff7cf))),
                      SizedBox(height: SizeConfig.safeBlockHorizontal*2,),
                      FadeAnimation(1.6, ForgotPasswordText(
                        press: ()=>Navigator.of(context).pushNamed("/reset_password"), 
                        color: Color(0xff3ff7cf))),
                    ],
                  ),
                ),
                FadeAnimation(1.7, OrDivider()),
                FadeAnimation(1.8, Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocalIcon(
                      iconSrc: "assets/icons/facebook.svg",
                      press: (){},
                    ),
                    SocalIcon(
                      iconSrc: "assets/icons/twitter.svg",
                      press: (){},
                    ),
                    SocalIcon(
                      iconSrc: "assets/icons/google-plus.svg",
                      press: (){},
                    ),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}