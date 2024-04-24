// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../data/models/video_model.dart';

class TrailerVideosWidget extends StatelessWidget {
  TrailerVideosWidget({super.key, this.videosAsyncValue});

  AsyncValue<List<VideoModel>?>? videosAsyncValue;

  YoutubePlayerController? _youtubePlayerController;

  @override
  Widget build(BuildContext context) {
    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: videosAsyncValue!.value![videosAsyncValue!.value!.length - 1].key!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
        forceHD: true,
        hideThumbnail: true,
        disableDragSeek: true,
        showLiveFullscreenButton: true,
      ),
    );
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 65, vertical: 40),
        child: YoutubePlayerBuilder(
          player: YoutubePlayer(
            topActions: [
              IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(
                  CupertinoIcons.back,
                  color: Colors.white,
                ),
              )
            ],
            controller: _youtubePlayerController!,
            aspectRatio: 16 / 9,
            showVideoProgressIndicator: true,
          ),
          builder: (context, player) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: player,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
