import 'package:SmartShare/core/utils/constants.dart';
import 'package:SmartShare/core/utils/size_config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class MyPostCard extends StatelessWidget {
  const MyPostCard({Key key, @required this.post, @required this.myPost})
      : super(key: key);

  final post, myPost;
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: SizeConfig.safeBlockHorizontal * 12,
                    width: SizeConfig.safeBlockHorizontal * 12,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(myPost.user.photo != ""
                                ? IMAGE_URL + myPost.user.photo
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
                        myPost.user.name + " " + myPost.user.lastName,
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
        post.photo != ""
            ? Flexible(
                flex: 2,
                fit: FlexFit.loose,
                // child: new Image.network(
                //   IMAGE_URL + post.photo,
                //   fit: BoxFit.cover,
                // ),
                child: CachedNetworkImage(
                  imageUrl: IMAGE_URL + post.photo,
                  fit: BoxFit.fill,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
