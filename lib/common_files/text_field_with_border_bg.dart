import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldWithBorder extends StatelessWidget {
  TextEditingController controller;
  TextInputType inputType;
  TextInputAction action;
  int maxLine = 1;
  double fontSize;
  String hintText;
  bool obscureTextField;
  bool withIcon;
  bool isRequired;
  FocusNode myFocusNode;
  bool isNumeric;
  bool isDouble;
  bool isAllowSpace;
  bool isDigitWithHighphen;
  bool isLimitCharacter;
  int characterLimit;
  bool alphaWithSpace;
  bool alphaWithoutSpace;
  bool prventLength;
  bool enabled;
  bool readOnly;
  bool isExpiryDate;

  TextFieldWithBorder({Key? key,
    required this.controller,
    required this.inputType,
    required this.action,
    required this.maxLine,
    this.fontSize = 12,
    this.hintText = '',
    this.obscureTextField = false,
    this.withIcon = false,
    required this.myFocusNode,
    this.isRequired = false,
    this.isNumeric = false,
    this.isDouble = false,
    this.isAllowSpace = false,
    this.isLimitCharacter = false,
    this.alphaWithSpace = false,
    this.alphaWithoutSpace = false,
    this.prventLength = false,
    this.isDigitWithHighphen = false,
    this.characterLimit = 0,
    this.enabled = true,
    this.readOnly = false,
    this.isExpiryDate = false,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        onChanged: (text) {
        },
        inputFormatters: isAllowSpace
            ? [FilteringTextInputFormatter.allow(RegExp("[a-z]"))]
            : isNumeric
                ? [FilteringTextInputFormatter.allow(RegExp("[0-9]"))]
                  : isExpiryDate
                  ? [FilteringTextInputFormatter.allow(RegExp("(?:0[1-9]|1[0-2])/[0-9]{2}"))]
                : prventLength
                ? [LengthLimitingTextInputFormatter(5)]
                : isDigitWithHighphen
                    ? [
                        FilteringTextInputFormatter.allow(
                            RegExp("[0-9-]"))
                      ]
                    : isLimitCharacter
                        ? [LengthLimitingTextInputFormatter(characterLimit)]
                        : alphaWithSpace
                            ? [
                                FilteringTextInputFormatter.allow(
                                    RegExp("[A-Za-z ]"))
                              ]
                            : alphaWithoutSpace
                                ? [
                                    FilteringTextInputFormatter.allow(
                                        RegExp("[A-Za-z0-9]"))
                                  ]
                                : isDouble
                                    ? [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'^(\d+)?\.?\d{0,2}'))
                                      ]
                                    : [],
        autofocus: false,
        maxLength: isLimitCharacter ? characterLimit : 200,
        keyboardType: inputType,
        textInputAction: action,
        controller: controller,
        maxLines: 1,
    enabled: enabled,
    readOnly: readOnly,
    obscureText: obscureTextField,
        focusNode: myFocusNode,
        cursorColor: const Color(0xFFffb300),
        decoration: InputDecoration(
          labelText: isRequired ? '$hintText *' : hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          labelStyle: TextStyle(
            color: myFocusNode.hasFocus
                ? const Color(0xFFffb300)
                : Colors.grey,
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Color(0xFFffb300)),
            borderRadius: BorderRadius.circular(10.0),
          ),
          suffixIcon: withIcon
              ? Container(
                  padding: const EdgeInsets.all(15),
                  color: Colors.white,

                )
              : null,
        ),
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          color: Colors.white60,
        ),
      ),
    );
  }
}

extension StringExt on String {

  bool isNotNullOrEmpty() {
    return !isNullOrEmpty();
  }

  bool isNullOrEmpty() {
    return (isEmpty) ? true : false;
  }
}