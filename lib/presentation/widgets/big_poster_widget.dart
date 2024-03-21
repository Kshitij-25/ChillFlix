// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/app_utility.dart';
import '../../common/screen_size.dart';
import '../../data/core/api_constants.dart';
import '../../data/firebase_db/firestore_service.dart';
import '../../data/models/movie_details.dart';
import '../change_notifier_providers/auth_change_notifier_provider.dart';
import '../state_notifiers/movie_state_notifier.dart';

class BigPosterWidget extends StatelessWidget {
  BigPosterWidget({
    super.key,
    this.dataAsyncValue,
    this.user,
    this.firestoreService,
  });
  AsyncValue<MovieDetails?>? dataAsyncValue;
  AuthNotifier? user;
  FirestoreService? firestoreService;

  @override
  Widget build(BuildContext context) {
    var userId = user!.user!.uid;
    return dataAsyncValue!.when(
      data: (data) {
        return Column(
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: "${ApiConstants.BASE_IMAGE_URL}${data!.poster_path}",
                  placeholder: (context, url) => const Center(child: CircularProgressIndicator.adaptive()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 1.4,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          stops: [0.1, 0.9],
                          colors: [Colors.transparent, Colors.black],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              data.title!,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.raleway(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 35,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: data.genres!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                        color: Colors.grey.shade800,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                        child: Center(
                                          child: Text(
                                            data.genres![index].name!,
                                            style: GoogleFonts.roboto(fontSize: 13, color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Consumer(
                                  builder: (BuildContext context, WidgetRef ref, Widget? child) {
                                    final movieState = ref.watch(movieStateProvider);
                                    final isInMyList = movieState.myList.any((m) => m.id == data.id);
                                    return SizedBox(
                                      height: 68,
                                      child: Column(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              if (isInMyList != true) {
                                                firestoreService!.addMovieToCollection(userId, "my_list", data);
                                                movieState.addToMyList(data, 'my_list');
                                                AppUtility(context).message("Added to My List");
                                              } else {
                                                firestoreService!.removeMovieFromCollection(userId, "my_list", data.id.toString());
                                                movieState.removeFromMyList(data.id.toString(), 'my_list');
                                                AppUtility(context).message("Removed from My List");
                                              }
                                            },
                                            icon: Icon(
                                              !isInMyList ? CupertinoIcons.add : CupertinoIcons.checkmark_circle_fill,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "My List",
                                            style: GoogleFonts.roboto(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                Consumer(
                                  builder: (BuildContext context, WidgetRef ref, Widget? child) {
                                    final movieState = ref.watch(movieStateProvider);
                                    final isInWatchlist = movieState.watchlist.any((m) => m.id == data.id);
                                    return SizedBox(
                                      height: 68,
                                      child: Column(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              if (isInWatchlist != true) {
                                                firestoreService!.addMovieToCollection(userId, "watchlist", data);
                                                movieState.addToWatchlist(data, 'watchlist');
                                                AppUtility(context).message("Added to Watchlist");
                                              } else {
                                                firestoreService!.removeMovieFromCollection(userId, "watchlist", data.id.toString());
                                                movieState.removeFromWatchlist(data.id.toString(), 'watchlist');
                                                AppUtility(context).message("Removed from Watchlist");
                                              }
                                            },
                                            icon: Icon(
                                              !isInWatchlist ? CupertinoIcons.square_stack : CupertinoIcons.square_stack_fill,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "Watchlist",
                                            style: GoogleFonts.roboto(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            // Consumer(
                            //   builder: (BuildContext context, WidgetRef ref, Widget? child) {
                            //     return SizedBox(
                            //       height: 50,
                            //       width: ScreenSize.width(context) * 0.7,
                            //       child: ElevatedButton(
                            //         style: ButtonStyle(
                            //           backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            //           shape: MaterialStateProperty.all<OutlinedBorder>(
                            //             RoundedRectangleBorder(
                            //               borderRadius: BorderRadius.circular(10),
                            //             ),
                            //           ),
                            //         ),
                            //         onPressed: () {},
                            //         child: Text(
                            //           "Play Trailer",
                            //           style: GoogleFonts.raleway(
                            //             fontWeight: FontWeight.w600,
                            //             fontSize: 18,
                            //           ),
                            //         ),
                            //       ),
                            //     );
                            //   },
                            // ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              data.overview!,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
      loading: () {
        return SizedBox(
          height: ScreenSize.height(context) / 1.4,
          child: const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        );
      },
      error: (error, stackTrace) {
        return Center(child: Text('Error: $error'));
      },
    );
  }
}
