import 'package:chat_app/pages/home_page.dart';
import 'package:chat_app/service/auth_service.dart';
import 'package:chat_app/widgets/widget.dart';
import 'package:flutter/material.dart';

import 'auth/login_page.dart';


class ProfilePage extends StatefulWidget {
  final String userName;
  final String userEmail;

  const ProfilePage({super.key, required this.userName, required this.userEmail});
 

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(title: const Text("Profile", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 27,),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 5,
      centerTitle: true,

      ),
      drawer:  Drawer(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 50),
          children: [
            Icon(
              Icons.account_circle,
              size: 150,
              color: Colors.grey[700],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.userName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 22),
            ),
            const Divider(
              height: 2,
            ),
            ListTile(
              onTap: () {
                nextScreenReplace(context, const HomePage());
              },
              leading: const Icon(Icons.group),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              title: const Text(
                "Groups",
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              onTap: () {
                    },
              selectedColor: Theme.of(context).primaryColor,
              selected: true,
              leading: const Icon(Icons.person),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              title: const Text(
                "Profie",
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (ctx) {
                      return AlertDialog(
                        title: const Text("Logout"),
                        content:
                            const Text("Are you sure you want to lougout?"),
                        actions: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.cancel,
                              color: Colors.red,
                            ),
                          ),
                          IconButton(
                              onPressed: ()  {
                                authService.signOut();
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LogInPage()),
                                    (route) => false);
                              },
                              icon: const Icon(
                                Icons.done,
                                color: Colors.green,
                              ))
                        ],
                      );
                    });
              },
              leading: const Icon(Icons.exit_to_app),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              title: const Text(
                "Logout",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      body: Container(padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 130),
           child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:  [
           const Icon(Icons.account_circle, size: 200, color: Colors.grey,),
           const SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
             const Text("userName", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300,fontSize: 17),),
             Text(widget.userName,style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold,fontSize: 17) )
            ],),
             const Divider(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
             const Text("userEmail", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300,fontSize: 17),),
             Text(widget.userEmail,style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold,fontSize: 17) )
            ],),

           ]),
           
            ),
            
    );
  }
}
