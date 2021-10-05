import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_register_ui/common_files/app_images.dart';
import 'package:login_register_ui/common_files/text_field_with_border_bg.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key,}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController _userNameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  FocusNode myFocusNodeEmail = FocusNode();
  FocusNode myFocusNodeUserName = FocusNode();
  FocusNode myFocusNodePassword = FocusNode();
  late bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _userNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordVisible = false;


  }

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    myFocusNodeUserName.dispose();
    myFocusNodeEmail.dispose();
    myFocusNodePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF212832),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
        child: ListView(
          primary: true,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop(context);
                },
                icon: const Image(
                  image: AppImages.icBackGrey,
                  color: Color(0xFFffb300),
                  width: 20,
                  height: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),

            const Text(
              'Create an \nAccount',
              style: TextStyle(
                color: Color(0xFFffb300),
                fontSize: 40.0,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              // height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.black.withOpacity(0.50),
              ),
              child: Column(
                children: [
                  TextFieldWithBorder(
                    controller: _userNameController,
                    inputType: TextInputType.name,
                    action: TextInputAction.next,
                    hintText: 'User Name',
                    obscureTextField: false,
                    myFocusNode: myFocusNodeUserName, maxLine: 2,
                  ),
                  TextFieldWithBorder(
                    controller: _emailController,
                    inputType: TextInputType.emailAddress,
                    action: TextInputAction.next,
                    hintText: 'Email',
                    obscureTextField: false,
                    myFocusNode: myFocusNodeEmail, maxLine: 2,
                  ),
                  TextField(
                    autofocus: false,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    controller: _passwordController,
                    maxLines: 1,
                    obscureText: _passwordVisible ? false : true,
                    focusNode: myFocusNodePassword,
                    // maxLength: 10,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    cursorColor: const Color(0xFFffb300),
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Image(
                          height: 20,
                          width: 20,
                          image: _passwordVisible
                              ? AppImages.icOpenEye
                              : AppImages.icCloseEye,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                      labelStyle: TextStyle(
                        color: myFocusNodePassword.hasFocus
                            ? const Color(0xFFffb300)
                            : Colors.grey,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(width: 1, color: Color(0xFFffb300)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white60,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFffb300),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                      ),
                      onPressed: () => {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Text(
                            'SIGN UP',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'By continuing you agree to',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.white30,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {

                            },
                            child: const Text(
                              'Terms & Conditions',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white30,
                              ),
                            ),
                          ),
                          const Text(
                            ' and ',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.white30,
                            ),
                          ),
                          InkWell(
                            onTap: () {

                            },
                            child: const Text(
                              'Privacy Policy',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
