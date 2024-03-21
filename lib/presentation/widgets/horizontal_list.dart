// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/core/api_constants.dart';
import '../../data/models/movie_model.dart';
import '../screens/details_screen.dart';

class HorizontalList extends ConsumerWidget {
  HorizontalList({super.key, this.data, this.title, this.onPressed});

  AsyncValue<List<MovieModel>?>? data;
  String? title;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataAsyncValue = data;

    return dataAsyncValue!.when(
      data: (data) {
        List<MovieModel>? sortedData = data!.where((element) => element.original_title != null).toList();
        return Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    title!,
                    style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: onPressed,
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.6,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: sortedData.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.push(
                        DetailsScreen.route,
                        extra: sortedData[index].id,
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      margin: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 5.0,
                            // color: Colors.grey[400],
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: CachedNetworkImage(
                                imageUrl: "${ApiConstants.BASE_IMAGE_URL}${sortedData[index].poster_path}",
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
                                        sortedData[index].title!,
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
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
      loading: () {
        return Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    title!,
                    style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: onPressed,
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.6,
              child: const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            ),
          ],
        );
      },
      error: (error, stackTrace) {
        return Center(child: Text('Error: $error'));
      },
    );
  }
}
