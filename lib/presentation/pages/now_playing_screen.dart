import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/models/movies.dart';
import '../providers/now_playing_provider.dart';
import '../widgets/custom_gridview.dart';

class NowPlayingScreen extends ConsumerWidget {
  const NowPlayingScreen({super.key});

  static const route = "/nowPlayingScreen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScrollController scrollController = ScrollController();
    int page = 1;
    // final List<Movies>? nowPlaying = ModalRoute.of(context)?.settings.arguments as List<Movies>?;
    final nowPlayingAsyncValue = ref.watch(nowPlaying);

    // Listen to the scroll position and fetch new data when reaching the end
    // _scrollController.addListener(() {
    //   if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
    //     page++;
    //     ref.read(nowPlayingUseCaseProvider).getNowPlaying(page).then((newData) {
    //       if (newData != null && newData.isNotEmpty) {
    //         // Add the new data to the existing list
    //         // nowPlaying?.addAll(newData);

    //         // Update the state notifier
    //         ref.read(nowPlayingStateNotifierProvider.notifier).addData(newData);
    //       }
    //     });
    //   }
    // });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Now Playing",
          style: GoogleFonts.raleway(
            fontSize: 27,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: bodyWidget(context, scrollController, nowPlayingAsyncValue),
    );
  }

  bodyWidget(context, ScrollController scrollController, AsyncValue<List<Movies>?> nowPlayingAsyncValue) {
    return nowPlayingAsyncValue.when(
      data: (nowPlaying) {
        return customGridView(
          scrollController: scrollController,
          data: nowPlaying,
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
      error: (error, stackTrace) {
        return Center(child: Text('Error: $error'));
      },
    );
  }
}
