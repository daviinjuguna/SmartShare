import 'package:SmartShare/core/utils/constants.dart';
import 'package:SmartShare/core/utils/size_config.dart';
import 'package:SmartShare/features/domain/entities/home/get_comment.dart';
import 'package:SmartShare/features/domain/entities/home/get_my_post.dart';
import 'package:SmartShare/features/domain/entities/home/get_post.dart';
import 'package:SmartShare/features/presentation/bloc/home/comment_bloc/comment_bloc.dart';
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
  final TextEditingController _comment = TextEditingController();
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
    _comment.dispose();
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
        create: (context) => _bloc,
        child: BlocBuilder<CommentBloc, CommentState>(
          builder: (context, state) {
            if (state is Loading) {
              return Center(child: CircularProgressIndicator(
                backgroundColor: Style.secondaryColor,
                valueColor: new AlwaysStoppedAnimation<Color>(Style.primaryColor),
            ),);
            }else if(state is Success){
              return CommentBody(
                widget: widget, comments: state.commentModel,
              );
            }else{
              return Container(color: Colors.white,);
            }
          },
        ),
      ),
      bottomSheet: Material(
        elevation: 4,
        child: Container(
          // height: SizeConfig.safeBlockVertical*5,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            children: [
              Flexible(
                child: TextField(
                  controller: _comment,
                  maxLines: null,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                      hintText: "Write a comment...",
                      suffixIcon: IconButton(
                        icon: Icon(
                          LineAwesomeIcons.paper_plane,
                          size: 30,
                        ),
                        onPressed: () {
                          if (_comment.text.isEmpty) return;
                        },
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CommentBody extends StatefulWidget {
  const CommentBody({
    Key key,
    @required this.widget,@required this.comments,
  }) : super(key: key);

  final CommentsScreen widget;
  final List<GetComments> comments;

  @override
  _CommentBodyState createState() => _CommentBodyState();
}

class _CommentBodyState extends State<CommentBody> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            expandedHeight: SizeConfig.screenHeight * 0.5,
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
                                        image: new NetworkImage(
                                            widget.widget.post.user.photo != ""
                                            ? IMAGE_URL + widget.widget.post.user.photo
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
                                    timeago.format(
                                        DateTime.parse(widget.widget.post.createdAt)),
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
                  ],
                ),
              ),
            ),
          )
        ];
      },
      //!Comments Section
      body: Container(
        padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal),
        child: widget.comments.isEmpty
         ? Center(
           child: Text(
             "Comment on ${widget.widget.post.user.name}'s post",
             style: TextStyle(color: Colors.grey[700]),
            ),)
         : ListView.builder(
          itemCount: widget.comments.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onLongPress: () {
                print("long pessed"); //!delete function
              },
              onTap: () {
                print("On pressed"); //!edit
              },
              child: Card(
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
                                  image: new NetworkImage(
                                    widget.comments[index].user.photo != ""
                                    ? IMAGE_URL + widget.comments[index].user.photo
                                    :  'https://ramcotubular.com/wp-content/uploads/default-avatar.jpg'
                                  ))),
                        ),
                        SizedBox(width: SizeConfig.safeBlockHorizontal * 2),
                        Flexible(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(
                                SizeConfig.safeBlockHorizontal * 2),
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.comments[index].user.name + " " + widget.comments[index].user.lastName,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                                SizedBox(
                                  height: SizeConfig.safeBlockHorizontal * 0.5,
                                ),
                                Text(
                                  widget.comments[index].comment,
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // SizedBox(width: SizeConfig.safeBlockHorizontal * 0.5),
                      ]),
                ),
              ),
            );
          },
          // _delete(){

          // }
        ),
      ),
    );
  }
}
