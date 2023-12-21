import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:staple/color/colors.dart';
import 'package:staple/data/dbHelper.dart';
import 'package:staple/models/user_information.dart';
import 'package:staple/screens/signIn_page.dart';
import 'package:staple/screens/tab_bar_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _rememberme = false;
  bool isVisible = false;
  bool isLoginTrue = false;
  final formKey = GlobalKey<FormState>();
  var db = DbHelper();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() async {
    var response = await db.loginKontrol(UserInformation.EmailPassword(
        email: emailController.text, password: passwordController.text));

    if (response == true) {
      if (!mounted) return;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => TapBarController()));
    }
    setState(() {
      isLoginTrue = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildBody());
  }

  Widget buildBody() {
    return Form(
      key: formKey,
      child: Stack(
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
                  emailWidget(),
                  SizedBox(
                    height: 30.0,
                  ),
                  sifreWidget(),
                  sifremiUnuttum(),
                  beniHatirla(),
                  girisButton(),
                  yazi(),
                  SizedBox(
                    height: 15,
                  ),
                  hata()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget hata() {
    return isLoginTrue
        ? const Text("Email ya da şifreniz hatalı, tekrar deneyiniz",
            style: TextStyle(
                color: Colors.red, fontSize: 17.0, fontWeight: FontWeight.bold))
        : const SizedBox();
  }

  Widget yazi() {
    return GestureDetector(
      onTap: () {
        goToSignInAdd();
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: "Henüz bir hesabın yok mu?",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400)),
            TextSpan(
              children: [
                TextSpan(
                    text: " Kayıt Ol",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget girisButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            login();
          }
        },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            padding: EdgeInsets.all(15.0),
            backgroundColor: Colors.white),
        child: Text('Giriş Yap',
            style: TextStyle(
                color: Colors.purpleAccent,
                letterSpacing: 1.5,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                fontFamily: "OpenSans")),
      ),
    );
  }

  Widget beniHatirla() {
    return Container(
      height: 20.0,
      child: Row(
        children: [
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberme,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberme = value!;
                });
              },
            ),
          ),
          Text(
            "Beni Hatırla",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "OpenSans",
                fontWeight: FontWeight.bold),
          )
        ],
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
          child: TextFormField(
            controller: emailController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Lütfen Email adresinizi giriniz';
              }
              return null;
            },
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
              ),
            ),
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
          child: TextFormField(
            controller: passwordController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Lütfen parolanızı giriniz";
              }
              return null;
            },
            obscureText: !isVisible,
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
                ),
                suffixIcon: IconButton(
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  icon:
                      Icon(isVisible ? Icons.visibility : Icons.visibility_off),
                )),
          ),
        )
      ],
    );
  }

  Widget sifremiUnuttum() {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 0.0),
      child: TextButton(
          onPressed: () => {},
          child: Text(
            "Şifremi Unuttum",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "OpenSans",
            ),
          )),
    );
  }

  void goToSignInAdd() async {
    bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignInPage()));

    if (result != null) {
      if (result == true) {
        alertDialog("Kayıt İşlemi", "Staple'ye Hoşgeldiniz");
      }
    } else
      alertDialog("Kayıt İşlemi",
          "Kayıt işlemi sırasında bir hata oluştu. Tekrar deneyiniz");
  }

  alertDialog(String title, String content) {
    return AlertDialog(
      title: Text('$title'),
      content: Text(
        '$context',
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Tamam'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
