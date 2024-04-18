import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tmdb_chillflix/presentation/providers/popular_provider.dart';

import '../widgets/custom_gridview.dart';
import 'details_screen.dart';

class PopularScreen extends ConsumerWidget {
  const PopularScreen({super.key});

  static const route = "/popularScreen";

  static const pageSize = 20;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        forceMaterialTransparency: true,
        centerTitle: true,
        title: Text(
          "Popular Movies",
          style: GoogleFonts.raleway(
            fontSize: 27,
            color: Colors.red[900],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: bodyWidget(context, ref),
    );
  }

  bodyWidget(context, WidgetRef ref) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemBuilder: (context, index) {
        final page = index ~/ pageSize + 1;
        final indexInPage = index % pageSize;

        final popularAsyncValue = ref.watch(popularProvider(page: page));

        return popularAsyncValue.when(
          data: (popular) {
            if (indexInPage >= popular.length) {
              return null;
            }
            final movie = popular[indexInPage];
            return GestureDetector(
              onTap: () {
                context.push(
                  DetailsScreen.route,
                  extra: movie.id,
                );
              },
              child: CustomGridView(
                data: movie,
              ),
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          error: (error, stackTrace) {
            return Center(child: Text('Error: $error'));
          },
        );
      },
    );
  }
}
