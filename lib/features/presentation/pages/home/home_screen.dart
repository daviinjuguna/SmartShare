import 'package:SmartShare/core/utils/constants.dart';
import 'package:SmartShare/core/utils/size_config.dart';
import 'package:SmartShare/features/presentation/bloc/home/post_bloc/post_bloc.dart';
import 'package:SmartShare/features/presentation/widgets/dashboard/post_card.dart';
import 'package:SmartShare/features/presentation/widgets/dashboard/system_padding.dart';
import 'package:SmartShare/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin<HomeScreen>{
  PostBloc _bloc;
  final TextEditingController _desc = TextEditingController();
  final TextEditingController _search = TextEditingController();
  bool isSearching = false;
  
  @override
  void initState() {
    super.initState();
    _bloc = getIt<PostBloc>();
    _bloc.add(GetPostEvent());
    _desc.clear();
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
    _search.dispose();
    _desc.dispose();
  }

  // void _filterPosts(value){

  // }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (_) => _bloc,
      child: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is Loading) {
            return Center(child: CircularProgressIndicator(
                backgroundColor: Style.secondaryColor,
                valueColor: new AlwaysStoppedAnimation<Color>(Style.primaryColor),
            ),);
          }else if(state is Success){
            
            final post = state.model;
            final myPost = state.myModel;
            var filteredPosts = state.model;

            return Scaffold(
              appBar: new AppBar(
              elevation: 2,
              brightness: Brightness.light,
              backgroundColor: Colors.white,
              title: !isSearching
              ? Text("SmartShare",style: GoogleFonts.leckerliOne(
                fontSize: SizeConfig.safeBlockHorizontal*7,
              ),)
              : TextField(
                controller: _search,
                onChanged: (String value) {
                  setState(() {
                    filteredPosts = post.where(
                      (element) => element.user.name.toLowerCase().contains(value.toLowerCase())
                    ).toList();
                  });
                  print(value);
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.search,),
                  hintText: "Search user here"
                ),
              ),
              automaticallyImplyLeading: false,
              actions: [
                isSearching
                ? IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: (){
                    setState(() {
                      this.isSearching = false;
                      filteredPosts = post;
                    });
                  }
                )
              : IconButton(
                icon: Icon(Icons.search),
                onPressed: (){
                  setState(() {
                    this.isSearching = true;
                  });
                },
              ),
              ],
              ),
              body: Material(
                color: Colors.white,
                child: ListView.builder(
                // separatorBuilder: (context, index) => Divider(),
                itemCount: filteredPosts.length,
                itemBuilder: (context, index) {
                  return PostsCard(
                    post: filteredPosts[index],
                    myPost: myPost,
                    bloc: _bloc, 
                    model: filteredPosts,
                    delete: (){
                      _bloc.add(DeletePostEvent(
                        postId: filteredPosts[index].id, 
                        model: filteredPosts, 
                        myModel: myPost
                      ));
                      setState(() {
                        filteredPosts.removeWhere((element) => element.id==filteredPosts[index].id);
                      });
                    },
                    edit: (){
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
                                        borderRadius: BorderRadius.circular(5)
                                      ),
                                      hintText: filteredPosts[index].desc
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          actions: [
                            new FlatButton(
                              onPressed: ()=>Navigator.pop(context),
                              child: Text('CANCEL',style: TextStyle(color: Colors.grey[800]),),
                            ),
                            new FlatButton(
                              onPressed: (){
                                _bloc.add(EditPostEvent(
                                  postId: filteredPosts[index].id, 
                                  postDescription: _desc.text,
                                  model: filteredPosts, 
                                  myModel: myPost
                                ));
                                var editedPost = filteredPosts.firstWhere((element) => element.id==filteredPosts[index].id,orElse: ()=>null);
                                if(editedPost != null)setState(() {
                                  editedPost.desc = _desc.text;
                                });
                                Navigator.pop(context);
                              },
                              child: Text('SUBMIT',style: TextStyle(color: Colors.yellow[700]),),
                            )
                          ],
                        ),
                      )
                    );
                    },
                  );
                },
          ),
              ),
            );
          }else{
            return Container();
          }
        },
      ),
    );
  }
  @override
  bool get wantKeepAlive => true;
}


