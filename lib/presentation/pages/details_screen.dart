import 'package:chillflix2/core/utils/screen_util.dart';
import 'package:chillflix2/presentation/providers/movies_details_provider.dart';
import 'package:chillflix2/presentation/providers/videos_provider.dart';
import 'package:chillflix2/presentation/widgets/trailer_videos_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/similar_movies_provider.dart';
import '../widgets/big_poster_widget.dart';
import '../widgets/similar_movies_widgets.dart';

class DetailsScreen extends ConsumerWidget {
  const DetailsScreen({super.key});

  static const route = "/detailsScreen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: bodyWidget(context, ref),
    );
  }

  bodyWidget(BuildContext context, WidgetRef ref) {
    final id = ModalRoute.of(context)!.settings.arguments as int;
    final detailsAsyncValue = ref.watch(moviesDetails(id));
    final similarMoviesAsyncValue = ref.watch(similarMoviesProvider(id));
    final videosAsyncValue = ref.watch(videosProvider(id));

    return DefaultTabController(
      length: 2, // Number of tabs
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BigPosterWidget(dataAsyncValue: detailsAsyncValue),
                  const TabBar(
                    tabs: [
                      Tab(text: 'Similar Movies'),
                      Tab(text: 'Trailers & more'),
                    ],
                  ),
                  SizedBox(
                    height: ScreenSize.width(context) + kTextTabBarHeight,
                    child: TabBarView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: SimilarMoviesWidget(similarMoviesAsyncValue: similarMoviesAsyncValue),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: TrailerVideosWidget(videosAsyncValue: videosAsyncValue),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
