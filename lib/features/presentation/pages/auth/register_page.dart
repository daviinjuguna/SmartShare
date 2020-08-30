import 'package:SmartShare/core/utils/constants.dart';
import 'package:SmartShare/core/utils/size_config.dart';
import 'package:SmartShare/features/presentation/bloc/auth/auth_bloc/auth_bloc.dart';
import 'package:SmartShare/features/presentation/bloc/auth/intro_bloc/intro_bloc.dart';
import 'package:SmartShare/features/presentation/widgets/components/already_have_an_account_check.dart';
import 'package:SmartShare/features/presentation/widgets/components/background.dart';
import 'package:SmartShare/features/presentation/widgets/components/custom_button.dart';
import 'package:SmartShare/features/presentation/widgets/components/custom_flushbar.dart';
import 'package:SmartShare/features/presentation/widgets/components/fade_animation.dart';
import 'package:SmartShare/features/presentation/widgets/components/textfield.dart';
import 'package:SmartShare/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final _key = GlobalKey<FormState>();
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
          listener: (context, state) {
            if (state.isSubmitting) {
              Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  backgroundColor: Style.primaryColor,
                  content:loadingFlashbar(
                    "Signing Up",//title
                    "Please wait........",//message
                    Style.primaryColor//color
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
                    "Sorry, Sign up failed, check your credentials"//message
                  )
                ),
              );
            }
            if (state.isSuccess) {
              getIt<IntroBloc>().add(IntroEvent.loggedIn());
              // Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed("/dashboard");
            }
          },

          builder: (context, state) {
          return SingleChildScrollView(
            child: CustomBackground(
              child: Container(//40=8
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal*8),
                height: SizeConfig.screenHeight - SizeConfig.safeBlockHorizontal*10,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Form(
                      key: _key,
                      child: Column(
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
                        SizedBox(height: SizeConfig.safeBlockHorizontal*2,),
                        FadeAnimation(1.4, PasswordTextField(
                          obscureText: !_passwordVisible, 
                          controller: _passwordConfirmation,
                          textInputAction: TextInputAction.go,
                          onSubmitted: (_){
                            _register();
                          },
                          keyboardType: TextInputType.text,  
                          prefix: Icon(LineAwesomeIcons.lock),
                          validation: (v){
                            if(v.trim() != _passwordController.text){
                                return "Passwords do not match";
                            }else{
                              return null;
                            }
                          },
                          onChanged: (v){
                            if(v.trim() != _passwordController.text)
                              return "Passwords do not match";
                          },
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
                      color: Style.primaryColor,
                      press: (){
                        if (_key.currentState.validate()) {
                          print("is valid");
                          _register();
                        }
                      }, 
                      text: "Sign Up")),
                    SizedBox(height: SizeConfig.safeBlockHorizontal*2,),
                    FadeAnimation(1.6, AlreadyHaveAnAccountCheck(
                      login: false,
                      press: ()=>Navigator.of(context).pushNamed("/login"),
                      color: Style.primaryColor,)),
                  ],
                ),
              ),
            ),
          );}
        ),
      ),
    );
  }

  void _register(){
    _bloc.add(AuthEvent.registerPressed(
      _emailController.text, 
      _passwordController.text, 
      _passwordConfirmation.text));
  }

}