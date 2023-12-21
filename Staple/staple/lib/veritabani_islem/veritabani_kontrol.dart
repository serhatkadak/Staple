import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:staple/data/dbHelper.dart';
import 'package:staple/models/user_information.dart';
import 'package:staple/screens/signIn_page.dart';
import 'package:staple/veritabani_islem/veritabani_add.dart';
import 'package:staple/veritabani_islem/veritabani_details.dart';

class VeritabaniKontrol extends StatefulWidget {
  const VeritabaniKontrol({super.key});

  @override
  State<VeritabaniKontrol> createState() => _VeritabaniKontrolState();
}

class _VeritabaniKontrolState extends State<VeritabaniKontrol> {
  var dbhelper = DbHelper();
  late List<UserInformation> userinformations;
  int userinformationCount = 0;
  @override
  void initState() {
    getUsers();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Veritabanı Kayıtları"),
      ),
      body: veritabanikontrolList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          gotoSignInPage();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  ListView veritabanikontrolList() {
    return ListView.builder(
        itemCount: userinformationCount,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.blue,
            elevation: 2,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.yellow,
                child: Text("A"),
              ),
              title: Text(this.userinformations[position].username!),
              subtitle: Text(this.userinformations[position].email!),
              onTap: () {
                goToDetail(this.userinformations[position]);
              },
            ),
          );
        });
  }

  void gotoSignInPage() async {
    bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => VeritabaniAdd()));
    if (result != null) {
      if (result) {
        getUsers();
      }
    }
  }

  void getUsers() async {
    var userinfotmationsFuture = dbhelper.getUserInformation();
    userinfotmationsFuture.then((data) {
      setState(() {
        this.userinformations = data;
        userinformationCount = data.length;
      });
    });
  }

  void goToDetail(UserInformation userInformation) async {
    bool result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => VeritabaniDetail(userInformation)));
    if (result != null) {
      if (result) {
        getUsers();
      }
    }
  }
}
