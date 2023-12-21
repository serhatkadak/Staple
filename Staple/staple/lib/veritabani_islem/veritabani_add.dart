import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:staple/models/user_information.dart';

import '../data/dbHelper.dart';

class VeritabaniAdd extends StatefulWidget {
  const VeritabaniAdd({super.key});

  @override
  State<VeritabaniAdd> createState() => _VeritabaniAddState();
}

class _VeritabaniAddState extends State<VeritabaniAdd> {
  var dbHelper = DbHelper();
  var txtName = TextEditingController();
  var txtSurname = TextEditingController();
  var txtUserName = TextEditingController();
  var txtEmail = TextEditingController();
  var txtPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Ürün Ekle"),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            buildNameField(),
            buildSurnameField(),
            buildUserNameField(),
            buildEmailField(),
            buildPasswordField(),
            buildSaveButton()
          ],
        ),
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

  buildSaveButton() {
    return ElevatedButton(
      onPressed: () {
        addUser();
      },
      child: Text('Ekle'),
    );
  }

  addUser() async {
    var result = await dbHelper.insert(UserInformation(txtName.text,
        txtSurname.text, txtUserName.text, txtEmail.text, txtPassword.text));
    Navigator.pop(context, true);
  }
}
