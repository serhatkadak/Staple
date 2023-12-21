import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:staple/models/user_information.dart';

import '../data/dbHelper.dart';

class VeritabaniDetail extends StatefulWidget {
  UserInformation userInformation;
  VeritabaniDetail(this.userInformation);

  @override
  State<VeritabaniDetail> createState() =>
      _VeritabaniDetailState(userInformation);
}

enum Options { delete, update }

class _VeritabaniDetailState extends State<VeritabaniDetail> {
  UserInformation userInformation;
  _VeritabaniDetailState(this.userInformation);
  DbHelper dbHelper = DbHelper();
  var txtName = TextEditingController();
  var txtSurname = TextEditingController();
  var txtUserName = TextEditingController();
  var txtEmail = TextEditingController();
  var txtPassword = TextEditingController();

  @override
  void initState() {
    txtName.text = userInformation.name.toString();
    txtSurname.text = userInformation.surname.toString();
    txtUserName.text = userInformation.username.toString();
    txtEmail.text = userInformation.email.toString();
    txtPassword.text = userInformation.password.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kullanıcı detayı: ${userInformation.name}"),
        actions: [
          PopupMenuButton<Options>(
              onSelected: selectProses,
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Options>>[
                    PopupMenuItem<Options>(
                      child: Text("Sil"),
                      value: Options.delete,
                    ),
                    PopupMenuItem<Options>(
                      child: Text("Güncelle"),
                      value: Options.update,
                    ),
                  ])
        ],
      ),
      body: buildProductDetail(),
    );
  }

  buildProductDetail() {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          buildNameField(),
          buildSurnameField(),
          buildUserNameField(),
          buildEmailField(),
          buildPasswordField(),
        ],
      ),
    );
  }

  buildNameField() {
    return TextField(
      decoration: InputDecoration(labelText: "Ad:"),
      controller: txtName,
    );
  }

  buildSurnameField() {
    return TextField(
      decoration: InputDecoration(labelText: "Soyad:"),
      controller: txtSurname,
    );
  }

  buildUserNameField() {
    return TextField(
      decoration: InputDecoration(labelText: "Kullanıcı adı:"),
      controller: txtUserName,
    );
  }

  buildEmailField() {
    return TextField(
      decoration: InputDecoration(labelText: "Email: "),
      controller: txtEmail,
    );
  }

  buildPasswordField() {
    return TextField(
      decoration: InputDecoration(labelText: "Şifre:"),
      controller: txtPassword,
    );
  }

  void selectProses(Options options) async {
    switch (options) {
      case Options.delete:
        await dbHelper.delete(userInformation);
        Navigator.pop(context, true);
        break;
      case Options.update:
        await dbHelper.update(
          UserInformation.withId(
              id: userInformation.id,
              name: txtName.text,
              surname: txtSurname.text,
              username: txtUserName.text,
              email: txtEmail.text,
              password: txtPassword.text),
        );
        Navigator.pop(context, true);
        break;
      default:
    }
  }
}
