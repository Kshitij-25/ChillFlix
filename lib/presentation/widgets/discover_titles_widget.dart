import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/models/genrelist.dart';
import '../../data/models/movies.dart';
import 'custom_gridview.dart';

class DiscoverTitlesWidget extends StatelessWidget {
  DiscoverTitlesWidget({super.key, this.discoverMovies, this.genreListAsyncValue, this.activeGenreIndex});

  final AsyncValue<List<Movies>?>? discoverMovies;
  AsyncValue<List<GenreList>?>? genreListAsyncValue;
  int? activeGenreIndex;
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                genreListAsyncValue!.value![activeGenreIndex! - 3].name!,
                style: GoogleFonts.raleway(
                  fontSize: 27,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomGridView(
              scrollController: scrollController,
              data: discoverMovies!.value,
            ),
          ],
        ),
      ),
    );
  }
}
