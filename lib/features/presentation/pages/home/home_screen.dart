import 'package:SmartShare/core/utils/constants.dart';
import 'package:SmartShare/core/utils/size_config.dart';
import 'package:SmartShare/features/presentation/bloc/home/post_bloc/post_bloc.dart';
import 'package:SmartShare/features/presentation/widgets/dashboard/post_card.dart';
import 'package:SmartShare/features/presentation/widgets/dashboard/system_padding.dart';
import 'package:SmartShare/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin<HomeScreen>{
  PostBloc _bloc;
  final TextEditingController _desc = TextEditingController();

  
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
    _desc.dispose();
  }

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
            return ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemCount: post.length,
            itemBuilder: (context, index) {
              return PostsCard(
                post: post[index],
                myPost: myPost,
                bloc: _bloc, 
                model: post,
                delete: (){
                  _bloc.add(DeletePostEvent(
                    postId: post[index].id, 
                    model: post, 
                    myModel: myPost
                  ));
                  setState(() {
                    post.removeWhere((element) => element.id==post[index].id);
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
                                  hintText: post[index].desc
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
                              postId: post[index].id, 
                              postDescription: _desc.text,
                              model: post, 
                              myModel: myPost
                            ));
                            var editedPost = post.firstWhere((element) => element.id==post[index].id,orElse: ()=>null);
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


