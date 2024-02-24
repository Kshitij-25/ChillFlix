import 'package:chillflix2/app.dart';
import 'package:chillflix2/presentation/pages/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/utils/app_utility.dart';
import '../../core/utils/screen_util.dart';
import '../providers/auth_providers.dart';

class RegisterScreen extends ConsumerWidget {
  RegisterScreen({super.key});

  static const route = "/register";

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.red.shade900,
      resizeToAvoidBottomInset: false,
      body: bodyWidget(context, ref),
    );
  }

  bodyWidget(context, WidgetRef ref) {
    final authProvider = ref.watch(authChangeProvider);
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark ? ThemeData.dark().primaryColorDark : ThemeData.light().primaryColorLight,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(60),
                topRight: Radius.circular(60),
              ),
            ),
            height: ScreenSize.height(context) * 0.7,
            width: ScreenSize.width(context),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      // controller: userNameCont,
                      keyboardType: TextInputType.emailAddress,
                      initialValue: authProvider.email,
                      onChanged: (value) => authProvider.email = value,
                      validator: (value) => authProvider.emailValidate(value!),
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        prefixIcon: const Icon(CupertinoIcons.mail_solid),
                        hintText: "Enter Email",
                        label: const Text("Enter Email"),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade900),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      // controller: passwordCont,
                      obscureText: authProvider.obscurePassword,
                      initialValue: authProvider.password,
                      onChanged: (value) => authProvider.password = value,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        prefixIcon: const Icon(CupertinoIcons.lock_fill),
                        suffixIcon: IconButton(
                          onPressed: () {
                            authProvider.obscurePassword = !authProvider.obscurePassword;
                          },
                          icon: Icon(authProvider.obscurePassword ? CupertinoIcons.eye_slash_fill : CupertinoIcons.eye_fill),
                        ),
                        hintText: "Enter Password",
                        label: const Text("Enter Password"),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade900),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      // controller: passwordCont,
                      obscureText: authProvider.obscureConfirmPassword,
                      initialValue: authProvider.password,
                      onChanged: (value) => authProvider.password = value,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        prefixIcon: const Icon(CupertinoIcons.lock_fill),
                        suffixIcon: IconButton(
                          onPressed: () {
                            authProvider.obscureConfirmPassword = !authProvider.obscureConfirmPassword;
                          },
                          icon: Icon(authProvider.obscureConfirmPassword ? CupertinoIcons.eye_slash_fill : CupertinoIcons.eye_fill),
                        ),
                        hintText: "Confirm Password",
                        label: const Text("Confirm Password"),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade900),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Consumer(
                      builder: (BuildContext context, WidgetRef ref, Widget? child) {
                        return SizedBox(
                          height: 55,
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
                              if (_formKey.currentState!.validate()) {
                                try {
                                  await authProvider.registerUser();
                                  Navigator.of(context).pushReplacementNamed(InitialPage.route);
                                } catch (e) {
                                  AppUtility(context).error(e.toString());
                                }
                              }
                            },
                            child: Text(
                              "REGISTER",
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(),
                        Consumer(
                          builder: (BuildContext context, WidgetRef ref, Widget? child) {
                            return SizedBox(
                              height: 55,
                              width: ScreenSize.width(context) * 0.93,
                              child: ElevatedButton.icon(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                  shape: MaterialStateProperty.all<OutlinedBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                onPressed: () {},
                                icon: const Icon(
                                  FontAwesomeIcons.google,
                                  color: Colors.black,
                                ),
                                label: Text(
                                  "Register with Google",
                                  style: GoogleFonts.raleway(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Already Registered? Login"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (authProvider.loading)
          const Material(
            color: Colors.black87,
            child: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          ),
      ],
    );
  }
}
