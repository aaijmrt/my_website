import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intro Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IntroPage(),
    );
  }
}

class IntroPage extends StatelessWidget {
  // URLs for social media profiles
  final String linkedinUrl = 'https://www.linkedin.com/in/aaijmrt/';
  final String githubUrl = 'https://github.com/aaijmrt';
  final String instagramUrl = 'https://www.instagram.com/aaijmrt/';

  // Method to launch URLs
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome!'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://website-aaijmrt-media.s3.ap-south-1.amazonaws.com/20240625_151151~2.jpg'), // Replace with your photo URL
            ),
            SizedBox(height: 16),
            Text(
              'Amit Raj',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Engineer',
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.link),
                  onPressed: () => _launchURL(linkedinUrl),
                ),
                IconButton(
                  icon: Icon(Icons.code),
                  onPressed: () => _launchURL(githubUrl),
                ),
                IconButton(
                  icon: Icon(Icons.linked_camera),
                  onPressed: () => _launchURL(instagramUrl),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
