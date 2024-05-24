import 'package:flutter/material.dart';

class MusicPage extends StatefulWidget{
  const MusicPage({super.key});

  @override
  _MusicPageState createState() => _MusicPageState();

}

class _MusicPageState extends State<MusicPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Likes'),
      ),
      body: const SafeArea(
        child: Column(
          children: [
            Text('Likes'),
          ],
        ),
      ),
    );
  }
}