import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefiled/_models/students.dart';
import 'package:whitefiled/select_project/select_project.dart';
import 'package:whitefiled/utilities.dart';

class AppController extends GetxController {
  var user = Student(matNumber: '', name: '').obs;
  var isLoading = false.obs;

  void login(
      {required String name,
      required String matNumber,
      required BuildContext context}) {
    try {
      isLoading(true);
      Future.delayed(const Duration(seconds: 2), () {
        for (var student in studentList) {
          if (student.matNumber.toLowerCase() == matNumber.toLowerCase() &&
              student.name.toLowerCase() == name.toLowerCase()) {
            user.value = student;
            Navigator.pushNamed(context, SelectProject.routeName);
            break;
          } else {
            showSnackBar(context: context, text: "User not found");
            break;
          }
        }
      });
    } finally {
      isLoading(false);
    }
  }
}
