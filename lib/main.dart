import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Developer Intro Page',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blue,
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Welcome!'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 80, // Increased radius for larger photo
                backgroundImage: NetworkImage('https://website-aaijmrt-media.s3.ap-south-1.amazonaws.com/20240625_151151~2.jpg'), // Updated photo URL
              ),
              SizedBox(height: 20),
              Text(
                'Amit Raj',
                style: GoogleFonts.roboto(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Software Engineer',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blueAccent,
                  letterSpacing: 2.5,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Passionate about building scalable software, '
                'creating effective solutions, and learning every day.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: 30),
              Divider(
                color: Colors.white54,
                thickness: 1,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildSocialIcon(Icons.link, linkedinUrl),
                  _buildSocialIcon(Icons.code, githubUrl),
                  _buildSocialIcon(Icons.photo_camera, instagramUrl),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    return IconButton(
      icon: Icon(icon, color: Colors.white, size: 30),
      onPressed: () => _launchURL(url),
      padding: EdgeInsets.symmetric(horizontal: 16),
    );
  }
}
