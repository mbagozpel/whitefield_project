import 'package:flutter/material.dart';
import 'package:whitefiled/login/login.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Drawer(
      backgroundColor: const Color(0XFF283593),
      child: Column(
        children: [
          DrawerHeader(
            child: Center(
              child: RichText(
                  text: TextSpan(
                      text: 'Project',
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: Colors.white),
                      children: [
                    TextSpan(
                        text: 'PICKER',
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Colors.blue[300]))
                  ])),
            ),
          ),
          const Divider(
            thickness: 2,
            color: Colors.white,
          ),
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            title: Text(
              'Logout',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.white),
            ),
            onTap: () {
              Navigator.pushNamed(context, LoginScreen.routeName);
            },
          )
        ],
      ),
    );
  }
}
