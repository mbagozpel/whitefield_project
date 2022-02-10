import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whitefiled/constants.dart';
import 'package:whitefiled/login/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: kGradients),
        child: ListView(
          children: [
            SizedBox(
              height: _size.height * 0.1,
            ),
            SvgPicture.asset(
              'assets/images/6520.svg',
              height: 200,
            ),
            Center(
              child: RichText(
                  text: TextSpan(
                      text: 'Project',
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: Colors.white),
                      children: [
                    TextSpan(
                        text: 'PICKER',
                        style: Theme.of(context)
                            .textTheme
                            .headline3!
                            .copyWith(color: Colors.blue[300]))
                  ])),
            ),
            SizedBox(
              height: _size.height * 0.1,
            ),
            LoginForm()
          ],
        ),
      ),
    );
  }
}
