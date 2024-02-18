import 'package:chillflix2/core/utils/screen_util.dart';
import 'package:chillflix2/main.dart';
import 'package:chillflix2/presentation/pages/homepage.dart';
import 'package:chillflix2/presentation/providers/account_details_provider.dart';
import 'package:chillflix2/presentation/providers/auth_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  static const route = "/loginScreen";

  TextEditingController userNameCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: bodyWidget(context),
    );
  }

  bodyWidget(context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          child: GestureDetector(
            onTap: () {
              userNameCont.text = "kshitij-22";
              passwordCont.text = "Nishu@2201";
            },
            child: Container(
              height: 100,
              width: 100,
              color: Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.white,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              color: ThemeData.dark().highlightColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            height: ScreenSize.height(context) * 0.6,
            width: ScreenSize.width(context),
          ),
        ),
        Positioned(
          left: ScreenSize.width(context) * 0.05,
          top: ScreenSize.height(context) / 4,
          child: SizedBox(
            width: ScreenSize.width(context) * 0.9,
            height: ScreenSize.height(context) / 2,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: userNameCont,
                      decoration: const InputDecoration(
                        alignLabelWithHint: true,
                        prefixIcon: Icon(CupertinoIcons.person_fill),
                        hintText: "Enter TMDB Username",
                        label: Text("Enter TMDB Username"),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: passwordCont,
                      obscureText: true,
                      decoration: const InputDecoration(
                        alignLabelWithHint: true,
                        prefixIcon: Icon(CupertinoIcons.lock_fill),
                        hintText: "Enter Password",
                        label: Text("Enter Password"),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Consumer(
                      builder: (BuildContext context, WidgetRef ref, Widget? child) {
                        return SizedBox(
                          height: 50,
                          width: ScreenSize.width(context),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            onPressed: () async {
                              final loginResult = await ref.watch(loginProvider({
                                "username": userNameCont.text,
                                "password": passwordCont.text,
                              }).future);

                              final bool? status = loginResult;

                              if (status == true) {
                                print("LOGIN STATUS: $status");
                                userNameCont.clear();
                                passwordCont.clear();
                                Navigator.of(context).pushReplacementNamed(HomePage.route);

                                final accountDetails = await ref.watch(accountDeatilsProvider.future);

                                await prefs!.setString("NAME", accountDetails!.name!);
                                await prefs!.setString("USERNAME", accountDetails.username!);
                                await prefs!.setInt("ACCOUNT_ID", accountDetails.id!);
                              }
                            },
                            child: Text(
                              "LOGIN",
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
              ),
            ),
          ),
        ),
      ],
    );
  }
}
