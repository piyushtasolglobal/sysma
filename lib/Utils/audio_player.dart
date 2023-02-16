// ignore_for_file: camel_case_types, must_be_immutable

import 'package:adani/Utils/Styles.dart';
import 'package:adani/controllar/data_manager.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';


class audioplay extends StatefulWidget {
  var playerdata;
  audioplay({Key? key,this.playerdata}) : super(key: key);

  @override
  State<audioplay> createState() => _audioplayState();
}

class _audioplayState extends State<audioplay> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  String url ="";

  @override
  void initState() {
    super.initState();
    setAudio();
    /// Listen to states: playing, paused, stopped
    audioPlayer.onPlayerStateChanged.listen((state) {
      if (mounted == true) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });}
    });
    /// Listen to audio duration
    audioPlayer.onDurationChanged.listen((newDuration) {
      if (mounted == true) {
      setState(() {
        duration = newDuration;
      });}
    });
    /// Listen to audio position
    audioPlayer.onPositionChanged.listen((newPosition) {
      if (mounted == true) {
      setState(() {
        position = newPosition;
      });}
    });
  }

  Future setAudio() async {
    // Repeat song when completed
    audioPlayer.setReleaseMode(ReleaseMode.stop);

    /// Load audio from Assets (audio/music.mp3)
    // final player = AudioCache(prefix: 'assets/');
    // final url = await player.load('sample.mp3');
    // audioPlayer.setUrl(url.path, isLocal: true);
    // url ="assets/sample.mp3";
    await audioPlayer.setSourceUrl(DataManager.getInstance().getAudioUrl()+widget.playerdata);
    // await audioPlayer.play(url);
    // if (isPlaying) {
    //   await audioPlayer.pause();
    // }
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
        horizontalTitleGap: 0,
        leading: CircleAvatar(
          backgroundColor: Colors.black12,
          radius: 25,
          child: IconButton(
            icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow,),color: primarycolor,
            iconSize: 30,
            onPressed: () async {
              // print(duration.inSeconds.toDouble());
              // print(position.inSeconds.toDouble());
              if (isPlaying) {
                await audioPlayer.pause();
              }
              else {
                await audioPlayer.resume();
                await audioPlayer.play(UrlSource(DataManager.getInstance().getAudioUrl()+widget.playerdata));
              }
            },
          ),
        ),
        title: Column(
          children: [
            Slider(
              min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              onChanged: (value) async {
                final position = Duration(seconds: value.toInt());
                await audioPlayer.seek(position);
                ///Optional:Play audio if was paused
                await audioPlayer.resume();
              },
              activeColor: primarycolor,
              inactiveColor: Colors.grey,
              thumbColor: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatTime(position),style: const TextStyle(color: Colors.black),),
                  Text(formatTime(duration - position),style: const TextStyle(color: Colors.black),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

}