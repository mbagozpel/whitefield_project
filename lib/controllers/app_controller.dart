import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefiled/_firebase/firebaseDB.dart';
import 'package:whitefiled/_models/students.dart';
import 'package:whitefiled/select_project/select_project.dart';
import 'package:whitefiled/utilities.dart';

import '../_models/project.dart';

class AppController extends GetxController {
  var user = Student(matNumber: '', name: '').obs;
  var isLoading = false.obs;
  var projectList = <Project>[].obs;
  var studentList = <Student>[].obs;
  final FirebaseDB _database = FirebaseDB();
  var selectedProject = <Project>[].obs;
  Project project = Project(
      projectType: '',
      id: '',
      projectTopic: '',
      noOfStudents: '',
      supervisorEmail: '',
      supervisorNumber: '',
      studentsRemaining: '',
      supervisor: '');

  @override
  void onInit() {
    getStudents();
    getProjects();
    super.onInit();
  }

  void getProjects() async {
    try {
      var projects = await _database.getProjects();

      for (var proj in projects.docs) {
        Project project = Project.fromSnapshot(proj);

        projectList.add(project);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void getStudents() async {
    try {
      var students = await _database.getStudents();
      inspect(students);
      for (var stud in students.docs) {
        Student student = Student.fromSnapshot(stud);

        studentList.add(student);
      }
    } catch (e) {}
  }

  void addProject(
      {required Project project, required BuildContext context}) async {
    try {
      DocumentReference result = await _database.addProject(project: project);
    } catch (e) {
      showSnackBar(context: context, text: e.toString());
    }
  }

  void login({
    required String name,
    required String matNumber,
    required BuildContext context,
  }) {
    try {
      if (studentList.isNotEmpty) {
        bool exist = studentList.any((element) =>
            element.matNumber.trim().toLowerCase() ==
                matNumber.trim().toLowerCase() &&
            element.name.trim().toLowerCase() == name.trim().toLowerCase());
        if (exist) {
          user.value = studentList.singleWhere((element) =>
              element.matNumber.trim().toLowerCase() ==
                  matNumber.trim().toLowerCase() &&
              element.name.trim().toLowerCase() == name.trim().toLowerCase());

          Navigator.pushNamed(context, SelectProject.routeName);
        } else {
          showSnackBar(context: context, text: 'User does not exist');
        }
      } else {
        showSnackBar(context: context, text: 'Please hold on');
      }
    } catch (e) {
      showSnackBar(context: context, text: 'An error has occurred');
    }
  }

  void selectProject(
      {required Project project, required BuildContext context}) async {
    try {
      isLoading(true);
      var proj = await _database.getProject(project.id);

      Project proje = Project.fromSnapshot(proj);

      if (proje.studentsRemaining == "0") {
        showSnackBar(context: context, text: 'Limit exceeded');
      } else {
        proje.studentsRemaining =
            (int.parse(proje.studentsRemaining) - 1).toString();
        inspect(proje.id);
        await _database.updatedProject(proje.id, project);

        getProjects();
      }
    } catch (e) {
      showSnackBar(context: context, text: 'An error has occurred');
    } finally {
      isLoading(false);
    }
  }
}
