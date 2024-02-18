import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/genre_list.dart';
import '../providers/genre_list_provider.dart';

class GenreListWidget extends StatelessWidget {
  GenreListWidget({super.key, this.ref, this.genreListAsyncValue});

  WidgetRef? ref;
  AsyncValue<List<GenreList>?>? genreListAsyncValue;

  @override
  Widget build(BuildContext context) {
    final activeGenreIndex = ref!.watch(activeGenreIndexProvider);
    return genreListAsyncValue!.when(
      data: (genreList) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: genreList?.length ?? 0,
          itemBuilder: (context, index) {
            final genre = genreList![index];
            return GestureDetector(
              onTap: () {
                ref!.read(activeGenreIndexProvider.notifier).state = index + 3;
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(vertical: 9),
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: Text(
                        genre.name!,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  if (index + 3 == activeGenreIndex)
                    Container(
                      height: 5,
                      width: 5,
                      margin: const EdgeInsets.only(top: 5),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                ],
              ),
            );
          },
        );
      },
      loading: () {
        return const Center(child: CircularProgressIndicator.adaptive());
      },
      error: (error, stackTrace) {
        return Center(child: Text('Error: $error'));
      },
    );
  }
}
