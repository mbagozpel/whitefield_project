import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefiled/controllers/app_controller.dart';
import 'package:whitefiled/simple_dialog.dart';

import '../constants.dart';
import '../side_drawer.dart';

class Admin extends StatelessWidget {
  static const routeName = '/admin';
  Admin({Key? key}) : super(key: key);
  final AppController _controller = Get.find<AppController>();
  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF283593),
        elevation: 0,
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
      ),
      drawer: SideDrawer(),
      body: Container(
        decoration: const BoxDecoration(gradient: kGradients),
        child: ListView(
          children: [
            Center(
              child: Text(
                'Add Project',
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: Colors.blue[50]),
              ),
            ),
            SizedBox(height: _size.height * 0.04),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    _projectTopic(context),
                    const SizedBox(height: 20),
                    _projectType(context),
                    const SizedBox(height: 20),
                    _noOfStudent(context),
                    const SizedBox(height: 20),
                    _supervisor(context),
                    const SizedBox(height: 20),
                    _supervisorEmail(context),
                    const SizedBox(height: 20),
                    _supervisorEmail(context),
                    const SizedBox(height: 20),
                    _supervisorNumber(context),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: DefaultButton(
                  text: 'Add Project',
                  size: 40,
                  press: () {
                    bool isValid = formKey.currentState!.validate();

                    if (isValid) {
                      formKey.currentState!.save();
                      _controller.addProject(
                          project: _controller.project, context: context);
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget _projectTopic(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) return 'Please enter a value';
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none),
          fillColor: Colors.grey[700],
          filled: true,
          hintText: 'Enter Project\'s Topic',
          hintStyle: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Colors.white)),
      onSaved: (value) {
        _controller.project.projectTopic = value!;
      },
    );
  }

  Widget _projectType(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) return 'Please enter a value';
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none),
          fillColor: Colors.grey[700],
          filled: true,
          hintText: 'Enter Project\'s Type',
          hintStyle: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Colors.white)),
      onSaved: (value) {
        _controller.project.projectType = value!;
      },
    );
  }

  Widget _supervisor(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) return 'Please enter a value';
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none),
          fillColor: Colors.grey[700],
          filled: true,
          hintText: 'Enter Supervisor\'s name',
          hintStyle: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Colors.white)),
      onSaved: (value) {
        _controller.project.supervisor = value!;
      },
    );
  }

  Widget _noOfStudent(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) return 'Please enter a value';
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none),
          fillColor: Colors.grey[700],
          filled: true,
          hintText: 'Enter Number of required students',
          hintStyle: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Colors.white)),
      onSaved: (value) {
        _controller.project.noOfStudents = value!;
      },
    );
  }

  Widget _supervisorNumber(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) return 'Please enter a value';
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none),
          fillColor: Colors.grey[700],
          filled: true,
          hintText: 'Enter Supervisor\'s mobile',
          hintStyle: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Colors.white)),
      onSaved: (value) {
        _controller.project.supervisorNumber = value!;
      },
    );
  }

  Widget _supervisorEmail(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) return 'Please enter a value';
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none),
          fillColor: Colors.grey[700],
          filled: true,
          hintText: 'Enter Supervisor\'s email',
          hintStyle: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Colors.white)),
      onSaved: (value) {
        _controller.project.supervisorEmail = value!;
      },
    );
  }
}
