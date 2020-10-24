import 'package:SmartShare/core/utils/constants.dart';
import 'package:SmartShare/core/utils/size_config.dart';
import 'package:SmartShare/features/presentation/bloc/home/post_bloc/post_bloc.dart';
import 'package:SmartShare/features/presentation/widgets/dashboard/post_card.dart';
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

  @override
  void initState() {
    super.initState();
    _bloc = getIt<PostBloc>();
    _bloc.add(GetPostEvent());
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
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
            return ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemCount: post.length,
            itemBuilder: (context, index) {
              return PostsCard(post: post[index],);
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


