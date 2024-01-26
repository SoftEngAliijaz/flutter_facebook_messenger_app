import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:shared_preferences/shared_preferences.dart';

/// Custom Bottom Navigation Bar widget.
class CustomBottomNavigationBar extends StatelessWidget {
  final double height;
  final double width;
  final int screen;
  final Function loadData;

  const CustomBottomNavigationBar({
    super.key,
    required this.height,
    required this.width,
    required this.screen,
    required this.loadData,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      elevation: 0,
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildContainer(0, Icons.chat, "Chats"),
          _buildContainer(1, Icons.video_camera_back, "Calls"),
          _buildContainer(2, Icons.group, "People"),
          _buildContainer(3, Icons.view_array_rounded, "Stories"),
        ],
      ),
    );
  }

  /// Builds a container for a navigation item.
  Widget _buildContainer(int index, IconData icon, String label) {
    return SizedBox(
      child: Row(
        children: [
          MaterialButton(
            minWidth: width * 0.06,
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setInt('screen', index);
              print(prefs.getInt('screen'));
              loadData();
            },
            child: Column(
              children: [
                if (index == 0 &&
                    screen ==
                        0) // Display badge only for index 0 and when screen is 0
                  badges.Badge(
                    badgeContent: const Text(
                      "2",
                      style: TextStyle(color: Colors.white),
                    ),
                    position: badges.BadgePosition.topEnd(top: 0.1, end: 0.11),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        icon,
                        size: 25,
                        color: screen == index
                            ? const Color(0xff006AFF)
                            : Colors.grey,
                      ),
                    ),
                  ),
                if (index != 0 ||
                    screen != 0) // Display icon and text for other cases
                  Expanded(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        icon,
                        size: 25,
                        color: screen == index
                            ? const Color(0xff006AFF)
                            : Colors.grey,
                      ),
                    ),
                  ),
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(
                      fontFamily: 'RobotoMono',
                      color: screen == index
                          ? const Color(0xff006AFF)
                          : Colors.grey,
                      fontSize: width * 0.035,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
