import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../models/song_model.dart';

class PlayerButtons extends StatefulWidget {
  const PlayerButtons({Key? key, required this.audioPlayer}) : super(key: key);

  final AudioPlayer audioPlayer;

  @override
  State<PlayerButtons> createState() => _PlayerButtonsState();
}

class _PlayerButtonsState extends State<PlayerButtons> {
  List<Song> song = Song.songs;
  int index = 0;

  List<Song> get getSong => song;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Sequence state needs to be use here since we are looking for
        // for a previousely played song
        StreamBuilder<SequenceState?>(
            stream: widget.audioPlayer.sequenceStateStream,
            builder: (context, index) {
              return IconButton(
                onPressed: widget.audioPlayer.hasPrevious
                    ? widget.audioPlayer.seekToPrevious
                    : null,
                iconSize: 45,
                icon: const Icon(
                  Icons.skip_previous,
                  color: Colors.white,
                ),
              );
            }),

        // This is for the actually music we're currently playing or
        // trying to play
        StreamBuilder<PlayerState>(
          stream: widget.audioPlayer.playerStateStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final playerState = snapshot.data;
              final processingState = playerState!.processingState;

              if (processingState == ProcessingState.loading ||
                  processingState == ProcessingState.buffering) {
                return Container(
                  width: 64.0,
                  height: 64.0,
                  margin: const EdgeInsets.all(10.0),
                  child: const CircularProgressIndicator(),
                );
              } else if (!widget.audioPlayer.playing) {
                return IconButton(
                  onPressed: widget.audioPlayer.play,
                  iconSize: 75,
                  icon: const Icon(
                    Icons.play_circle,
                    color: Colors.white,
                  ),
                );
              } else if (processingState != ProcessingState.completed) {
                return IconButton(
                  icon: const Icon(
                    Icons.pause_circle,
                    color: Colors.white,
                  ),
                  iconSize: 75,
                  onPressed: widget.audioPlayer.pause,
                );
              } else {
                return IconButton(
                  icon: const Icon(
                    Icons.replay_circle_filled_outlined,
                    color: Colors.white,
                  ),
                  iconSize: 75,
                  onPressed: () => widget.audioPlayer.seek(
                    Duration.zero,
                    index: widget.audioPlayer.effectiveIndices!.first,
                  ),
                );
              }
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),

        // Sequence state needs to be use here
        StreamBuilder<SequenceState?>(
            stream: widget.audioPlayer.sequenceStateStream,
            builder: (context, index) {
              return IconButton(
                onPressed: widget.audioPlayer.hasNext
                    ? widget.audioPlayer.seekToNext
                    : null,
                iconSize: 45,
                icon: const Icon(
                  Icons.skip_next,
                  color: Colors.white,
                ),
              );
            }),
      ],
    );
  }
}