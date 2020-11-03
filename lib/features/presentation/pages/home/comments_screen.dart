import 'package:SmartShare/core/utils/constants.dart';
import 'package:SmartShare/core/utils/size_config.dart';
import 'package:SmartShare/features/domain/entities/home/get_comment.dart';
import 'package:SmartShare/features/domain/entities/home/get_my_post.dart';
import 'package:SmartShare/features/domain/entities/home/get_post.dart';
import 'package:SmartShare/features/presentation/bloc/home/comment_bloc/comment_bloc.dart';
import 'package:SmartShare/features/presentation/widgets/dashboard/system_padding.dart';
import 'package:SmartShare/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:timeago/timeago.dart' as timeago;

class CommentsScreen extends StatefulWidget {
  final GetPost post;
  final GetMyPost myPost;

  const CommentsScreen({Key key, @required this.post, @required this.myPost})
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
      appBar: AppBar(
        title: Text("${widget.post.user.name}'s Post"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
      ),
      body: BlocProvider<CommentBloc>(
        create: (_) => _bloc,
        child: CommentBody(widget: widget, bloc: _bloc),
      ),
    );
  }
}

class CommentBody extends StatefulWidget {
  const CommentBody({Key key, @required this.widget, @required this.bloc})
      : super(key: key);

  final CommentsScreen widget;
  final bloc;

  @override
  _CommentBodyState createState() => _CommentBodyState();
}

class _CommentBodyState extends State<CommentBody> {
  List<GetComments> comments = [];
  final TextEditingController _comment = TextEditingController();
  final TextEditingController _commentDesc = TextEditingController();

  @override
  void initState() {
    super.initState();
    _commentDesc.clear();
  }

