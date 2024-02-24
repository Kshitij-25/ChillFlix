import 'package:chillflix2/presentation/providers/popular_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/models/movies.dart';
import '../widgets/custom_gridview.dart';

class PopularScreen extends ConsumerWidget {
  const PopularScreen({super.key});

  static const route = "/popularScreen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScrollController scrollController = ScrollController();
    int page = 1;
    // final List<Movies>? nowPlaying = ModalRoute.of(context)?.settings.arguments as List<Movies>?;
    final popularAsyncValue = ref.watch(popular);

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
          "Popular Movies",
          style: GoogleFonts.raleway(
            fontSize: 27,
            color: Colors.red.shade900,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: bodyWidget(context, scrollController, popularAsyncValue),
    );
  }

  bodyWidget(context, ScrollController scrollController, AsyncValue<List<Movies>?> popularAsyncValue) {
    return popularAsyncValue.when(
      data: (popular) {
        return CustomGridView(
          scrollController: scrollController,
          data: popular,
        );
      },
      loading: () => const Center(child: CircularProgressIndicator.adaptive()),
      error: (error, stackTrace) {
        return Center(child: Text('Error: $error'));
      },
    );
  }
}
