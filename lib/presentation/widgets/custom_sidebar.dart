import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/utils/screen_util.dart';
import '../../data/models/genre_list.dart';
import '../providers/auth_providers.dart';
import '../providers/genre_list_provider.dart';
import 'genre_list_widget.dart';

class CustomSidebar extends ConsumerWidget {
  CustomSidebar({super.key, this.genreListAsyncValue});

  AsyncValue<List<GenreList>?>? genreListAsyncValue;
  void Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProvider = ref.watch(authChangeProvider);
    return Container(
      height: double.infinity,
      width: ScreenSize.width(context) * 0.12,
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.red[900],
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Column(
        // shrinkWrap: true,
        children: [
          IconButton(
            icon: const Icon(
              CupertinoIcons.home,
            ),
            onPressed: () {
              ref.read(activeGenreIndexProvider.notifier).state = 0;
            },
          ),
          IconButton(
            icon: const Icon(
              CupertinoIcons.search,
            ),
            onPressed: () {
              ref.read(activeGenreIndexProvider.notifier).state = 1;
            },
          ),
          IconButton(
            icon: const Icon(
              CupertinoIcons.person_solid,
            ),
            onPressed: () async {
              // authProvider.logout();
              ref.read(activeGenreIndexProvider.notifier).state = 2;
            },
          ),
          Expanded(
            child: GenreListWidget(
              ref: ref,
              genreListAsyncValue: genreListAsyncValue,
            ),
          ),
        ],
      ),
    );
  }
}
