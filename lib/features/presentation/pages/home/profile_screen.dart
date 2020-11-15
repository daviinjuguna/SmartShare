import 'package:SmartShare/core/routes/router.gr.dart';
import 'package:SmartShare/core/utils/constants.dart';
import 'package:SmartShare/core/utils/size_config.dart';
import 'package:SmartShare/features/domain/entities/home/get_my_post.dart';
import 'package:SmartShare/features/presentation/bloc/home/post_bloc/post_bloc.dart';
import 'package:SmartShare/features/presentation/widgets/components/custom_button.dart';
import 'package:SmartShare/features/presentation/widgets/dashboard/my_post_card.dart';
import 'package:SmartShare/features/presentation/widgets/dashboard/post_card.dart';
import 'package:SmartShare/features/presentation/widgets/dashboard/profile_body.dart';
import 'package:SmartShare/features/presentation/widgets/dashboard/system_padding.dart';
import 'package:SmartShare/injection.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileScreen extends StatefulWidget {
  final post, myPost, bloc, filteredPhoto;
  ProfileScreen(
      {Key key,
      @required this.post,
      @required this.myPost,
      @required this.bloc,
      @required this.filteredPhoto})
      : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with AutomaticKeepAliveClientMixin<ProfileScreen> {
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
    return Scaffold(
      appBar: new AppBar(
        elevation: 2,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        title: Text(
          "Profile",
          style: GoogleFonts.leckerliOne(
            fontSize: SizeConfig.safeBlockHorizontal * 7,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: ProfileBody(
        post: widget.post,
        myPost: widget.myPost,
        bloc: widget.bloc,
        filteredPhoto: widget.filteredPhoto,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
