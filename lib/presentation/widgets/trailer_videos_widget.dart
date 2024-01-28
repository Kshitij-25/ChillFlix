import 'package:chillflix2/core/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../data/models/videos_model.dart';

class TrailerVideosWidget extends StatelessWidget {
  TrailerVideosWidget({super.key, this.videosAsyncValue});

  AsyncValue<List<VideosModel>?>? videosAsyncValue;

  YoutubePlayerController? _youtubePlayerController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: videosAsyncValue!.value!.length,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final reversedIndex = videosAsyncValue!.value!.length - 1 - index;
        _youtubePlayerController = YoutubePlayerController(
          initialVideoId: videosAsyncValue!.value![reversedIndex].key!,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
            mute: true,
            forceHD: true,
            useHybridComposition: true,
            disableDragSeek: true,
          ),
        );
        return SizedBox(
          width: ScreenSize.width(context) * 0.9,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: YoutubePlayerBuilder(
              player: YoutubePlayer(
                controller: _youtubePlayerController!,
                aspectRatio: 16 / 9,
                showVideoProgressIndicator: true,
              ),
              builder: (context, player) {
                return Column(
                  children: [
                    player,
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: ScreenSize.width(context) / 3,
                            child: Text(
                              videosAsyncValue!.value![reversedIndex].name!,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            DateFormat.yMMMMd().format(
                              DateTime.parse(videosAsyncValue!.value![reversedIndex].published_at!),
                            ),
                            style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
