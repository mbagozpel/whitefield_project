import 'package:flutter/material.dart';

void showSnackBar({required BuildContext context, required String text}) {
  final SnackBar snackBar = SnackBar(
    content: Text(
      text,
      style:
          Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white),
    ),
    backgroundColor: Colors.blue,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
