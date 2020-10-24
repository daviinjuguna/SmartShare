import 'package:SmartShare/core/utils/constants.dart';
import 'package:SmartShare/core/utils/size_config.dart';
import 'package:SmartShare/features/data/model/post/get_post_model.dart';
import 'package:SmartShare/features/domain/entities/home/get_post.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:timeago/timeago.dart' as timeago;

class PostsCard extends StatelessWidget {
  final GetPost post;
  const PostsCard({
    Key key,@required this.post,
  }) : super(key: key);

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
                          post.user.photo !="" ? IMAGE_URL + post.user.photo:
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
                        post.user.name +" "+ post.user.lastName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        timeago.format(DateTime.parse(post.createdAt)),
                        // post.createdAt,
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 10),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: SizeConfig.safeBlockHorizontal * 4,
              ),
              Text(
                post.desc,
                style: TextStyle(color: Colors.grey[700]),
              ),
            ],
          ),
        ),
        post.photo !=""?
        Flexible(
          fit: FlexFit.loose,
          child: new Image.network(
            IMAGE_URL + post.photo,
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
              new Icon(
                post.selfLike ? LineAwesomeIcons.heart_1:LineAwesomeIcons.heart,
                size: 30,
              ),
              SizedBox(
                width: SizeConfig.blockSizeVertical * 3,
              ),
              new Icon(
                LineAwesomeIcons.sms,
                size: 30,
              )
            ],
          ),
        ),
        SizedBox(
          height: SizeConfig.safeBlockHorizontal * 2,
        ),
        Padding(
          padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 4),
          child: Text(
            post.likesCount != 0 && post.likesCount != 1 ?
            post.likesCount.toString() + " Likes"
            :post.likesCount == 1 ?
            post.likesCount.toString() + " Like" : "No Likes",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: SizeConfig.safeBlockHorizontal,
        ),
        Padding(
          padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 4),
          child: GestureDetector(
            onTap: () {},
            child: Text(
              post.commentsCount != 0 && post.commentsCount != 1 ?
              "View all " + post.commentsCount.toString()+ " comments"
              : post.commentsCount == 1 ? "View all " + post.commentsCount.toString()+ " comment" 
              : "No Comments",
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),
        )
      ],
    );
  }
}