import 'package:SmartShare/features/presentation/bloc/auth/intro_bloc/intro_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {//handle authentication 
  @override
  Widget build(BuildContext context) {
    return BlocListener<IntroBloc,IntroState>(
      listener: (context, state) { 
        // state.map(
        //   initial: (_){},
        //   authenticated: (_)=> Navigator.of(context).pushReplacementNamed("/dashboard"),
        //   unauthenticated: (_)=>Navigator.of(context).pushReplacementNamed("/welcome"),
        //   error: (_){}
        // );

        if(state is Authenticated) Navigator.of(context).pushReplacementNamed("/dashboard");
        if(state is Unauthenticated)Navigator.of(context).pushReplacementNamed("/welcome");
      },
      child: Container(),
    );
  }
}