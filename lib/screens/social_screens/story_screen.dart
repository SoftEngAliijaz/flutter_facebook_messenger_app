import 'package:flutter/material.dart';
import 'package:flutter_facebook_messenger_app/constants/constants.dart';

/// Widget for displaying stories.
class StoryScreen extends StatefulWidget {
  const StoryScreen({Key? key}) : super(key: key);

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          // First row of stories
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStory(
                imageUrl:
                    'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D',
                name: 'Add a story',
                isAddStory: true,
              ),
              _buildStory(
                imageUrl: AppUtils.profilePic1,
                name: 'Facebook User',
              ),
            ],
          ),
          SizedBox(height: 10),
          // Second row of stories
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStory(
                imageUrl: AppUtils.profilePic2,
                name: 'Facebook User',
              ),
              _buildStory(
                imageUrl: AppUtils.profilePic3,
                name: 'Facebook User',
              ),
            ],
          ),
          SizedBox(height: 10),
          // Third row of stories
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStory(
                imageUrl: AppUtils.profilePic4,
                name: 'Facebook User',
              ),
              _buildStory(
                imageUrl: AppUtils.profilePic5,
                name: 'Facebook User',
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Widget for building a single story item.
  Widget _buildStory({
    required String imageUrl,
    required String name,
    bool isAddStory = false,
  }) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Background container for the story image
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          width: MediaQuery.of(context).size.width * 0.45,
          height: MediaQuery.of(context).size.height * 0.3,
        ),

        // Circular avatar or add icon on top
        Positioned(
          top: 5.0,
          left: 5.0,
          child: isAddStory
              ? CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.add, color: Colors.white),
                )
              : Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      width: 3.0,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 20.0,
                    backgroundColor: Colors.blue,
                    backgroundImage: NetworkImage(
                      imageUrl,
                    ),
                  ),
                ),
        ),

        // Text below the story image
        Positioned(
          bottom: 10,
          left: 10,
          child: Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Raleway",
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ],
    );
  }
}
