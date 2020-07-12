import 'package:app_people/image_screen.dart';
import 'package:app_people/website_display_tile.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  static const String route = '/mainScreen';

  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  List<String> websites = [
    "https://www.tutorialkart.com/flutter/flutter-icon/",
    "https://pub.dev/packages/auto_validating_text_field/versions/0.1.2#-installing-tab-",
    "https://en.wikipedia.org/wiki/Sydney",
    "https://www.visitnsw.com/destinations/blue-mountains",
    "https://cycling.org.au/nsw",
    "https://flutter.dev/docs/development/data-and-backend/json",
    "https://pub.dev/",
    "https://jsonplaceholder.typicode.com/",
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Main Screen"),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: websites.length,
                itemBuilder: (context, index) {
                  final item = websites[index];
                  return WebsiteDisplayTile(url: item);
                },
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Center(
              child: RaisedButton(
                child: Text("Goto Upload Image screen"),
                onPressed: () {
                  Navigator.pushNamed(context, ImageScreen.route);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
