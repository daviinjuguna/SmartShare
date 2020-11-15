import 'package:SmartShare/core/utils/constants.dart';
import 'package:SmartShare/core/utils/size_config.dart';
import 'package:SmartShare/features/domain/entities/home/get_my_post.dart';
import 'package:SmartShare/features/domain/entities/home/get_post.dart';
import 'package:SmartShare/features/presentation/bloc/home/post_bloc/post_bloc.dart';
import 'package:SmartShare/features/presentation/widgets/dashboard/post_card.dart';
import 'package:SmartShare/features/presentation/widgets/dashboard/system_padding.dart';
import 'package:SmartShare/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  final filteredPosts, myPost, bloc;
  const HomeScreen(
      {Key key,
      @required this.filteredPosts,
      @required this.myPost,
      @required this.bloc})
      : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin<HomeScreen>{
  // PostBloc _bloc;
  final TextEditingController _desc = TextEditingController();
  // final TextEditingController _search = TextEditingController();
  // List<GetPost> filteredPosts = [];
  // GetMyPost myPost;

  @override
  void initState() {
    super.initState();
    // _bloc = getIt<PostBloc>();
    // _bloc.add(GetPostEvent());
    _desc.clear();
  }

  @override
  void dispose() {
    super.dispose();

    // _search.dispose();
    _desc.dispose();
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  // }
  // void _filterPosts(value){

  // }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: new AppBar(
        elevation: 2,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        title: Text(
          "eKonnect",
          style: GoogleFonts.leckerliOne(
            fontSize: SizeConfig.safeBlockHorizontal * 7,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Material(
        color: Colors.white,
        child: ListView.builder(
          // separatorBuilder: (context, index) => Divider(),
          itemCount: widget.filteredPosts.length,
          itemBuilder: (context, index) {
            return PostsCard(
              post: widget.filteredPosts[index],
              myPost: widget.myPost,
              bloc: widget.bloc,
              model: widget.filteredPosts,
              delete: () {
                widget.bloc.add(DeletePostEvent(
                    postId: widget.filteredPosts[index].id,
                    model: widget.filteredPosts,
                    myModel: widget.myPost));
                setState(() {
                  widget.filteredPosts.removeWhere((element) =>
                      element.id == widget.filteredPosts[index].id);
                });
              },
              edit: () {
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
                                controller: _desc,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    hintText: widget.filteredPosts[index].desc),
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
                              if (_desc.text.isEmpty) return;
                              widget.bloc.add(EditPostEvent(
                                  postId: widget.filteredPosts[index].id,
                                  postDescription: _desc.text,
                                  model: widget.filteredPosts,
                                  myModel: widget.myPost));
                              var editedPost = widget.filteredPosts.firstWhere(
                                  (element) =>
                                      element.id ==
                                      widget.filteredPosts[index].id,
                                  orElse: () => null);
                              if (editedPost != null)
                                setState(() {
                                  editedPost.desc = _desc.text;
                                });
                              Navigator.pop(context);
                            },
                            child: Text(
                              'SUBMIT',
                              style: TextStyle(color: Colors.yellow[700]),
                            ),
                          )
                        ],
                      ),
                    ));
              },
            );
          },
        ),
      ),
    );
  }

  

  @override
  bool get wantKeepAlive => true;
}

// (state is Loading) {
//             return Center(
//               child: CircularProgressIndicator(
//                 backgroundColor: Style.secondaryColor,
//                 valueColor:
//                     new AlwaysStoppedAnimation<Color>(Style.primaryColor),
//               ),
//             );
//           } else if (state is Success) {
//             final myPost = state.myModel;
//             var filteredPosts = state.model;
