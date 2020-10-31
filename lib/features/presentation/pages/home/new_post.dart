import 'dart:io';

import 'package:SmartShare/core/routes/router.gr.dart';
import 'package:SmartShare/core/utils/constants.dart';
import 'package:SmartShare/features/presentation/bloc/home/post_bloc/post_bloc.dart';
import 'package:SmartShare/features/presentation/widgets/components/custom_button.dart';
import 'package:SmartShare/injection.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class NewPostPage extends StatefulWidget {
  @override
  _NewPostPageState createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  PostBloc _bloc;
  File _image;
  String imageUrl;
  final picker = ImagePicker();
  final TextEditingController desc = TextEditingController();

  @override
  void initState() {
    super.initState();
    imageUrl = null;
    _bloc = getIt<PostBloc>();
    desc.clear();
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
    desc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("New Post",style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: BlocProvider<PostBloc>(
        create: (context) => _bloc,
        child: BlocBuilder<PostBloc,PostState>(
          builder:(context,state){
            if (state is CreatePostSuccess){
              WidgetsBinding.instance.addPostFrameCallback((_) { 
                ExtendedNavigator.of(context).replace(Routes.dashboardScreen);
              });
            }
            return Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            margin: EdgeInsets.only(top: 50),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: ()=>_showPicker(context),
                  child:
                   _image != null 
                  ? Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(
                          _image
                        ),
                        fit: BoxFit.fill
                      )
                    ),
                  )
                  : Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color:Colors.grey[800])
                    ),
                    child: Icon(
                      LineAwesomeIcons.camera,
                      color: Colors.grey[800],
                      size: 100,
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                new TextField(
                  // minLines: null,
                  maxLines: 3,
                  // expands: true,
                  controller: desc,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)
                    ),
                  hintText: "Say something",
                    
                  ),
                ),
                SizedBox(height: 20,),
                state is CreatePostLoading ? Center(child: CircularProgressIndicator(
                backgroundColor: Style.secondaryColor,
                valueColor: new AlwaysStoppedAnimation<Color>(Style.primaryColor),
                ),):buildMaterialButton(
                  true, 
                  "POST", 
                  (){
                    if(desc.text.isEmpty)return;
                    _bloc.add(CreatePostEvent(postDescription: desc.text,imageUrl: imageUrl));
                  }, 
                  Color(0xfffee56f)
                )
              ],
              
            ),
          );
          },
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
// _addImage(selection) {
//     _bloc.add(GetImageEvent(selection: selection));
//   }

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