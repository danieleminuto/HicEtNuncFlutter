import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';

class InputField extends StatelessWidget {
  final String labelText;
  final bool multiline;
  final bool enabled;
  final bool isPassword;
  final bool isUsername;
  final Function onChanged;
  final Function onSubmit;
  final Function onTap;
  final int maxLength;
  final TextAlign textAlign;
  final TextEditingController controller;
  final TextInputType keyboardType;


  const InputField({Key key, this.labelText, this.controller, this.onChanged, this.onSubmit, this.onTap, this.keyboardType, this.multiline, this.textAlign, this.maxLength, this.isPassword = false, this.isUsername = false, this.enabled = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: TextField(
        enabled: enabled,
        maxLength: maxLength,
        obscureText: isPassword,
        textAlign: this.textAlign == null ? TextAlign.left : this.textAlign,
        maxLines: multiline != null && multiline == true ? null : 1,
        keyboardType: keyboardType,
        inputFormatters: keyboardType == TextInputType.number ? <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ] : null,
        onChanged: onChanged,
        onSubmitted: onSubmit,
        onTap: onTap,
        controller: controller,
        cursorColor: verdeBarra,
        style: TextStyle(
          height: 1.0,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(30.0),
            borderSide: BorderSide(
              color: verdeBarra,
            ),
          ),
          fillColor: Theme.of(context).primaryColor,
          focusedBorder: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(30.0),
            borderSide: BorderSide(
              color: verdeBarra,
            ),
          ),
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(30.0),
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          labelText: labelText,
          labelStyle: TextStyle(
            color:  Colors.black,
          ),
        ),
      ),
    );
  }


}
