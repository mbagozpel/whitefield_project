import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefiled/_models/project.dart';
import 'package:whitefiled/controllers/app_controller.dart';

class ProjectDetails extends StatelessWidget {
  final Project project;
  ProjectDetails({Key? key, required this.project}) : super(key: key);
  final AppController _controller = AppController();

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        title: Text(project.projectTopic,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.white)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        backgroundColor: const Color(0XFF283593),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        children: [
          const SizedBox(
            height: 20,
          ),
          const Divider(
            color: Colors.white,
            thickness: 2,
          ),
          const SizedBox(
            height: 10,
          ),
          Text('Supervisor:  ${project.supervisor}',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.yellow, fontSize: 18)),
          const SizedBox(
            height: 10,
          ),
          Text('Mobile: ${project.supervisorNumber}',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.yellow, fontSize: 18)),
          const SizedBox(
            height: 10,
          ),
          Text('Email: ${project.supervisorEmail}',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.yellow, fontSize: 18)),
          const SizedBox(
            height: 10,
          ),
          Text('Number of Students:  ${project.noOfStudents}',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.yellow, fontSize: 18)),
          const SizedBox(
            height: 10,
          ),
          Text('Remaining Students: ${project.studentsRemaining}',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.yellow, fontSize: 18)),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultButton(
                  text: 'Cancel',
                  press: () {
                    Navigator.pop(context);
                  }),
              const SizedBox(
                width: 20,
              ),
              Obx(
                () => _controller.isLoading.isTrue
                    ? const CircularProgressIndicator()
                    : DefaultButton(
                        text: 'Select',
                        press: () {
                          _controller.selectProject(
                              project: project, context: context);
                        }),
              )
            ],
          )
        ]);
  }
}

class DefaultButton extends StatelessWidget {
  final double size;
  final String text;
  final VoidCallback press;

  const DefaultButton({
    Key? key,
    this.size = 20,
    required this.text,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return MaterialButton(
      height: size,
      color: Colors.white,
      onPressed: press,
      minWidth: 20,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(color: const Color(0XFF283593)),
      ),
    );
  }
}
