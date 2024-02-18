import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({super.key, this.onChanged});

  final TextEditingController searchCont = TextEditingController();
  void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Consumer(
            builder: (context, WidgetRef ref, _) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    SearchBar(
                      autoFocus: true,
                      controller: searchCont,
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
          ),
        ],
      ),
    );
  }
}
