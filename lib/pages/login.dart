import 'package:flutter/material.dart';
import 'package:login_flutter/provider/page_notifier.dart';
import 'package:provider/provider.dart';


class LoginPage extends Page {

  static final String pageName = "LoginPage";

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings: this, builder: (context)=>LoginWidget());
  }

}

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  OutlinedBorder _shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(8));

  @override
  Widget build(BuildContext context) {
    return Material(
        child: InkWell(
          onTap: () {
            Provider.of<PageNotifier>(context, listen:  false).goToHome();
          },
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("assets/loginBG.jpeg")
              )
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    padding: EdgeInsets.all(12),
                    children: [
                      SizedBox(height: 20),
                      CircleAvatar(
                        backgroundColor: Colors.white54,
                        radius: 30,
                        child: Image.asset("assets/skyIcon.png")
                      ),
                      SizedBox(height: 20),
                      _buildTextFormField("Email Address", _emailController, TextInputType.emailAddress),
                      SizedBox(height: 10),
                      _buildTextFormField("password", _passwordController, TextInputType.visiblePassword),
                      SizedBox(height: 30),
                      TextButton(
                          style: TextButton.styleFrom(backgroundColor: Colors.lightBlue,
                                                              primary: Colors.white,
                                                            textStyle: TextStyle(fontSize: 17),
                                                          minimumSize: Size(100, 50),
                                                          shape: _shape),
                          child: Text("Log In"),
                          onPressed: () {
                            var state = _formKey.currentState;
                            if (state != null) {
                              bool isSuccess = state.validate();
                              if (isSuccess == true) {

                              }
                            }
                      })
                    ],
                  ),
                ),
              ),
            ),
          )
        )
    );
  }

  TextFormField _buildTextFormField(String hintText, TextEditingController controller, TextInputType type) {

    OutlineInputBorder _border = OutlineInputBorder(borderRadius : BorderRadius.circular(8), borderSide: BorderSide(color: Colors.transparent, width: 0));

    return TextFormField (
        controller: controller,
        validator: (text) {
          if (text != null && text.isNotEmpty) {
            if (text.length < 8) {
              return "8자 이상 입력해 주세요";
            }

            if (type == TextInputType.emailAddress) {
              bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(text);
              if (emailValid == false) {
                return "이메일 형식에 맞게 입력해 주세요";
              }
            }
          }

          return null;
        },
        onChanged: (text) {
          var state = _formKey.currentState;
          if (state != null && text.isEmpty == false) {
            bool isSuccess = state.validate();
            if (isSuccess == true) {

            }
          }
        },
        cursorColor: Colors.white,
        style: TextStyle(color: Colors.white),
        keyboardType: type,
        obscureText: type == TextInputType.visiblePassword,
        decoration: InputDecoration(
            focusColor: Colors.white,
            hintText: hintText,
            filled: true,
            fillColor: Colors.white54,
            border: _border,
            // errorBorder: _border.copyWith(borderSide: BorderSide(color: Colors.red, width: 3)),
            enabledBorder: _border,
            focusedBorder: _border));

  }

}
