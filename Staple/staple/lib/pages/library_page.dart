import 'package:flutter/material.dart';

/// Flutter code sample for [TabBar].

void main() => runApp(const LibraryPage());

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const TabBarExample(),
    );
  }
}

class TabBarExample extends StatelessWidget {
  const TabBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.deepOrangeAccent,
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: const Text(
            'Kitaplığım',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: "Son Okunan",
              ),
              Tab(
                text: "Okuma Listem",
              ),
              Tab(
                text: "Favorilerim",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            // İlk sekme için içerik
            YourFirstTabPage(),
            // İkinci sekme için içerik
            YourSecondTabPage(),
            // Üçüncü sekme için içerik
            YourThirdTabPage(),
          ],
        ),
      ),
    );
  }
}

class YourFirstTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Bu ilk sekme içeriği'),
    );
  }
}

class YourSecondTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Bu ikinci sekme içeriği'),
    );
  }
}

class YourThirdTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Bu üçüncü sekme içeriği'),
    );
  }
}
