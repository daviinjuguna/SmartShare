import 'package:SmartShare/core/utils/constants.dart';
import 'package:SmartShare/features/domain/entities/home/get_my_post.dart';
import 'package:SmartShare/features/presentation/bloc/home/post_bloc/post_bloc.dart';
import 'package:SmartShare/features/presentation/widgets/components/custom_button.dart';
import 'package:SmartShare/features/presentation/widgets/dashboard/my_post_card.dart';
import 'package:SmartShare/features/presentation/widgets/dashboard/post_card.dart';
import 'package:SmartShare/features/presentation/widgets/dashboard/system_padding.dart';
import 'package:SmartShare/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with AutomaticKeepAliveClientMixin<ProfileScreen> {
  PostBloc _bloc;

  @override
  void initState() {
    _bloc = getIt<PostBloc>();
    _bloc.add(GetPostEvent());
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => _bloc,
        child: BlocConsumer<PostBloc, PostState>(
          listener: (context, state) {
             if (state is LogoutLoading) {
              Scaffold.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.blue,
                    content: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          new CircularProgressIndicator(),
                          new Text(
                            "Logging out",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                );
            }
          },
          builder: (context, state) {
            if (state is Loading) {
            return Center(child: CircularProgressIndicator(
                backgroundColor: Style.secondaryColor,
                valueColor: new AlwaysStoppedAnimation<Color>(Style.primaryColor),
            ),);
            }else if (state is Success){
              final myPost = state.myModel;
              final post = myPost.post;

              return ProfileBody(bloc: _bloc, myPost: myPost, post: post,);
            }else if(state is LogoutSuccess){
              WidgetsBinding.instance.addPostFrameCallback(
                (_) => Navigator.of(context).pushReplacementNamed('/welcome'),
              );
              return Container(color: Colors.white,);
            }else{
              return Container(color: Colors.white,);
            }
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class ProfileBody extends StatefulWidget {
  const ProfileBody({
    
    Key key,@required this.post, @required this.myPost,@required this.bloc,
  }) : super(key: key);

  final post,bloc;
  final GetMyPost myPost;

  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  // final TextEditingController _desc = TextEditingController();

  @override
  void initState() {
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
              // title: Text('NestedScrollView'),
              expandedHeight: 280.0,
              elevation: 0,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: new NetworkImage(
                                      widget.myPost.user.photo != "" 
                                      ? IMAGE_URL + widget.myPost.user.photo
                                      : 'https://ramcotubular.com/wp-content/uploads/default-avatar.jpg'
                                    ),
                                    fit: BoxFit.fill
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.myPost.user.name +" "+ widget.myPost.user.lastName,
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
                        onPressed: () {},
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
                    GridView.count(
                      padding: EdgeInsets.zero,
                      crossAxisCount: 3,
                      children: List.generate(
                        widget.post.length,
                        (index) => Container(
                          height: 10,
                          width: 10,
                          // color: Colors.red,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                IMAGE_URL + widget.post[index].photo
                              ),
                              fit: BoxFit.fill
                            )
                          ),
                        ),
                      ),
                    ),
                    ListView.builder(
                      itemCount: widget.post.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [ 
                            MyPostCard(post: widget.post[index], myPost: widget.myPost,),
                            SizedBox(
                              height: 3,
                            ),
                          ],
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
