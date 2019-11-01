import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormCard extends StatefulWidget {
  const FormCard({this.setUserCallback, this.setPassCallback, this.userValidation, this.passwordValidation});
  final usernameCallback setUserCallback;
  final passwordCallback setPassCallback;
  final bool userValidation, passwordValidation;

  @override
  _FormCardState createState() => new _FormCardState();
}

class _FormCardState extends State<FormCard> {

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      height: ScreenUtil.getInstance().setHeight(550),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 15.0),
                blurRadius: 15.0),
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, -10.0),
                blurRadius: 10.0),
          ]),
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Login",
                style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(45),
                    fontFamily: "Poppins-Bold",
                    letterSpacing: .6)),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
            ),
            Text("Username",
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: ScreenUtil.getInstance().setSp(26))
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: !widget.userValidation ? "" : "Please enter a username",
                  hintStyle: !widget.userValidation ? TextStyle(color: Colors.grey, fontSize: 12.0) : TextStyle(color: Colors.red, fontSize: 12.0)),
              onChanged: (text) {
                  widget.setUserCallback(text);
              },
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
            ),
            Text("Password",
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: ScreenUtil.getInstance().setSp(26))),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: !widget.passwordValidation ? "" : "Please enter a password",
                  hintStyle: !widget.passwordValidation ? TextStyle(color: Colors.grey, fontSize: 12.0) : TextStyle(color: Colors.red, fontSize: 12.0)),
              onChanged: (text) {
                  widget.setPassCallback(text);
              },
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(35),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "Forgot Password?",
                  style: TextStyle(
                      color: Colors.blue,
                      fontFamily: "Poppins-Medium",
                      fontSize: ScreenUtil.getInstance().setSp(28)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
typedef usernameCallback = void Function(String username);
typedef passwordCallback = void Function(String username);