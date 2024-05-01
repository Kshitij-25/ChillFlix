// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tmdb_chillflix/common/screen_size.dart';
import 'package:tmdb_chillflix/presentation/widgets/director_widget.dart';
import 'package:tmdb_chillflix/presentation/widgets/horizontal_list.dart';

import '../change_notifier_providers/auth_change_notifier_provider.dart';
import '../providers/credits_provider.dart';
import '../providers/firestore_service_provider.dart';
import '../providers/movie_details_provider.dart';
import '../providers/similar_movies_provider.dart';
import '../providers/videos_provider.dart';
import '../widgets/big_poster_widget.dart';
import '../widgets/cast_and_crew_widget.dart';

class DetailsScreen extends ConsumerWidget {
  DetailsScreen({super.key, this.id});

  static const route = "/detailsScreen";
  int? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
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
    final creditsAsyncValue = ref.watch(getCreditsForMovieProvider(movieId: id!));

    return Column(
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
                    headWidget(context, "More like this"),
                    SizedBox(
                      child: HorizontalList(
                        data: similarMoviesAsyncValue,
                      ),
                    ),
                    headWidget(context, "Casts & Crew"),
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CastAndCrewWidget(
                          data: creditsAsyncValue,
                        ),
                      ),
                    ),
                    headWidget(context, "Director"),
                    SafeArea(
                      top: false,
                      bottom: true,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8, left: 15),
                            child: DirectorWidget(
                              data: creditsAsyncValue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  headWidget(context, text) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                text,
                style: GoogleFonts.raleway(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            height: 3,
            width: ScreenSize.width(context) * 0.26,
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
