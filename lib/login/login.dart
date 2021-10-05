import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_register_ui/common_files/app_images.dart';
import 'package:login_register_ui/common_files/text_field_with_border_bg.dart';
import 'package:login_register_ui/register/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key,}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  FocusNode myFocusNodeEmail = FocusNode();
  FocusNode myFocusNodePassword = FocusNode();
  late bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordVisible = false;

    _emailController.text = "test@gmail.com";
    _passwordController.text = "Test@123";
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

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

                },
                icon: const Image(
                  image: AppImages.icBackGrey,
                  color: Color(0xFF212832),
                  width: 20,
                  height: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),

            const Text(
              'Welcome \nBack',
              style: TextStyle(
                color: Color(0xFFffb300),
                fontSize: 40.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Sign in to continue',
              style: TextStyle(
                color: Colors.white30,
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
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
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: const Text(
                          'Forgot password?',
                          style: TextStyle(
                            color: Colors.white30,
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
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
                            'SIGN IN',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.white30,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterPage()));
                          },
                        child: const Text(
                          ' Sign up',
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
            ),
          ],
        ),
      ),
    );
  }
}
