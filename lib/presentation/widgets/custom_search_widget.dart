// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tmdb_chillflix/common/screen_size.dart';

class CustomSearchWidget extends StatelessWidget {
  CustomSearchWidget({super.key, this.onChanged});

  final TextEditingController searchCont = TextEditingController();
  void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, WidgetRef ref, _) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              SearchBar(
                constraints: BoxConstraints(
                  maxWidth: ScreenSize.width(context) * 0.8,
                  minHeight: 55,
                ),
                autoFocus: true,
                // controller: searchCont,
                hintText: "Search shows, movies, peoples...",
                leading: const Icon(CupertinoIcons.search),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: onChanged,
              ),
            ],
          ),
        );
      },
    );
  }
}
