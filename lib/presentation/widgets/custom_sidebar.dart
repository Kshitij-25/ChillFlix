import 'package:chillflix2/core/utils/screen_util.dart';
import 'package:chillflix2/presentation/widgets/genre_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/genre_list_provider.dart';

class CustomSidebar extends ConsumerWidget {
  const CustomSidebar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: double.infinity,
      width: ScreenSize.width(context) * 0.12,
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: const BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Column(
        // shrinkWrap: true,
        children: [
          IconButton(
            icon: const Icon(
              Icons.home,
              color: Colors.white,
            ),
            onPressed: () {
              ref.read(activeGenreIndexProvider.notifier).state = -1;
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              ref.read(activeGenreIndexProvider.notifier).state = -1;
            },
          ),
          Expanded(
            child: GenreListWidget(ref: ref),
          ),
        ],
      ),
    );
  }
}