  @override
  void dispose() {
    super.dispose();
    _comment.dispose();
    _commentDesc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            expandedHeight: widget.widget.post.photo != ""
                ? SizeConfig.screenHeight * 0.5
                : SizeConfig.screenHeight * 0.3,
            elevation: 1,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.all(SizeConfig.safeBlockHorizontal * 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: SizeConfig.safeBlockHorizontal * 12,
                                width: SizeConfig.safeBlockHorizontal * 12,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: new NetworkImage(widget
                                                    .widget.post.user.photo !=
                                                ""
                                            ? IMAGE_URL +
                                                widget.widget.post.user.photo
                                            : 'https://ramcotubular.com/wp-content/uploads/default-avatar.jpg'))),
                              ),
                              SizedBox(
                                width: SizeConfig.safeBlockHorizontal * 4,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.widget.post.user.name +
                                        " " +
                                        widget.widget.post.user.lastName,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Text(
                                    timeago.format(DateTime.parse(
                                        widget.widget.post.createdAt)),
                                    // "3 days ago",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 10),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockHorizontal * 4,
                          ),
                          Text(
                            // post.desc,
                            widget.widget.post.desc,
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ],
                      ),
                    ),
                    widget.widget.post.photo != ""
                        ? Flexible(
                            flex: 2,
                            fit: FlexFit.loose,
                            child: Image.network(
                              IMAGE_URL + widget.widget.post.photo,
                              fit: BoxFit.cover,
                            ),
                          )
                        : SizedBox(),
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal * 4,
                    ),
                    Material(
                      elevation: 0,
                      color: Colors.white,
                      child: Container(
                        // height: SizeConfig.safeBlockVertical*5,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: Row(
                          children: [
                            Flexible(
                              child: TextField(
                                controller: _comment,
                                maxLines: null,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 3),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    hintText: "Write a comment...",
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        LineAwesomeIcons.paper_plane,
                                        size: 30,
                                      ),
                                      onPressed: () {
                                        if (_comment.text.isEmpty) return;
                                        widget.bloc.add(CreateCommentEvent(
                                            postId: widget.widget.post.id,
                                            comment: _comment.text,
                                            commentModel: comments));
                                        _comment.clear();
                                      },
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ];
      },
      //!Comments Section
      body: BlocConsumer<CommentBloc, CommentState>(
        listener: (context, state) {
          if (state is CreateCommentLoading) {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                backgroundColor: Colors.white,
                content: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      new CircularProgressIndicator(
                        backgroundColor: Style.secondaryColor,
                        valueColor: new AlwaysStoppedAnimation<Color>(
                            Style.primaryColor),
                      ),
                      new Text(
                        "Commenting",
                        style: TextStyle(color: Colors.yellow[700]),
                      )
                    ],
                  ),
                ),
              ));
          }if (state is Created){
            Scaffold.of(context).hideCurrentSnackBar();
          }
        },
        builder: (context, state) {
          if (state is Loading) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Style.secondaryColor,
                valueColor:
                    new AlwaysStoppedAnimation<Color>(Style.primaryColor),
              ),
            );
          }
          if (state is Success) {
            comments = state.commentModel;
          }
          if (state is Created) {
            comments.insert(0, state.getComments);

            widget.bloc.add(ChangeStateEvent(
                commentModel:
                    comments)); //! return state to success so as preventing comments to be inserted by the above method
          }
          return Material(
            color: Colors.white,
            child: Container(
              padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal),
              child: comments.isEmpty
                  ? Center(
                      child: Text(
                        "Comment on ${widget.widget.post.user.name}'s post",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    )
                  : ListView.builder(
                      itemCount: comments.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: new NetworkImage(comments[
                                                            index]
                                                        .user
                                                        .photo !=
                                                    ""
                                                ? IMAGE_URL +
                                                    comments[index].user.photo
                                                : 'https://ramcotubular.com/wp-content/uploads/default-avatar.jpg'))),
                                  ),
                                  SizedBox(
                                      width:
                                          SizeConfig.safeBlockHorizontal * 2),
                                  Flexible(
                                    flex: 1,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(SizeConfig
                                                      .safeBlockHorizontal *
                                                  2),
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[200],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    comments[index]
                                                            .user
                                                            .name +
                                                        " " +
                                                        comments[index]
                                                            .user
                                                            .lastName,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 15),
                                                  ),
                                                  SizedBox(
                                                    height: SizeConfig
                                                            .safeBlockHorizontal *
                                                        0.5,
                                                  ),
                                                  Text(
                                                    comments[index].comment,
                                                    style: TextStyle(
                                                        color:
                                                            Colors.grey[700]),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: SizeConfig
                                                  .blockSizeVertical,
                                            ),
                                            Text(timeago.format(
                                                DateTime.parse(comments[index]
                                                    .createdAt)))
                                          ],
                                        ),
                                        //!check comments if the user is the one commenting so as to edit
                                        comments[index].user.id ==
                                                widget.widget.myPost.user.id
                                            ? PopupMenuButton<String>(
                                                icon: Icon(
                                                  LineAwesomeIcons
                                                      .horizontal_ellipsis,
                                                  color: Colors.black,
                                                ),
                                                onSelected: (choice) =>
                                                    choiceAction(
                                                        choice,
                                                        context,
                                                        comments[index],
                                                        comments),
                                                itemBuilder: (context) {
                                                  return PopUpMenu.choices
                                                      .map((String choice) {
                                                    return PopupMenuItem<
                                                        String>(
                                                      child: Text(choice),
                                                      value: choice,
                                                    );
                                                  }).toList();
                                                })
                                            : Opacity(
                                                opacity: 1,
                                              )
                                      ],
                                    ),
                                  ),
                                  // SizedBox(width: SizeConfig.safeBlockHorizontal * 0.5),
                                ]),
                          ),
                        );
                      },
                      // _delete(){

                      // }
                    ),
            ),
          );
        },
      ),
    );
  }

  void choiceAction(String choice, BuildContext context,
      GetComments getComments, List<GetComments> comments) {
    if (choice == PopUpMenu.editPost) {
      print("Edit comment");
      showDialog(
        context: context,
        child: SystemPadding(
            child: new AlertDialog(
          contentPadding: const EdgeInsets.all(16.0),
          content: new Row(
            children: [
              new Expanded(
                child: new TextField(
                  maxLines: 3,
                  controller: _commentDesc,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                      hintText: getComments.comment),
                ),
              ),
            ],
          ),
          actions: [
            new FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'CANCEL',
                style: TextStyle(color: Colors.grey[800]),
              ),
            ),
            new FlatButton(
              onPressed: () {
                if (_commentDesc.text.isEmpty) return;
                widget.bloc.add(EditCommentEvent(
                    commentId: getComments.id,
                    commentModel: comments,
                    comment: _commentDesc.text));
                var editedComment = comments.firstWhere(
                    (element) => element.id == getComments.id,
                    orElse: () => null);

                if (editedComment != null)
                  setState(() {
                    editedComment.comment = _commentDesc.text;
                  });
                Navigator.pop(context);
              },
              child: Text(
                'SUBMIT',
                style: TextStyle(color: Colors.yellow[700]),
              ),
            )
          ],
        )),
      );
    } else if (choice == PopUpMenu.deletePost) {
      print("Delete comment");
      widget.bloc.add(DeleteCommentEvent(
          commentId: getComments.id, commentModel: comments));
      setState(() {
        comments.removeWhere((element) => element.id == getComments.id);
      });
    }
  }
}
