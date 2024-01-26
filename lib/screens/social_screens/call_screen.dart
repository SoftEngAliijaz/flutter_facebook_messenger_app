import 'package:flutter/material.dart';
import 'package:flutter_facebook_messenger_app/constants/constants.dart';

/// Call Screen widget for displaying call-related information.
class CallScreen extends StatefulWidget {
  const CallScreen({Key? key}) : super(key: key);

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container for no calls message and start call button
          Container(
            height: 250,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "No Calls",
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 15,
                  ),
                ),
                const Text("Recent calls will appear here"),
                ElevatedButton(
                  onPressed: () {
                    // Handle start call button press
                  },
                  child: const Text(
                    "Start a Call",
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Suggestions section title
          const Text(
            "Suggestions",
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
          // List of suggested contacts
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Contact details (avatar and name)
                    Container(
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D',
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            AppUtils.randomPeopleNames[index],
                            style: const TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Call and video call icons
                    const Row(
                      children: [
                        CircleAvatar(
                          child: Icon(
                            Icons.call,
                            size: 20,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          child: Icon(
                            Icons.video_camera_back,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
