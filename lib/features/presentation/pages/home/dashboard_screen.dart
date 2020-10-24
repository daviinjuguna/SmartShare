import 'package:SmartShare/core/utils/size_config.dart';
import 'package:SmartShare/features/presentation/bloc/auth/intro_bloc/intro_bloc.dart';
import 'package:SmartShare/features/presentation/pages/home/home_screen.dart';
import 'package:SmartShare/features/presentation/widgets/dashboard/register_select_image_list.dart';
import 'package:SmartShare/injection.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }
  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      appBar: new AppBar(
        elevation: 2,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        title: Text("SmartShare",style: GoogleFonts.leckerliOne(
          fontSize: SizeConfig.safeBlockHorizontal*7,
        ),),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.search,),
            onPressed: (){}
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index){
          setState(() => _currentIndex = index);
        },
        children: [
          HomeScreen(),
          Container(
            color: Colors.grey[200],
          ),
        ],
      ),
      bottomNavigationBar: BubbleBottomBar(
        opacity: 1,
        currentIndex: _currentIndex,
        onTap: (index){
           setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        fabLocation: BubbleBottomBarFabLocation.end,
        elevation: 2,
        hasNotch: true, //new
        items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(backgroundColor: Color(0xfffee56f), icon: Icon(LineAwesomeIcons.home,color: Colors.black,), activeIcon: Icon(LineAwesomeIcons.home, color:Colors.black,), title: Text("Home",style: TextStyle(color: Colors.black),)),
            BubbleBottomBarItem(backgroundColor: Color(0xfffee56f), icon: Icon(LineAwesomeIcons.user,color: Colors.black,), activeIcon: Icon(LineAwesomeIcons.user, color: Colors.black,), title: Text("Profile",style: TextStyle(color: Colors.black),))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>Navigator.of(context).pushNamed("/newPost"),
        child: Icon(LineAwesomeIcons.plus),
        backgroundColor: Color(0xfffee56f),
        elevation: 2,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}