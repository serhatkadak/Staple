import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:staple/color/colors.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColors.beyaz,
          title: Text(
            "Profil",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          elevation: 0,
        ),
        backgroundColor: CustomColors.beyaz,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: profileIcon()),
              SizedBox(height: 16.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'serhat kadak',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      '@Serhat',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 18.0),
                    Text(
                      "Hakkımda",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 18.0),
                    Container(
                        height: 120,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: CustomColors.acikmor,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: ListView(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsumublish has been the industry's standard dummy ",
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.black26),
                            ),
                          ),
                        ])),
                    SizedBox(height: 8.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 40, horizontal: 20),
                      child: Column(
                        children: [
                          buildIconAndText(Icon(Icons.person), 'Hesap'),
                          buildIconAndText(
                              Icon(Icons.question_mark), 'Yardım Merkezi'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

GestureDetector buildIconAndText(
  Icon icon,
  String text,
) {
  return GestureDetector(
    child: Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            child: icon,
            width: 50,
            height: 50,
            padding: EdgeInsets.all(7.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red[400]),
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    ),
  );
}

profileIcon() {
  return Center(
    child: Stack(
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
              border: Border.all(width: 4, color: Colors.white),
              boxShadow: [
                BoxShadow(
                    spreadRadius: 2,
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.1))
              ],
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/paris.jpg"))),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 4, color: Colors.white),
                    color: CustomColors.acikmor),
                child: GestureDetector(
                  onTap: () {
                    print("değiştir");
                  },
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                )))
      ],
    ),
  );
}
