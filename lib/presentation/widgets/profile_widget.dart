import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/utils/screen_util.dart';
import '../../main.dart';
import '../pages/login.dart';
import '../providers/auth_providers.dart';
import 'section_container.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget({super.key});

  var name = prefs!.getString("NAME");
  var username = prefs!.getString("USERNAME");
  var accountId = prefs!.getInt("ACCOUNT_ID");

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Profile',
                  style: GoogleFonts.raleway(
                    fontSize: 27,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 60,
                  child: Text(
                    name![0],
                    style: GoogleFonts.raleway(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name!,
                      style: GoogleFonts.raleway(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(username!),
                  ],
                )
              ],
            ),
          ),
          // Consumer(
          //   builder: (context, ref, child) => SectionContainer(
          //     title: "NOW PLAYING",
          //     data: ref.watch(nowPlaying),
          //     onPressed: () {
          //       Navigator.of(context).pushNamed(
          //         NowPlayingScreen.route,
          //         arguments: ref.watch(nowPlaying),
          //       );
          //     },
          //   ),
          // ),
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return SizedBox(
                height: 50,
                width: ScreenSize.width(context) * 0.7,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  onPressed: () async {
                    var sessionId = prefs!.getString("sessionId");
                    print(sessionId);
                    bool? status = await ref.watch(logoutProvider(sessionId!).future);
                    if (status == true) {
                      Navigator.of(context).pushReplacementNamed(LoginScreen.route);
                    }
                  },
                  child: Text(
                    "LOGOUT",
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
