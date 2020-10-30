import 'dart:io';

import 'package:SmartShare/core/routes/router.gr.dart';
import 'package:SmartShare/core/utils/constants.dart';
import 'package:SmartShare/core/utils/size_config.dart';
import 'package:SmartShare/features/presentation/bloc/auth/auth_bloc/auth_bloc.dart';
import 'package:SmartShare/features/presentation/widgets/components/custom_button.dart';
import 'package:SmartShare/features/presentation/widgets/components/custom_flushbar.dart';
import 'package:SmartShare/features/presentation/widgets/components/textfield.dart';
import 'package:SmartShare/injection.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class SaveUserInfoScreen extends StatefulWidget {
  SaveUserInfoScreen({Key key}) : super(key: key);

  @override
  _SaveUserInfoScreenState createState() => _SaveUserInfoScreenState();
}

class _SaveUserInfoScreenState extends State<SaveUserInfoScreen> {
  File _image;
  String imageUrl;
  final picker = ImagePicker();
  AuthBloc _bloc;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  void initState() {
    imageUrl = null;
    super.initState();
    _bloc = getIt<AuthBloc>();

    _nameController.addListener(() {
      _bloc.add(AuthEvent.nameChanged(_nameController.text));
    });

    _lastNameController.addListener(() {
      _bloc.add(AuthEvent.lastNameChanged(_lastNameController.text));
    });
  }

  @override
  void dispose() {
    super.dispose();

    _nameController.dispose();
    _lastNameController.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider<AuthBloc>(
        create: (_) => _bloc,
        child: BlocConsumer<AuthBloc,AuthState>(
          listener: (context, state) {
            if (state.isSubmitting) {
              Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  backgroundColor: Style.secondaryColor,
                  content:loadingFlashbar(
                    "Saving User",//title
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
                    "Sorry, Saving user failed, check your credentials"//message
                  ),
                ),
              );
            }
            if (state.isSuccess) {
              // getIt<IntroBloc>()..add(IntroEvent.loggedIn());
              // Navigator.of(context).pop();
              WidgetsBinding.instance.addPostFrameCallback((_) { 
                ExtendedNavigator.of(context).replace(Routes.dashboardScreen);
              });
            }
          },
          builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal*8),
            child: Column(
              children: [
                SizedBox(height: 100,),
                Center(
                  child: GestureDetector(
                    onTap: ()=>_showPicker(context),
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: Style.primaryColor,
                      child: _image != null
                      ? ClipRRect(
                        borderRadius: BorderRadius.circular(68),
                        child: Image.file(
                          _image,
                          width: 130,
                          height: 130,
                          fit: BoxFit.fill,
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(68),
                        ),
                        width: 135,
                        height: 135,
                        child: Icon(
                          LineAwesomeIcons.camera,
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.safeBlockHorizontal*10,),
                CustomTextField(
                  obscureText: false,
                  controller: _nameController,
                  keyboardType: TextInputType.name,
                  prefix: Icon(LineAwesomeIcons.user),
                  lableText: "First Name",
                  hintText: "Enter your first name",
                  validation: (_){
                    return !state.isNameValid ? "Enter a valid name" : null;
                  },
                ),
                SizedBox(height: SizeConfig.safeBlockHorizontal*3,),
                CustomTextField(
                  obscureText: false,
                  controller: _lastNameController,
                  keyboardType: TextInputType.name,
                  prefix: Icon(LineAwesomeIcons.user),
                  lableText: "Last Name",
                  hintText: "Enter your last name",
                  validation: (_){
                    return !state.isLastNameValid ? "Enter a valid name" : null;
                  },
                ),
                SizedBox(height: SizeConfig.safeBlockHorizontal*10,),
                buildMaterialButton(
                  true, 
                  "SUBMIT", 
                  _submit, 
                  Style.primaryColor
                ),
              ],
            ),
          );},
        ),
      ),
    );
  }

  void _showPicker(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
          ),
          child: new Wrap(
            children: <Widget>[
              new ListTile(
                  leading: new Icon(Icons.photo_library),
                  title: new Text('Photo Library'),
                  onTap: () {
                    _imgFromGallery();
                    Navigator.of(context).pop();
                  }),
              new ListTile(
                leading: new Icon(Icons.photo_camera),
                title: new Text('Camera'),
                onTap: () {
                  _imgFromCamera();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      }
    );
  }

_submit(){
  _bloc.add(AuthEvent.saveUserPressed(
    _nameController.text, 
    _lastNameController.text,
    imageUrl));
}

_imgFromCamera() async {
  final pickedFile = await picker.getImage(
    source: ImageSource.camera,);

  setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        imageUrl = pickedFile.path;
      } else {
        print('No image selected.');
      }
  });
}

_imgFromGallery() async {
 final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
  );

  setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        imageUrl = pickedFile.path;
      } else {
        print('No image selected.');
      }
    });
}
}