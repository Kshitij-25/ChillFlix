import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/now_playing_provider.dart';
import '../widgets/custom_gridview.dart';
import 'details_screen.dart';

class NowPlayingScreen extends ConsumerWidget {
  const NowPlayingScreen({super.key});

  static const route = "/nowPlayingScreen";

  static const pageSize = 20;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        forceMaterialTransparency: true,
        centerTitle: true,
        title: Text(
          "Now Playing",
          style: GoogleFonts.raleway(
            fontSize: 27,
            color: Colors.red[900],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: bodyWidget(context, ref),
    );
  }

  bodyWidget(context, WidgetRef ref) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemBuilder: (context, index) {
        final page = index ~/ pageSize + 1;
        final indexInPage = index % pageSize;

        final nowPlayingAsyncValue = ref.watch(nowPlayingProvider(page: page));

        return nowPlayingAsyncValue.when(
          data: (nowPlaying) {
            if (indexInPage >= nowPlaying.length) {
              return null;
            }
            final movie = nowPlaying[indexInPage];
            return GestureDetector(
              onTap: () {
                context.push(
                  DetailsScreen.route,
                  extra: movie.id,
                );
              },
              child: CustomGridView(
                data: movie,
              ),
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          error: (error, stackTrace) {
            return Center(child: Text('Error: $error'));
          },
        );
      },
    );
  }
}
