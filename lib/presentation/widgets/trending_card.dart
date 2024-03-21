import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../common/screen_size.dart';
import '../../data/core/api_constants.dart';
import '../../data/models/movie_model.dart';
import '../providers/trending_movies_provider.dart';
import '../screens/details_screen.dart';

class TrendingCard extends ConsumerWidget {
  const TrendingCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieAsyncValue = ref.watch(trendingMovieProvider);

    return movieAsyncValue.when(
      data: (movie) {
        List<MovieModel>? trendingMovies = movie.where((element) => element.original_title != null).toList();
        return Container(
          height: ScreenSize.height(context) * 0.55,
          width: ScreenSize.width(context),
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                blurRadius: 5,
                color: Colors.black,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: CarouselSlider.builder(
            itemCount: trendingMovies.length,
            itemBuilder: (context, index, realIndex) {
              return GestureDetector(
                onTap: () {
                  context.push(
                    DetailsScreen.route,
                    extra: trendingMovies[index].id,
                  );
                },
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: CachedNetworkImage(
                          imageUrl: "${ApiConstants.BASE_IMAGE_URL}${trendingMovies[index].poster_path}",
                          placeholder: (context, url) => const Center(child: CircularProgressIndicator.adaptive()),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                          fit: BoxFit.cover,
                        ),
                      ),
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
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            gradient: LinearGradient(
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                              stops: [0.4, 1.0],
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
                                  trendingMovies[index].title!,
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 30,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: Text(
                                    trendingMovies[index].overview!,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
            options: CarouselOptions(
              height: ScreenSize.height(context) * 0.55,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              onPageChanged: (index, reason) {
                debugPrint(reason.toString());
              },
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 20),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            ),
          ),
        );
      },
      loading: () {
        return Container(
          height: ScreenSize.height(context) * 0.55,
          width: ScreenSize.width(context),
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                blurRadius: 5,
                color: Colors.black,
                offset: Offset(0, 1),
              ),
            ],
          ),
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
