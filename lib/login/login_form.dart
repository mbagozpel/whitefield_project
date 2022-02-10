import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefiled/controllers/app_controller.dart';
import 'package:whitefiled/default_button.dart';

class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);
  final AppController _controller = Get.put(AppController());
  static final TextEditingController name = TextEditingController();
  static final TextEditingController matNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(
            "Student Login",
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.white),
          ),
          SizedBox(
            height: _size.height * 0.04,
          ),
          TextField(
            controller: name,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.white, fontSize: 18),
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              hintText: 'Student Name',
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.white, fontSize: 18),
              filled: true,
              fillColor: Colors.grey[800],
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          SizedBox(
            height: _size.height * 0.03,
          ),
          TextField(
            controller: matNumber,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.white, fontSize: 18),
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              hintText: 'Matric Number',
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.white, fontSize: 18),
              filled: true,
              fillColor: Colors.grey[800],
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          SizedBox(
            height: _size.height * 0.03,
          ),
          Obx(
            () => _controller.isLoading.isTrue
                ? const CircularProgressIndicator()
                : DefaultButton(
                    title: 'Login',
                    press: () {
                      _controller.login(
                          name: name.text.trim(),
                          matNumber: matNumber.text.trim(),
                          context: context);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
