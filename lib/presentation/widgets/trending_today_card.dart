import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:chillflix2/core/utils/screen_util.dart';
import 'package:chillflix2/presentation/providers/trending_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/constants/api_constants.dart';
import '../../data/models/movies.dart';
import '../pages/details_screen.dart';

class TrendingTodayCard extends ConsumerWidget {
  const TrendingTodayCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieAsyncValue = ref.watch(trendingMovies);

    return movieAsyncValue.when(
      data: (movie) {
        List<Movies>? trendingMovies = movie!.where((element) => element.original_title != null).toList();
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
                  Navigator.of(context).pushNamed(
                    DetailsScreen.route,
                    arguments: trendingMovies[index].id,
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
                        // child: Image.network(
                        //   "$${trendingMovies[index].posterPath}",
                        //   fit: BoxFit.cover,
                        // ),
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
                print("object");
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
