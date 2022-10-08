import 'package:chat_app/Helper/helper_function.dart';
import 'package:chat_app/pages/auth/login_page.dart';
import 'package:chat_app/pages/profile_page.dart';
import 'package:chat_app/pages/search_page.dart';
import 'package:chat_app/service/auth_service.dart';
import 'package:chat_app/widgets/widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userName = "";
  String email = "";

  AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  getUserData() async {
    await HelperFunction.getUserEmailFromSF().then((value) {
      setState(() {
        email = value!;
      });
    });
    await HelperFunction.getuserNameFromSF().then((val) {
      setState(() {
        userName = val!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                nextScreen(context, const SearchPage());
              },
              icon: const Icon(Icons.search))
        ],
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 5,
        title: const Text(
          "Groups",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 27),
        ),
      ),
      drawer: Drawer(
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
              userName,
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
              onTap: () {},
              selectedColor: Theme.of(context).primaryColor,
              selected: true,
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
                nextScreenReplace(context,  ProfilePage(userName: userName, userEmail: email,));
              },
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
      body: const Center(
        child: Text('This is home page '),
      ),
    );
  }
}
