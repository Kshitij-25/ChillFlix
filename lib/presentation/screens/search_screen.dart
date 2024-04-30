// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/screen_size.dart';
import '../../data/models/movie_model.dart';
import '../change_notifier_providers/search_change_notifier_provider.dart';
import '../providers/multi_search_provider.dart';
import '../widgets/custom_gridview.dart';
import '../widgets/custom_search_widget.dart';
import 'details_screen.dart';

class SearchScreen extends ConsumerWidget {
  static const route = "/SearchScreen";

  final ScrollController scrollController = ScrollController();

  List<MovieModel>? searchedMovies = [];

  SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var searchNotifier = ref.watch(searchNotifierProvider);
    final searchResultAsyncValue = ref.watch(multiSearchProvider(query: searchNotifier.query));
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Search',
                style: GoogleFonts.raleway(
                  fontSize: 27,
                  color: Colors.red[900],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomSearchWidget(
              onChanged: (value) {
                debugPrint(value);
                searchNotifier.query = value;
              },
            ),
            // Use .when to handle the different states of the AsyncValue
            searchResultAsyncValue.when(
              loading: () => SizedBox(
                height: ScreenSize.height(context) * 0.75,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(child: CircularProgressIndicator.adaptive()),
                  ],
                ),
              ),
              error: (error, stackTrace) => Text('Error: $error'), // Show error message
              data: (searchedMovies) {
                // Update the searchedMovies list when data is available
                List<MovieModel>? validSearchedMovies = searchedMovies.where((element) {
                  // Check if title and backdrop_path are not empty strings
                  return element.title != null && element.backdrop_path != null;
                }).toList();

                this.searchedMovies = validSearchedMovies;
                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: this.searchedMovies?.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        context.push(
                          DetailsScreen.route,
                          extra: this.searchedMovies?[index].id,
                        );
                      },
                      child: CustomGridView(
                        data: this.searchedMovies?[index],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
