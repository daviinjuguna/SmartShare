import 'package:SmartShare/core/routes/router.gr.dart';
import 'package:SmartShare/core/utils/size_config.dart';
import 'package:SmartShare/features/domain/entities/home/get_my_post.dart';
import 'package:SmartShare/features/domain/entities/home/get_post.dart';
import 'package:SmartShare/features/presentation/bloc/auth/intro_bloc/intro_bloc.dart';
import 'package:SmartShare/features/presentation/bloc/home/post_bloc/post_bloc.dart';
import 'package:SmartShare/features/presentation/pages/home/home_screen.dart';
import 'package:SmartShare/features/presentation/pages/home/profile_screen.dart';
import 'package:SmartShare/features/presentation/widgets/dashboard/register_select_image_list.dart';
import 'package:SmartShare/features/presentation/widgets/dashboard/shimmer_card.dart';
import 'package:SmartShare/injection.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with AutomaticKeepAliveClientMixin<DashboardScreen> {
  int _currentIndex = 0;
  PageController _pageController;
  PostBloc _bloc;
  List<GetPost> filteredPosts = [];
  GetMyPost myPost;
  dynamic post;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _bloc = getIt<PostBloc>();
    _bloc.add(GetPostEvent());
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    _bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: BlocProvider<PostBloc>(
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
            if (state is LogoutSuccess) {
              WidgetsBinding.instance.addPostFrameCallback(
                (_) =>
                    ExtendedNavigator.of(context).replace(Routes.welcomePage),
              );
            }
          },
          builder: (context, state) {
            if (state is Loading) {
              //shimmer list
              return Material(
                color: Colors.white,
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (_, __) => ShimmerCard(),
                ),
              );
            }
            if (state is Success) {
              filteredPosts = state.model;
              myPost = state.myModel;
              post = myPost.post;
            }
            // if(state is CreatePostSuccess){
            //   filteredPosts.insert(0, state.getPost);
            //   _bloc.add(ChangePostStateEvent(model: filteredPosts, myModel: myPost));
            // }
            return PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _currentIndex = index);
              },
              children: [
                HomeScreen(
                  bloc: _bloc,
                  filteredPosts: filteredPosts,
                  myPost: myPost,
                ),
                ProfileScreen(
                  bloc: _bloc,
                  myPost: myPost,
                  post: post,
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 5,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() => _currentIndex = index);
            _pageController.jumpToPage(index);
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  LineAwesomeIcons.home,
                  color: Colors.black,
                ),
                label: "Home",
                activeIcon: Icon(
                  LineAwesomeIcons.home,
                  color: Color(0xfffee56f),
                )),
            BottomNavigationBarItem(
              icon: Icon(
                LineAwesomeIcons.user,
                color: Colors.black,
              ),
              label: "Profile",
              activeIcon: Icon(
                LineAwesomeIcons.user,
                color: Color(0xfffee56f),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            ExtendedNavigator.of(context).pushNewPostPage(bloc: _bloc),
        child: Icon(LineAwesomeIcons.plus),
        backgroundColor: Color(0xfffee56f),
        elevation: 2,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
