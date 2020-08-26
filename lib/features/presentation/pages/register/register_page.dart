import 'package:SmartShare/core/utils/size_config.dart';
import 'package:SmartShare/features/presentation/widgets/components/already_have_an_account_check.dart';
import 'package:SmartShare/features/presentation/widgets/components/background.dart';
import 'package:SmartShare/features/presentation/widgets/components/custom_button.dart';
import 'package:SmartShare/features/presentation/widgets/components/fade_animation.dart';
import 'package:SmartShare/features/presentation/widgets/components/textfield.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmation = TextEditingController();
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
      resizeToAvoidBottomInset: true,
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
          child: Container(//40=8
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal*8),
            height: SizeConfig.screenHeight - SizeConfig.safeBlockHorizontal*10,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    FadeAnimation(1, Text("Sign up", style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal*8,
                      fontWeight: FontWeight.bold
                    ),)),
                    SizedBox(height: SizeConfig.safeBlockHorizontal,),
                    FadeAnimation(1.2, Text("Create an account, It's free", style: TextStyle(
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
                      // validation: (){},
                      prefix: Icon(LineAwesomeIcons.envelope), 
                      lableText: "Email", 
                      hintText: "Enter your email")),
                    SizedBox(height: SizeConfig.safeBlockHorizontal*2,),
                    FadeAnimation(1.3, PasswordTextField(
                       obscureText: !_passwordVisible, 
                      controller: _passwordController, 
                      keyboardType: TextInputType.text,  
                      // validation:(){},
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
                    SizedBox(height: SizeConfig.safeBlockHorizontal*2,),
                    FadeAnimation(1.4, PasswordTextField(
                      obscureText: !_passwordVisible, 
                      controller: _passwordConfirmation, 
                      keyboardType: TextInputType.text,  
                      // validation:(){},
                      prefix: Icon(LineAwesomeIcons.lock),
                      suffix: IconButton(
                        icon: Icon(_passwordVisible ? LineAwesomeIcons.eye:LineAwesomeIcons.eye_slash),
                        onPressed: (){
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        }
                      ), 
                      lableText: "Confirm Password", 
                      hintText: "Confirm your password")),
                  ],
                ),
                SizedBox(height: SizeConfig.safeBlockHorizontal*3,),
                FadeAnimation(1.5, CustomButton(
                  color: Color(0xfffee56f),
                  press: (){}, 
                  text: "Sign Up")),
                SizedBox(height: SizeConfig.safeBlockHorizontal*2,),
                FadeAnimation(1.6, AlreadyHaveAnAccountCheck(
                  login: false,
                  press: ()=>Navigator.of(context).pushNamed("/login"),
                  color: Color(0xfffee56f),)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}