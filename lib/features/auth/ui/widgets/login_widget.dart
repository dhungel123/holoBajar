
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:holo_bazar/core/constants/routes.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../core/common widgets/buttons/custom_rounded_button.dart';
import '../../../../core/common widgets/textfields/custom_textfield.dart';
import '../../../../core/constants/custom_themes.dart';
import '../../../dashboard/ui/screens/dashboard_screen.dart';
import '../screens/signup_page.dart';

class LoginWidgets extends StatefulWidget {
  const LoginWidgets({Key? key}) : super(key: key);

  @override
  State<LoginWidgets> createState() => _LoginWidgetsState();
}

class _LoginWidgetsState extends State<LoginWidgets> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _textTheme = _theme.textTheme;

    return Scaffold(
      backgroundColor: Color(0xFFF8F1F1),
      appBar: AppBar(backgroundColor: CustomTheme.primaryColor,title: Text('Login Form'),centerTitle: true,),
      body: FormBuilder(
        key: _formKey,
        child: Center(
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 12),
            elevation: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
              //color: Colors.yellow,
              child: Column(
                mainAxisSize: MainAxisSize.min,
               // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Login Form',style: GoogleFonts.abhayaLibre(fontSize:24,fontWeight:FontWeight.bold),),
                  SizedBox(height: 12,),
                  CustomTextField(
                    fieldName: "email",
                    label: "Email Address",

                    hintText: "Enter Email Address",
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Email field cannot be empty";
                      }
                      final _isvalid = EmailValidator.validate(val);
                      if (_isvalid) {
                        return null;
                      } else {
                        return "Enter valid email address";
                      }
                    },
                  ),
                  CustomTextField(
                    label: "Password",
                    fieldName: "password",
                    hintText: "Enter Password",
                    obscureText: true,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Password field cannot be empty";
                      } else if (val.length < 4) {
                        return "Password field must be at least 4 character long";
                      } else {
                        return null;
                      }
                    },
                  ),
                  CustomRoundedButtom(
                    title: "LOGIN",
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                       MyRoutes.dashboard,
                            (route) => false,
                      );
                      // if (_formKey.currentState!.validate()) {}
                    },
                  ),
                  const SizedBox(height: 20),
                  const Divider(height: 1),
                  const SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      text: "Don't have account?",
                      style: _textTheme.bodyMedium,
                      children: [
                        TextSpan(
                          text: " Sign Up",
                          style: _textTheme.bodyMedium!.copyWith(
                            color: CustomTheme.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).pushNamed(
                              MyRoutes.register,
                              );
                            },
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
