import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

import '../main.dart';
import '../models/song_model.dart';
import '../widgets/music_player.dart';
import '../widgets/seekbar.dart';
import '../widgets/side_bar.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AudioPlayer audioPlayer = AudioPlayer();
  List<Song> songList = Song.songs;
  int index = 0;

  @override
  void initState() {
    super.initState();

    audioPlayer.setAudioSource(ConcatenatingAudioSource(children: [
      AudioSource.uri(
        Uri.parse('asset:///${songList[0].url}'),
      ),
      AudioSource.uri(
        Uri.parse('asset:///${songList[1].url}'),
      ),
      // AudioSource.uri(
      //   Uri.parse('asset:///${songList[2].url}'),
      // ),
      // AudioSource.uri(
      //   Uri.parse('asset:///${songList[3].url}'),
      // ),
      // AudioSource.uri(
      //   Uri.parse('asset:///${songList[4].url}'),
      // ),
      // AudioSource.uri(
      //   Uri.parse('asset:///${songList[5].url}'),
      // ),
      // AudioSource.uri(
      //   Uri.parse('asset:///${songList[6].url}'),
      // ),
    ]));
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Stream<SeekBarData> get _seekBarDataStream =>
      rxdart.Rx.combineLatest2<Duration, Duration?, SeekBarData>(
          audioPlayer.positionStream, audioPlayer.durationStream,
              (Duration position, Duration? duration) {
            return SeekBarData(position, duration ?? Duration.zero);
          });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Welcome to learning Math with a FlipCard on the Board!'),
      ),
      backgroundColor: Colors.blue.shade200,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 228, 218, 204),
                Colors.blueGrey,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )
        ),
        margin: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            const Sidebar(),
            // const SizedBox(width: 5,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MusicPlayer(
                      song: songList[1],
                      seekBarDataStream: _seekBarDataStream,
                      audioPlayer: audioPlayer),
                      const SizedBox(height: 50,),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 40.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: ElevatedButton(
                            child: const Text("Let's Get Started!"),
                            onPressed: () {
                              Get.toNamed('task_page');
                            },
                          ),)
                      ],
                    ),
                  )
                  // const Welcome(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}