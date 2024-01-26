import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_facebook_messenger_app/screens/social_screens/main_chat_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../bottom_nav_bar/bottom_nav_bar.dart';
import '../social_screens/call_screen.dart';
import '../social_screens/people_screen.dart';
import '../social_screens/story_screen.dart';
import '../../components/app_drawer.dart';

/// Home Screen widget for the application.
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? val;
  int? screen;

  @override
  void initState() {
    super.initState();
    loaddata();
  }

  /// Loads data from shared preferences.
  void loaddata() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      val = prefs.getInt('val') ?? 0;
      screen = prefs.getInt('screen') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const AppDrawer(),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(5),
              child: badges.Badge(
                badgeContent: const Text(
                  "2",
                  style: TextStyle(color: Colors.white),
                ),
                position: badges.BadgePosition.topEnd(top: 0.1, end: 0.11),
                child: CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(0.05),
                  child: IconButton(
                    icon: const Icon(
                      Icons.menu,
                      size: 25,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                ),
              ),
            );
          },
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          _getScreenTitle(),
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'RobotoMono',
            fontSize: width * 0.07,
          ),
          textAlign: TextAlign.center,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(0.5),
              child: IconButton(
                icon: Icon(
                  _getScreenIcon(),
                  size: 25,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Builder(
          builder: (context) {
            if (screen == 0) {
              return const MainChatScreen();
            } else if (screen == 1) {
              return const CallScreen();
            } else if (screen == 2) {
              return const PeopleScreen();
            } else {
              return const StoryScreen();
            }
          },
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        height: height,
        width: width,
        screen: screen!,
        loadData: () {
          loaddata();
        },
      ),
    );
  }

  /// Get the title based on the current screen.
  String _getScreenTitle() {
    switch (screen) {
      case 0:
        return "Chats";
      case 1:
        return "Calls";
      case 2:
        return "People";
      default:
        return "Stories";
    }
  }

  /// Get the icon based on the current screen.
  IconData _getScreenIcon() {
    switch (screen) {
      case 0:
        return Icons.edit;
      case 1:
        return Icons.call;
      case 2:
        return Icons.contact_page_rounded;
      default:
        return Icons.store_outlined;
    }
  }
}
