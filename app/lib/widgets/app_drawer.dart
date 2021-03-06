import 'package:app/screens/LoginAndSignUp_screen.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LocalStorage storage = LocalStorage("usertoken");
    _logoutnow() {
      storage.clear();
      Navigator.of(context)
          .pushReplacementNamed(LoginAndSignUpScreen.routeName);
    }

    return SafeArea(
      child: Container(
        color: Colors.white,
        width: 280.0,
        height: double.infinity,
        child: ListView(children: [
          const SizedBox(
            height: 10.0,
          ),
          Image.asset('assets/logo.jpg'),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 0.0, 45.0, 10.0),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  child: Image.asset('assets/logo.jpg'),
                  radius: 40.0,
                  backgroundColor: Colors.transparent,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'USERNAME',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'POSITION',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.home,
              size: 28.0,
              color: Colors.black,
            ),
            title: const Text(
              "Home",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.work,
              size: 28.0,
              color: Colors.black,
            ),
            title: const Text(
              "Projects",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.design_services,
              size: 28.0,
              color: Colors.black,
            ),
            title: const Text(
              "Services",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.image,
              size: 28.0,
              color: Colors.black,
            ),
            title: const Text(
              "Gallery",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.people,
              size: 28.0,
              color: Colors.black,
            ),
            title: const Text(
              "RAN Family",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.verified_user_sharp,
              size: 28.0,
              color: Colors.black,
            ),
            title: const Text(
              "Collaborators",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.message,
              size: 28.0,
              color: Colors.black,
            ),
            title: const Text(
              "About Us",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          const Spacer(),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.settings,
              size: 28.0,
              color: Colors.black,
            ),
            title: const Text(
              "Settings",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          ListTile(
            onTap: () {
              _logoutnow();
            },
            leading: const Icon(
              Icons.logout,
              size: 28.0,
              color: Colors.black,
            ),
            title: const Text(
              "Logout",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ]),
      ),
    );
  }
}
