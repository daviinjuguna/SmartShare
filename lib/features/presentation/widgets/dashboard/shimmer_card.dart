import 'package:SmartShare/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      // borderOnForeground: false,
      child: Column(
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
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300],
                          highlightColor: Colors.grey[100],
                          child: Container(
                            height: SizeConfig.safeBlockHorizontal * 12,
                            width: SizeConfig.safeBlockHorizontal * 12,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[700]
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
                            Shimmer.fromColors(
                              baseColor: Colors.grey[300],
                              highlightColor: Colors.grey[100],
                              child: Text(
                                "loading",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                            Shimmer.fromColors(
                              baseColor: Colors.grey[300],
                              highlightColor: Colors.grey[100],
                              child: Text(
                                "loading",
                                // post.createdAt,
                                style: TextStyle(
                                    fontWeight: FontWeight.w300, fontSize: 10),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 4,
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.grey[100],
                  child: Text(
                    "loading",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.loose,
            // child: new Image.network(
            //   IMAGE_URL + widget.post.photo,
            //   fit: BoxFit.cover,
            // ),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300],
              highlightColor: Colors.grey[100],
              child: Container(
                  width: double.maxFinite,
                  height: SizeConfig.screenHeight * 0.3,
                  color: Colors.grey[700]),
            ),
          ),
          SizedBox(
            height: SizeConfig.safeBlockHorizontal * 2,
          ),
          Padding(
            padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.grey[100],
                  child: LikeButton(
                    circleColor: CircleColor(
                        start: Colors.yellow[300], end: Colors.yellow[800]),
                    bubblesColor: BubblesColor(
                      dotPrimaryColor: Color(0xfffee56f),
                      dotSecondaryColor: Colors.yellow[800],
                    ),
                    // likeCount: widget.post.likesCount,
                    // isLiked: isLiked,
                    // onTap: (){}
                  ),
                ),
                // SizedBox(
                //   width: SizeConfig.blockSizeVertical * 3,
                // ),
                // new Icon(
                //   LineAwesomeIcons.sms,
                //   size: 30,
                // ),
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
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300],
              highlightColor: Colors.grey[100],
              child: GestureDetector(
                // color: Colors.grey[700],
                onTap: () {},
                child: Text(
                  "loading",
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.safeBlockHorizontal * 5,
          ),
        ],
      ),
    );
  }
}
