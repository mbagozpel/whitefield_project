import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String title;
  final VoidCallback press;
  const DefaultButton({Key? key, required this.title, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: press,
      child: Text(title,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.white)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      color: Colors.blue,
      minWidth: double.infinity,
      height: 50,
    );
  }
}
