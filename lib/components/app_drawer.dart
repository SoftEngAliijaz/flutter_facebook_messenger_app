import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_facebook_messenger_app/constants/constants.dart';

/// Widget representing the application drawer.
class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: const EdgeInsets.only(top: 50, right: 10, left: 10),
        children: <Widget>[
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      _buildAvatarWithBadge(
                        AppUtils.profilePic1,
                        "Muhammad Ali",
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down_sharp,
                        size: 40,
                      )
                    ],
                  ),
                  const Icon(
                    Icons.settings_rounded,
                    size: 30,
                  )
                ],
              ),
              const SizedBox(height: 10),
              _buildChatDrawerItem("Chats", Icons.chat, badgeCount: 1),
              const SizedBox(height: 10),
              _buildDrawerItem("Marketplace", Icons.shopping_bag),
              const SizedBox(height: 10),
              _buildDrawerItem("Message requests", Icons.chat_bubble_rounded),
              const SizedBox(height: 10),
              _buildDrawerItem("Archive", Icons.unarchive),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Communities",
                    style: TextStyle(
                      color: Colors.grey.withOpacity(0.5),
                      fontFamily: 'Raleway',
                      fontSize: width * 0.04,
                    ),
                  ),
                  Text(
                    "EDIT",
                    style: TextStyle(
                      color: Colors.blue,
                      fontFamily: 'Raleway',
                      fontSize: width * 0.04,
                    ),
                  ),
                ],
              ),
            ],
          ),
          _buildCommunityItem(
            "ICC-International Cricket Council",
            'https://yt3.googleusercontent.com/3K6h6gpMPf4mK9qh6SXTl0W3PLxnOMzUnFHc2lbS9t-ucS-b4JGcR8nW7ja9XDYkHM-kAnijk2c=s900-c-k-c0x00ffffff-no-rj',
            '5M active',
          ),
          _buildCommunityItem(
            "ACC-Asian Cricket Council",
            'https://vectorseek.com/wp-content/uploads/2023/06/Asia-Cup-2023-Logo-Vector.jpg',
            '2M active',
          ),
          _buildCommunityItem(
            "ICC-International Cricket Council",
            'https://yt3.googleusercontent.com/3K6h6gpMPf4mK9qh6SXTl0W3PLxnOMzUnFHc2lbS9t-ucS-b4JGcR8nW7ja9XDYkHM-kAnijk2c=s900-c-k-c0x00ffffff-no-rj',
            '5M active',
          ),
          _buildCommunityItem(
            "ACC-Asian Cricket Council",
            'https://vectorseek.com/wp-content/uploads/2023/06/Asia-Cup-2023-Logo-Vector.jpg',
            '2M active',
          ),
        ],
      ),
    );
  }

  /// Builds a row with an avatar and badge.
  Widget _buildAvatarWithBadge(String imageUrl, String label) {
    return Row(
      children: [
        badges.Badge(
          badgeStyle: const badges.BadgeStyle(
            elevation: 50,
            badgeColor: Colors.red,
          ),
          badgeContent: const Text(
            "1",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          position: badges.BadgePosition.topStart(top: -10, start: 30),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.blue,
            backgroundImage: NetworkImage(imageUrl),
          ),
        ),
        const SizedBox(width: 15),
        Text(
          label,
          style: const TextStyle(color: Colors.black, fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  /// Builds a drawer item with an icon.
  Widget _buildDrawerItem(String title, IconData iconData, {int? badgeCount}) {
    return _buildItem(
      title,
      iconData,
      Colors.white,
      badgeCount,
    );
  }

  /// Builds a chat drawer item with an icon.
  Widget _buildChatDrawerItem(String title, IconData iconData,
      {int? badgeCount}) {
    return _buildItem(
      title,
      iconData,
      Colors.grey.withOpacity(0.1),
      badgeCount,
    );
  }

  /// Builds a community item.
  Widget _buildCommunityItem(String title, String imageUrl, String subtitle) {
    return ListTile(
      minVerticalPadding: 2,
      leading: CircleAvatar(
        radius: 20,
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: () {
        // Add your onTap logic here
      },
    );
  }

  /// Builds a generic drawer item.
  Widget _buildItem(
    String title,
    IconData iconData,
    Color backgroundColor,
    int? badgeCount,
  ) {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5),
      height: 50,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey.withOpacity(0.2),
                child: IconButton(
                  icon: Icon(
                    iconData,
                    size: 25,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
              ),
              const SizedBox(width: 15),
              Text(
                title,
                style: const TextStyle(color: Colors.black, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          if (badgeCount != null)
            CircleAvatar(
              radius: 10,
              child: Text(badgeCount.toString()),
            ),
        ],
      ),
    );
  }
}
