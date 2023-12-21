import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:staple/data/dbHelper.dart';

import '../color/colors.dart';
import '../models/user_information.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  DbHelper db_helper = DbHelper();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtSurName = TextEditingController();
  TextEditingController txtUserName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildSignIn(),
    );
  }

  Widget buildSignIn() {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                CustomColors.mor,
                CustomColors.mor,
                CustomColors.mor,
                CustomColors.mor,
                CustomColors.mor,
              ],
                  stops: [
                1,
                1,
                1,
                1,
                1
              ])),
        ),
        Container(
          height: double.infinity,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 120.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Staple",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "OpenSans",
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30.0,
                ),
                nameWidget(),
                SizedBox(
                  height: 30.0,
                ),
                surnameWidget(),
                SizedBox(
                  height: 30.0,
                ),
                usernameWidget(),
                SizedBox(
                  height: 30.0,
                ),
                emailWidget(),
                SizedBox(
                  height: 30.0,
                ),
                sifreWidget(),
                _kayitButton()
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _kayitButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          addUser();
        },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            padding: EdgeInsets.all(15.0),
            backgroundColor: Colors.white),
        child: Text('Kayıt Ol',
            style: TextStyle(
                color: Colors.purpleAccent,
                letterSpacing: 1.5,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                fontFamily: "OpenSans")),
      ),
    );
  }

  Widget emailWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email",
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white30,
          ),
          height: 60.0,
          child: TextField(
            controller: txtEmail,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "OpenSans",
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                hintText: "Email Adresinizi Giriniz",
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontFamily: "OpenSans",
                )),
          ),
        )
      ],
    );
  }

  Widget sifreWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Şifre",
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white30,
          ),
          height: 60.0,
          child: TextField(
            controller: txtPassword,
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "OpenSans",
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                hintText: "Şifrenizi Giriniz",
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontFamily: "OpenSans",
                )),
          ),
        )
      ],
    );
  }

  Widget usernameWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Kullanıcı Adı",
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white30,
          ),
          height: 60.0,
          child: TextField(
            controller: txtUserName,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "OpenSans",
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                hintText: "Kullanıcı Adınızı Giriniz",
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontFamily: "OpenSans",
                )),
          ),
        )
      ],
    );
  }

  Widget nameWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Ad",
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white30,
          ),
          height: 60.0,
          child: TextField(
            controller: txtName,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "OpenSans",
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                hintText: "Adınızı Giriniz",
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontFamily: "OpenSans",
                )),
          ),
        )
      ],
    );
  }

  Widget surnameWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Soyad",
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white30,
          ),
          height: 60.0,
          child: TextField(
            controller: txtSurName,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "OpenSans",
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                hintText: "Soyadınızı Giriniz",
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontFamily: "OpenSans",
                )),
          ),
        )
      ],
    );
  }

  addUser() async {
    var result = await db_helper.insert(UserInformation(
      txtName.text,
      txtSurName.text,
      txtUserName.text,
      txtEmail.text,
      txtPassword.text,
    ));
    Navigator.pop(context, true);
  }
}
