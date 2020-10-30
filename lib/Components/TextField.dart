import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:coffee_and_code/Components/ContextExtension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFields extends StatefulWidget {
  final controller;
  final validator;
  final String hintText;
  final textStyle;
  final suffixIcon;
  final obscureText;
  final error;
  final keyboardType;
  final focusNode;

  const TextFields(
      {Key key,
      this.controller,
      this.validator,
      this.hintText,
      this.textStyle,
      this.suffixIcon,
      this.obscureText,
      this.error,
      this.keyboardType,
      this.focusNode})
      : super(key: key);

  @override
  _TextFieldsState createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  @override
  Widget build(BuildContext context) {    final mainTheme = Theme.of(context);

  return Container(
      height: context.heighContainer,
      child: TextFormField(
        focusNode: widget.focusNode,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        validator: widget.validator,
        controller: widget.controller,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: context.smallText, left: context.heightText),
          errorStyle: mainTheme.textTheme.headline3.copyWith(fontSize: context.smallText, color: Colors.red),
          suffixIcon: widget.suffixIcon,
          errorText: widget.error,
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          hintStyle: widget.textStyle,
          hintText: widget.hintText,
        ),
      ),
    );
  }
}
