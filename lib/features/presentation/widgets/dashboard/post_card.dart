import 'package:SmartShare/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class PostsCard extends StatelessWidget {
  const PostsCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal*4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: SizeConfig.safeBlockHorizontal*12,
                    width: SizeConfig.safeBlockHorizontal*12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: new NetworkImage(
                          "https://venturebeat.com/wp-content/uploads/2013/05/xbox-one-controller.png?w=749&strip=all"
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: SizeConfig.safeBlockHorizontal*4,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Xbox Controller",style: TextStyle(
                        fontWeight: FontWeight.bold,fontSize: 15
                      ),),
                      Text("2020-03-21 17:16:55",style: TextStyle(
                        fontWeight: FontWeight.w300,fontSize: 10
                      ),)
                    ],
                  )
                ],
              ),
              SizedBox(height: SizeConfig.safeBlockHorizontal*4,),
              Text(
                "Checkout Red Dead Redemption",
                style: TextStyle(
                  color: Colors.grey[700]
                ),
              ),
            ],
          ),
        ),
        Flexible(
          fit: FlexFit.loose,
          child: new Image.network(
            "https://c4.wallpaperflare.com/wallpaper/467/463/628/red-dead-red-dead-redemption-2-abigail-marston-arthur-morgan-bill-williamson-hd-wallpaper-preview.jpg",
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: SizeConfig.safeBlockHorizontal*2,),
        Padding(
          padding: EdgeInsets.only(left:SizeConfig.safeBlockHorizontal*4 ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              new Icon(LineAwesomeIcons.heart,size: 30,),//!icon button
              SizedBox(width: SizeConfig.blockSizeVertical*3,),
              new Icon(LineAwesomeIcons.sms,size: 30,)//!icon button
            ],
          ),
        ),
        SizedBox(height: SizeConfig.safeBlockHorizontal*2,),
        Padding(
          padding: EdgeInsets.only(left:SizeConfig.safeBlockHorizontal*4 ),
          child: Text("20 Likes",style: TextStyle(
            fontWeight: FontWeight.w600
          ),),
        ),
        SizedBox(height: SizeConfig.safeBlockHorizontal,),
        Padding(
          padding: EdgeInsets.only(left:SizeConfig.safeBlockHorizontal*4 ),
          child: GestureDetector(
            onTap: (){},
            child: Text("View all 10 comments",style: TextStyle(color: Colors.grey[700]),),
          ),
        )
      ],
    );
  }
}