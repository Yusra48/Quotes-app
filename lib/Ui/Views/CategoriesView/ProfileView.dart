import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const Icon(Icons.sort,color: Colors.white,),
        title: const Text(
          'My Profile',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),
        ),
        actions: const [Icon(Icons.edit,color: Colors.white,)],
      ),
      body: const Padding(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2024/06/06/13/55/woman-8812775_640.png'),
                radius: 50,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Jennifer',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 3),
            Text(
              ' Jennifer43@gmail.com',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: [
                  ListTile(
                    leading: Icon(Icons.notifications, color: Colors.orange),
                    title: Text(
                      'Notifications',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_right),
                  ),
                  ListTile(
                    leading: Icon(Icons.share,
                        color: Colors.pinkAccent),
                    title: Text(
                      'Share',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_right),
                  ),
                  ListTile(
                    leading: Icon(Icons.facebook, color: Colors.blue),
                    title: Text(
                      'Connect with Facebook',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_right),
                  ),
                  ListTile(
                    leading: Icon(Icons.wordpress, color: Colors.green),
                    title: Text(
                      'Language',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_right),
                  ),
                  ListTile(
                    leading: Icon(Icons.group_add, color: Colors.redAccent),
                    title: Text(
                      'Invite Friends',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_right),
                  ),
                  ListTile(
                    leading: Icon(Icons.light_mode, color: Colors.blueGrey),
                    title: Text(
                      'Theme',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_right),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings, color: Colors.orangeAccent),
                    title: Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_right),
                  ),
                  ListTile(
                    leading: Icon(Icons.logout, color: Colors.lightBlueAccent),
                    title: Text(
                      'LogOut',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_right),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}