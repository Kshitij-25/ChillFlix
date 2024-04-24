// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tmdb_chillflix/common/screen_size.dart';

import '../change_notifier_providers/auth_change_notifier_provider.dart';
import '../providers/firestore_service_provider.dart';
import '../providers/movie_details_provider.dart';
import '../providers/similar_movies_provider.dart';
import '../providers/videos_provider.dart';
import '../widgets/big_poster_widget.dart';
import '../widgets/similar_movies_widget.dart';

class DetailsScreen extends ConsumerWidget {
  DetailsScreen({super.key, this.id});

  static const route = "/detailsScreen";
  int? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        forceMaterialTransparency: true,
      ),
      body: bodyWidget(context, ref),
    );
  }

  bodyWidget(BuildContext context, WidgetRef ref) {
    // final id = ModalRoute.of(context)!.settings.arguments as int;
    final detailsAsyncValue = ref.watch(moviesDetailsProvider(movieId: id!));
    final similarMoviesAsyncValue = ref.watch(similarMoviesProvider(moviesId: id!));
    final videosAsyncValue = ref.watch(videosProvider(moviesId: id!));
    final user = ref.read(authChangeNotifierProvider);
    final firestoreService = ref.watch(firestoreServiceProvider);

    return DefaultTabController(
      length: 2, // Number of tabs
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BigPosterWidget(
                    user: user,
                    dataAsyncValue: detailsAsyncValue,
                    firestoreService: firestoreService,
                    videosAsyncValue: videosAsyncValue,
                  ),
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("More like this"),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: 3,
                          width: ScreenSize.width(context) * 0.26,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: ScreenSize.width(context),
                        child: SimilarMoviesWidget(similarMoviesAsyncValue: similarMoviesAsyncValue),
                      )
                    ],
                  )
                  // const TabBar(
                  //   isScrollable: true,
                  //   tabAlignment: TabAlignment.start,
                  //   tabs: [
                  //     Tab(text: 'More like this'),
                  //     Tab(text: ''),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: ScreenSize.width(context) + kTextTabBarHeight,
                  //   child: TabBarView(
                  //     children: [
                  //       SimilarMoviesWidget(similarMoviesAsyncValue: similarMoviesAsyncValue),
                  //       const SizedBox.shrink(),
                  //       // Padding(
                  //       //   padding: const EdgeInsets.symmetric(vertical: 15.0),
                  //       //   child: TrailerVideosWidget(videosAsyncValue: videosAsyncValue),
                  //       // ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
