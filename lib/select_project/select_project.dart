import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefiled/constants.dart';
import 'package:whitefiled/controllers/app_controller.dart';
import 'package:whitefiled/select_project/project_list.dart';
import 'package:whitefiled/side_drawer.dart';

class SelectProject extends StatelessWidget {
  static const routeName = '/selectproject';
  SelectProject({Key? key}) : super(key: key);
  final AppController _controller = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF283593),
        elevation: 0,
      ),
      drawer: SideDrawer(),
      body: Container(
        decoration: const BoxDecoration(gradient: kGradients),
        child: ListView(
          children: [
            SizedBox(height: _size.height * 0.2),
            Obx(
              () => _controller.isLoading.isTrue
                  ? CircularProgressIndicator()
                  : Center(
                      child: Column(
                        children: [
                          Text(
                            'Select Project Options',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.blue[50]),
                          ),
                          SizedBox(height: _size.height * 0.1),
                          projectTile(
                              leading: Icons.settings,
                              text: 'Electronics Projects',
                              suffix: Icons.arrow_forward_ios,
                              press: () {
                                Navigator.pushNamed(
                                    context, ProjectList.routeName,
                                    arguments: {
                                      "projectList": _controller.projectList
                                          .where((p) =>
                                              p.projectType == 'electronics')
                                          .toList(),
                                      "title": "Electronics Projects"
                                    });
                              },
                              context: context),
                          SizedBox(height: _size.height * 0.03),
                          projectTile(
                              leading: Icons.power,
                              text: 'Power Projects',
                              suffix: Icons.arrow_forward_ios,
                              press: () {
                                Navigator.pushNamed(
                                    context, ProjectList.routeName,
                                    arguments: {
                                      "projectList": _controller.projectList
                                          .where(
                                              (p) => p.projectType == 'power')
                                          .toList(),
                                      "title": "Electronics Projects"
                                    });
                              },
                              context: context)
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget projectTile(
      {required IconData leading,
      required String text,
      required IconData suffix,
      required VoidCallback press,
      required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: press,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.grey[700]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    leading,
                    color: Colors.blue,
                    size: 40,
                  ),
                  const SizedBox(width: 20),
                  Text(text,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.white)),
                ],
              ),
              Icon(suffix, color: Colors.white)
            ],
          ),
        ),
      ),
    );
  }
}
