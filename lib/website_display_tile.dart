import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WebsiteDisplayTile extends StatelessWidget {
  final String url;

  const WebsiteDisplayTile({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: InkWell(
        onTap: () async {
          launch(url);
        },
        child: Card(
          color: Colors.grey,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      url,
              style: TextStyle(
                    fontSize: 24, color: Colors.white, decoration: TextDecoration.underline),
            ),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
