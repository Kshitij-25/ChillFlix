import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/watchList_provider.dart';
import '../widgets/custom_gridview.dart';
import 'details_screen.dart';

class WatchListScreen extends ConsumerWidget {
  const WatchListScreen({super.key});

  static const route = "/watchlistScreen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        forceMaterialTransparency: true,
        centerTitle: true,
        title: Text(
          "WatchList",
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
      itemCount: ref.watch(watchlistProvider).value?.length ?? 0,
      itemBuilder: (context, index) {
        final watchListAsyncValue = ref.watch(watchlistProvider);

        return watchListAsyncValue.when(
          data: (watchlist) {
            final movie = watchlist[index];
            return GestureDetector(
              onTap: () {
                context.push(
                  DetailsScreen.route,
                  extra: movie.id,
                );
              },
              child: CustomGridView(
                otherData: movie,
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
