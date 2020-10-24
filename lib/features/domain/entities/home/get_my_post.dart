import 'package:SmartShare/features/data/model/post/my_post_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class GetMyPost extends Equatable{
  GetMyPost({@required this.post,@required this.user});

  @override
  List<Object> get props => [post,user];

  final List<Post> post;
  final User user;

}