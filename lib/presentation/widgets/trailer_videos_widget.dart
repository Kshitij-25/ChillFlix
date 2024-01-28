import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../data/models/videos_model.dart';

class TrailerVideosWidget extends StatefulWidget {
  TrailerVideosWidget({super.key, this.videosAsyncValue});

  AsyncValue<List<VideosModel>?>? videosAsyncValue;

  @override
  State<TrailerVideosWidget> createState() => _TrailerVideosWidgetState();
}

class _TrailerVideosWidgetState extends State<TrailerVideosWidget> {
  YoutubePlayerController? _youtubePlayerController;

  @override
  void initState() {
    super.initState();
    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: widget.videosAsyncValue!.value![0].key!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
        forceHD: true,
        useHybridComposition: true,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _youtubePlayerController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _youtubePlayerController!,
        aspectRatio: 16 / 9,
        showVideoProgressIndicator: true,
      ),
      builder: (context, player) {
        return Padding(
          padding: const EdgeInsets.all(.0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            // itemCount: widget.videosAsyncValue!.value!.length,
            itemCount: 1,
            itemBuilder: (context, index) {
              return Container(
                child: player,
              );
            },
          ),
        );
      },
    );
  }
}
