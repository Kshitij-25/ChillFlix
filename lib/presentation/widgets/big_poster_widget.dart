import 'package:cached_network_image/cached_network_image.dart';
import 'package:chillflix2/core/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/constants/api_constants.dart';
import '../../data/models/movies_details.dart';

class BigPosterWidget extends StatelessWidget {
  BigPosterWidget({super.key, this.dataAsyncValue});
  AsyncValue<MoviesDetails?>? dataAsyncValue;

  @override
  Widget build(
    BuildContext context,
  ) {
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
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 30,
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
                                            style: GoogleFonts.roboto(fontSize: 13),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Text(
                              data.overview!,
                              textAlign: TextAlign.center,
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
