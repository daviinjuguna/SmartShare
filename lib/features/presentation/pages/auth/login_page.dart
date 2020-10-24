import 'package:SmartShare/core/utils/constants.dart';
import 'package:SmartShare/core/utils/size_config.dart';
import 'package:SmartShare/features/presentation/bloc/auth/auth_bloc/auth_bloc.dart';
import 'package:SmartShare/features/presentation/bloc/auth/intro_bloc/intro_bloc.dart';
import 'package:SmartShare/features/presentation/widgets/components/already_have_an_account_check.dart';
import 'package:SmartShare/features/presentation/widgets/components/background.dart';
import 'package:SmartShare/features/presentation/widgets/components/custom_button.dart';
import 'package:SmartShare/features/presentation/widgets/components/custom_flushbar.dart';
import 'package:SmartShare/features/presentation/widgets/components/fade_animation.dart';
import 'package:SmartShare/features/presentation/widgets/components/forgot_password.dart';
import 'package:SmartShare/features/presentation/widgets/components/or_divider.dart';
import 'package:SmartShare/features/presentation/widgets/components/social_icon.dart';
import 'package:SmartShare/features/presentation/widgets/components/textfield.dart';
import 'package:SmartShare/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible;
  AuthBloc _bloc;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    _bloc = getIt<AuthBloc>();

    _emailController.addListener(() {
      _bloc.add(AuthEvent.emailChanged(_emailController.text));
    });

    _passwordController.addListener(() {
      _bloc.add(AuthEvent.passwordChanged(_passwordController.text));
    });
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider<AuthBloc>(
      create: (_) => _bloc,
      child: Scaffold(
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
        body: BlocConsumer<AuthBloc,AuthState>(
          listener: (context,state){
            if (state.isSubmitting) {
              Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  backgroundColor: Style.secondaryColor,
                  content:loadingFlashbar(
                    "Signing In",//title
                    "Please wait........",//message
                    Style.secondaryColor//color
                  ),
                )
              );
            }
            if (state.isFailure) {
              Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red[400],
                  content: errorFlushbar(
                    "Sorry, Sign in failed, check your credentials"//message
                  )
                ),
              );
            }
            if (state.isSuccess) {
              getIt<IntroBloc>()..add(IntroEvent.loggedIn());
              // Navigator.of(context).pop();
              WidgetsBinding.instance.addPostFrameCallback((_) { 
                Navigator.of(context).pushReplacementNamed("/dashboard");
              });
            }
          },

          builder: (context, state) {
          return SingleChildScrollView(
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
                                validation: (_){
                                  return !state.isEmailValid ? "Please enter a valid email" : null;
                                },
                                prefix: Icon(LineAwesomeIcons.envelope), 
                                lableText: "Email", 
                                hintText: "Enter your email")),
                              SizedBox(height: SizeConfig.safeBlockHorizontal*2,),
                              FadeAnimation(1.3, PasswordTextField(
                                obscureText: !_passwordVisible, 
                                controller: _passwordController, 
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.go,
                                onSubmitted: (_){
                                  _login();
                                },
                                validation:(_){
                                  return !state.isPasswordValid ? "Please enter alpha-numerical min of 6" :null;
                                },
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
                            press: _login, 
                            text: "Sign In",
                                  color:Style.secondaryColor,
                          )),
                          SizedBox(height: SizeConfig.safeBlockHorizontal*2,),
                          FadeAnimation(1.5, AlreadyHaveAnAccountCheck(
                            press: ()=>Navigator.of(context).pushNamed("/register"),//route to register
                            color: Style.secondaryColor)),
                          SizedBox(height: SizeConfig.safeBlockHorizontal*2,),
                          FadeAnimation(1.6, ForgotPasswordText(
                            press: ()=>Navigator.of(context).pushNamed("/reset_password"), 
                            color: Style.secondaryColor)),
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
          );}
        ),
      ),
    );
  }


  _login() {
    _bloc.add(AuthEvent.loginPressed(
      _emailController.text,
      _passwordController.text));
  }
}