import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MusicHomePage(),
    );
  }
}

class MusicHomePage extends StatefulWidget {
  @override
  _MusicHomePageState createState() => _MusicHomePageState();
}

class _MusicHomePageState extends State<MusicHomePage> {
  _MusicHomePageState() {
    audioPlayer.open(Audio("assets/audio/1.mp3"), autoStart: false);
  }
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  String buttonText = "Play";
  bool playing = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: TextButton(
            child: Text(
              buttonText,
              style: TextStyle(fontSize: 40),
            ),
            onPressed: () {
              audioPlayer.playOrPause();
              setState(() {
                playing = !playing;
                if (playing){
                  buttonText = "Pause";
                }
                else{
                  buttonText = "Play";
                }
              },
              );
            },
          ),
        ),
      ),
    );
  }
}
