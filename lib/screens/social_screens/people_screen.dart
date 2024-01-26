import 'package:flutter/material.dart';
import 'package:flutter_facebook_messenger_app/constants/constants.dart';

/// Widget for displaying people-related information.
class PeopleScreen extends StatefulWidget {
  const PeopleScreen({Key? key}) : super(key: key);

  @override
  State<PeopleScreen> createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          // Facebook updates section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Facebook updates(200)",
                style: TextStyle(
                  color: Colors.grey.withOpacity(0.5),
                  fontFamily: 'Raleway',
                  fontSize: width * 0.04,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "SEE ALL",
                style: TextStyle(
                  color: Colors.blue,
                  fontFamily: 'Raleway',
                  fontSize: width * 0.04,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          // List of Facebook updates
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: ListTile(
                  leading: const CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blue,
                    backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D',
                    ),
                  ),
                  title: Text(AppUtils.randomPeopleNames[index]),
                  subtitle: const Text(
                    'Lorem ipsum dolor sit amet.',
                  ),
                ),
              );
            },
          ),
          // Chats in your Communities section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Chats in your Communities",
                style: TextStyle(
                  color: Colors.grey.withOpacity(0.5),
                  fontFamily: 'Raleway',
                  fontSize: width * 0.04,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "SEE ALL",
                style: TextStyle(
                  color: Colors.blue,
                  fontFamily: 'Raleway',
                  fontSize: width * 0.04,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          // List of chats in your communities
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: ListTile(
                  leading: const CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      'https://yt3.googleusercontent.com/3K6h6gpMPf4mK9qh6SXTl0W3PLxnOMzUnFHc2lbS9t-ucS-b4JGcR8nW7ja9XDYkHM-kAnijk2c=s900-c-k-c0x00ffffff-no-rj',
                    ),
                  ),
                  title: const Text("ICC-International Cricket Council"),
                  subtitle: const Text(
                    'Lorem ipsum dolor sit amet.',
                  ),
                  onTap: () {
                    // Add your onTap logic here
                  },
                ),
              );
            },
          ),
          // Suggested Communities section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Suggested Communities",
                style: TextStyle(
                  color: Colors.grey.withOpacity(0.5),
                  fontFamily: 'Raleway',
                  fontSize: width * 0.04,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "SEE ALL",
                style: TextStyle(
                  color: Colors.blue,
                  fontFamily: 'Raleway',
                  fontSize: width * 0.04,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          // List of suggested communities
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(3),
                child: ListTile(
                  leading: const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blue,
                    backgroundImage: NetworkImage(
                      'https://vectorseek.com/wp-content/uploads/2023/06/Asia-Cup-2023-Logo-Vector.jpg',
                    ),
                  ),
                  title: const Text("ACC-Asian Cricket Council"),
                  subtitle: const Text(
                    'Lorem ipsum dolor sit amet.',
                  ),
                  onTap: () {
                    // Add your onTap logic here
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
