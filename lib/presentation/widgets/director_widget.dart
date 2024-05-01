import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tmdb_chillflix/data/models/crew_model.dart';

import '../../data/core/api_constants.dart';
import '../../data/models/credits_model.dart';

class DirectorWidget extends StatelessWidget {
  DirectorWidget({super.key, this.data});

  AsyncValue<CreditsModel>? data;

  @override
  Widget build(BuildContext context) {
    final dataAsyncValue = data;
    return dataAsyncValue!.when(
      data: (data) {
        CrewModel director = data.crew!.firstWhere((element) => element.job == "Director");
        return SizedBox(
          height: MediaQuery.of(context).size.width * 0.4,
          width: MediaQuery.of(context).size.width * 0.3,
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: CachedNetworkImage(
                    imageUrl: "${ApiConstants.BASE_IMAGE_URL}${director.profilePath}",
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
                        stops: [0.85, 1.0],
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
                            director.originalName!,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
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
      loading: () {
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
      error: (error, stackTrace) {
        return Center(child: Text('Error: $error'));
      },
    );
  }
}
