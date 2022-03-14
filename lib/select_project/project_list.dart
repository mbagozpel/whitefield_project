import 'package:flutter/material.dart';
import 'package:whitefiled/_models/project.dart';
import 'package:whitefiled/constants.dart';
import 'package:whitefiled/side_drawer.dart';
import 'package:whitefiled/simple_dialog.dart';

class ProjectList extends StatelessWidget {
  static const routeName = '/projectlist';

  ProjectList({Key? key}) : super(key: key);
  final List<Color> colors = [
    Colors.blue,
    Colors.green,
    Colors.indigo,
    Colors.purple
  ];

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    List<Project> projectList = args['projectList'];
    String title = args["title"];
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 15),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Text('Go back'),
            ),
          )
        ],
        backgroundColor: const Color(0XFF283593),
        elevation: 0,
      ),
      drawer: SideDrawer(),
      body: Container(
        decoration: const BoxDecoration(gradient: kGradients),
        child: ListView(
          children: [
            Center(
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: Colors.white),
              ),
            ),
            SizedBox(
              height: _size.height * 0.04,
            ),
            Column(
              children: List.generate(projectList.length, (index) {
                final Color color = colors[index % colors.length];
                return projectListTile(
                    leading: color,
                    project: projectList[index],
                    press: () {
                      showDialog(
                          context: context,
                          builder: (context) => ProjectDetails(
                                project: projectList[index],
                              ));
                    },
                    context: context);
              }),
            )
          ],
        ),
      ),
    );
  }

  Widget projectListTile(
      {required Color leading,
      required Project project,
      required VoidCallback press,
      required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: press,
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.grey[700]),
          child: Row(
            children: [
              CircleAvatar(backgroundColor: leading),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 300,
                    child: Text(
                      project.projectTopic,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Colors.white, overflow: TextOverflow.clip),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
