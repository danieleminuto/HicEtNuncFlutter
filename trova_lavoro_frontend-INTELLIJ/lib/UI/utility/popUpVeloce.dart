import 'package:flutter/material.dart';

class popUpVeloce extends StatelessWidget {
  String message;
  popUpVeloce({Key key, @required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   /* showDialog(
      context: context,
      builder: (BuildContext context) {*/
        return AlertDialog(
          content: Text(message),
          actions: [
            FlatButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );

  }
}
