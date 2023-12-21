import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:staple/color/colors.dart';

import '../models/activity_model.dart';
import '../models/hotel_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColors.beyaz,
          title: Text(
            "Ara",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          elevation: 0,
        ),
        backgroundColor: CustomColors.beyaz,
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            aramaCubugu(),
            SizedBox(
              height: 30,
            ),
            _category_title("En Son Arananlar"),
            SizedBox(
              height: 30,
            ),
            _category_title("En Çok Aranan")
          ],
        ));
  }

  Container aramaCubugu() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  fillColor: CustomColors.acikmor,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  prefixIcon: Icon(
                    Icons.search_outlined,
                    color: Colors.black,
                    size: 30,
                  ),
                  hintText: "Nereyi Gezmek İstersin?",
                  hintStyle: TextStyle(color: Colors.black)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _category_title(String title) {
    return GestureDetector(
      onTap: () {
        print("daha fazla");
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title = title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
