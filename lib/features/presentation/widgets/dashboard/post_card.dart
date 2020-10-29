import 'package:SmartShare/core/utils/constants.dart';
import 'package:SmartShare/core/utils/size_config.dart';
import 'package:SmartShare/features/domain/entities/home/get_my_post.dart';
import 'package:SmartShare/features/domain/entities/home/get_post.dart';
import 'package:SmartShare/features/presentation/bloc/home/post_bloc/post_bloc.dart';
import 'package:SmartShare/features/presentation/widgets/dashboard/system_padding.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:timeago/timeago.dart' as timeago;

class PostsCard extends StatefulWidget {
  final post;
  final GetMyPost myPost;
  final bloc;
  final model;
  final Function delete,edit;


  PostsCard({
    Key key,@required this.post,@required this.myPost, @required this.bloc,@required this.model,@required this.delete,@required this.edit
  }) : super(key: key);

  @override
  _PostsCardState createState() => _PostsCardState();
}

class _PostsCardState extends State<PostsCard> {
  bool isLiked;

  @override
  void initState() {
    super.initState();
    isLiked = widget.post.selfLike;
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: SizeConfig.safeBlockHorizontal * 12,
                        width: SizeConfig.safeBlockHorizontal * 12,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                              widget.post.user.photo !="" ? IMAGE_URL + widget.post.user.photo:
                                'https://ramcotubular.com/wp-content/uploads/default-avatar.jpg'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.safeBlockHorizontal * 4,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.post.user.name +" "+ widget.post.user.lastName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            timeago.format(DateTime.parse(widget.post.createdAt)),
                            // post.createdAt,
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 10),
                          )
                        ],
                      )
                    ],
                  ),
                  widget.post.user.id == widget.myPost.user.id ? PopupMenuButton<String>(
                    icon: Icon(LineAwesomeIcons.horizontal_ellipsis,color: Colors.black,),
                    onSelected: (choice)=>choiceAction(choice,context),
                    itemBuilder: (context){
                      return PopUpMenu.choices.map(
                        (String choice) {
                          return PopupMenuItem<String>(
                            child: Text(choice),
                            value: choice,
                          );
                        }
                      ).toList();
                    }
                  ) : Opacity(opacity: 1),
                ],
              ),
              SizedBox(
                height: SizeConfig.safeBlockHorizontal * 4,
              ),
              Text(
                widget.post.desc,
                style: TextStyle(color: Colors.grey[700]),
              ),
            ],
          ),
        ),
        widget.post.photo !=""?
        Flexible(
          flex: 2,
          fit: FlexFit.loose,
          child: new Image.network(
            IMAGE_URL + widget.post.photo,
            fit: BoxFit.cover,
          ),
        ): SizedBox(),
        SizedBox(
          height: SizeConfig.safeBlockHorizontal * 2,
        ),
        Padding(
          padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              LikeButton(
                circleColor: CircleColor(start: Colors.yellow[300], end: Colors.yellow[800]),
                bubblesColor: BubblesColor(
                  dotPrimaryColor: Color(0xfffee56f),
                  dotSecondaryColor: Colors.yellow[800],
                ),
                likeCount: widget.post.likesCount,
                isLiked: isLiked,
                onTap: (isLiked) async{
                  widget.bloc.add(LikePostEvent(postId: widget.post.id, model: widget.model, myModel: widget.myPost));
                  return !isLiked;
                },
              ),
              SizedBox(
                width: SizeConfig.blockSizeVertical * 3,
              ),
              new Icon(
                LineAwesomeIcons.sms,
                size: 30,
              ),
            ],
          ),
        ),
        SizedBox(
          height: SizeConfig.safeBlockHorizontal * 2,
        ),
        // Padding(
        //   padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 4),
        //   child: Text(
        //     widget.post.likesCount != 0 && widget.post.likesCount != 1 
        //     ? widget.post.likesCount.toString() + " Likes"
        //     : widget.post.likesCount == 1 
        //     ? widget.post.likesCount.toString() + " Like"
        //     : "No Likes",
        //     style: TextStyle(fontWeight: FontWeight.w600),
        //   ),
        // ),
        SizedBox(
          height: SizeConfig.safeBlockHorizontal,
        ),
        Padding(
          padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 4),
          child: GestureDetector(
            onTap: () {},  //TODO route to comments screen
            child: Text(
              widget.post.commentsCount != 0 && widget.post.commentsCount != 1 
              ? "View all " + widget.post.commentsCount.toString()+ " comments"
              : widget.post.commentsCount == 1 
              ? "View all " + widget.post.commentsCount.toString()+ " comment" 
              : "No Comments",
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),
        )
      ],
    );
  }

  void choiceAction(String choice, BuildContext context) {
    if(choice == PopUpMenu.editPost){
      print("Edit post");
      widget.edit();
    }else if(choice == PopUpMenu.deletePost){
      print("Delete Post");
      widget.delete();
    }
  }

}