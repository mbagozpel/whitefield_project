import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefiled/admin/admin.dart';
import 'package:whitefiled/controllers/app_controller.dart';
import 'package:whitefiled/login/login.dart';
import 'package:whitefiled/utilities.dart';

class SideDrawer extends StatelessWidget {
  SideDrawer({Key? key}) : super(key: key);
  final AppController _controller = Get.find<AppController>();

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
              Icons.person,
              color: Colors.white,
            ),
            title: Text(
              'Admin',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.white),
            ),
            onTap: () {
              if (_controller.user.value.name.trim().toLowerCase() ==
                  'mba whitefield') {
                Navigator.pushNamed(context, Admin.routeName);
              } else {
                showSnackBar(context: context, text: 'Restricted area');
              }
            },
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
