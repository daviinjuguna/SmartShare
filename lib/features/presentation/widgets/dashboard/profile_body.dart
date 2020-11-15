import 'package:SmartShare/core/routes/router.gr.dart';
import 'package:SmartShare/core/utils/constants.dart';
import 'package:SmartShare/features/domain/entities/home/get_my_post.dart';
import 'package:SmartShare/features/presentation/bloc/home/post_bloc/post_bloc.dart';
import 'package:SmartShare/features/presentation/widgets/dashboard/my_post_card.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({
    Key key,
    @required this.post,
    @required this.myPost,
    @required this.bloc,
    @required this.filteredPhoto,
  }) : super(key: key);

  final post, bloc, filteredPhoto;
  final GetMyPost myPost;

  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  // final TextEditingController _desc = TextEditingController();
  // var filteredPhoto;

  @override
  void initState() {
    // filteredPhoto =
    //     widget.myPost.post.where((element) => element.photo != "").toList();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 280.0,
              elevation: 0,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: new NetworkImage(widget
                                                  .myPost.user.photo !=
                                              ""
                                          ? IMAGE_URL + widget.myPost.user.photo
                                          : 'https://ramcotubular.com/wp-content/uploads/default-avatar.jpg'),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.myPost.user.name +
                                        " " +
                                        widget.myPost.user.lastName,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/email.png",
                                        height: 12,
                                        width: 12,
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        widget.myPost.user.email,
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                            icon: Icon(LineAwesomeIcons.alternate_sign_out),
                            onPressed: () => widget.bloc.add(LogoutEvent()),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MaterialButton(
                        onPressed: () => ExtendedNavigator.of(context)
                            .push(Routes.saveUserInfoScreen),
                        minWidth: double.infinity,
                        height: 40,
                        color: Color(0xfffee56f),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.black)),
                        child: Text(
                          "EDIT PROFILE",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ];
        },
        body: Material(
          color: Colors.white,
          child: Column(
            children: [
              TabBar(
                labelColor: Colors.yellow[700],
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(
                    icon: Icon(LineAwesomeIcons.border_all),
                  ),
                  Tab(
                    // text:"ListView",
                    icon: Icon(LineAwesomeIcons.bars),
                  )
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    GridView.builder(
                      itemCount: widget.filteredPhoto.length,
                      gridDelegate:
                          new SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        return widget.filteredPhoto.isEmpty
                            ? Opacity(
                                opacity: 1,
                              )
                            : GestureDetector(
                                child: new Card(
                                elevation: 1,
                                child: new Container(
                                  // decoration: BoxDecoration(
                                  //   image: DecorationImage(
                                  //       image: NetworkImage(
                                  //           IMAGE_URL + filteredPhoto[index].photo),
                                  //       fit: BoxFit.fill
                                  //   ),
                                  // ),
                                  child: CachedNetworkImage(
                                    imageUrl: IMAGE_URL +
                                        widget.filteredPhoto[index].photo,
                                    fit: BoxFit.fill,
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                            Center(
                                      child: CircularProgressIndicator(
                                          value: downloadProgress.progress),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                              ));
                      },
                    ),
                    ListView.builder(
                      itemCount: widget.post.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          elevation: 1,
                          // borderOnForeground: false,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              MyPostCard(
                                post: widget.post[index],
                                myPost: widget.myPost,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
