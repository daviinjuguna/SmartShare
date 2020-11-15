import 'dart:async';

import 'package:SmartShare/core/utils/size_config.dart';
import 'package:SmartShare/features/domain/entities/home/get_my_post.dart';
import 'package:SmartShare/features/domain/entities/home/get_post.dart';
import 'package:SmartShare/features/presentation/bloc/home/comment_bloc/comment_bloc.dart';
import 'package:SmartShare/features/presentation/bloc/home/post_bloc/post_bloc.dart'
    as postBloc;
import 'package:SmartShare/features/presentation/widgets/dashboard/comments_body.dart';
import 'package:SmartShare/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class CommentsScreen extends StatefulWidget {
  final GetPost post;
  final GetMyPost myPost;
  final postBloc;

  const CommentsScreen(
      {Key key,
      @required this.post,
      @required this.myPost,
      @required this.postBloc})
      : super(key: key);
  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  CommentBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = getIt<CommentBloc>();
    _bloc.add(GetCommentEvent(postId: widget.post.id));

    //update comments every 1 minutes
    Timer.periodic(Duration(minutes: 1), (Timer timer) {
      _bloc.add(UpdateCommentEvent(postId: widget.post.id));
    });
  }

  @override
  void dispose() {
    super.dispose();
    // _comment.dispose();
    _bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        title: Text("${widget.post.user.name}'s Post"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(LineAwesomeIcons.arrow_left),
          onPressed: () {
            Navigator.of(context).pop();
            widget.postBloc.add(postBloc.UpdatePostEvent());
          },
        ),
        // leading: ,
      ),
      body: BlocProvider<CommentBloc>(
        create: (_) => _bloc,
        child: CommentBody(widget: widget, bloc: _bloc),
      ),
    );
  }
}
