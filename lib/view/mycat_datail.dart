import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyCatDetails extends StatelessWidget {
  const MyCatDetails({super.key, required this.index, required this.url});
  final String url;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: openUrl, icon: Icon(Icons.share))
        ],
      ),
      body: Hero(
      tag: "img-$index", 
      child: Center(
        child: Image.network(
                  url,
                  fit: BoxFit.cover,
                ),
      ),
      ),
    );
  }
  Future<void> openUrl() async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
 }
  }
}