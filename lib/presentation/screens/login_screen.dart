// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tmdb_chillflix/common/device_type.dart';

import '../../common/app_utility.dart';
import '../../common/screen_size.dart';
import '../change_notifier_providers/auth_change_notifier_provider.dart';
import '../providers/auth_provider.dart';
import '../providers/genre_provider.dart';
import 'home_screen.dart';
import 'register_screen.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  static const route = "/loginScreen";

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.red[900],
        resizeToAvoidBottomInset: false,
        body: bodyWidget(context, ref),
      ),
    );
  }

  bodyWidget(BuildContext context, WidgetRef ref) {
    final authChangeProvider = ref.watch(authChangeNotifierProvider);
    final authProvider = ref.watch(authRepositoryProvider);
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
                      keyboardType: TextInputType.emailAddress,
                      initialValue: authChangeProvider.email,
                      onChanged: (value) => authChangeProvider.email = value,
                      validator: (value) => authChangeProvider.emailValidate(value!),
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Icon(
                            CupertinoIcons.mail_solid,
                            size: getDeviceType(context) == DeviceType.Tablet ? 45 : 20,
                          ),
                        ),
                        hintText: "Enter Email",
                        hintStyle: TextStyle(
                          fontSize: getDeviceType(context) == DeviceType.Tablet ? 45 : 18,
                        ),
                        labelStyle: TextStyle(
                          fontSize: getDeviceType(context) == DeviceType.Tablet ? 35 : 18,
                        ),
                        label: const Text("Enter Email"),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red[900]!),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: authChangeProvider.obscurePassword,
                      initialValue: authChangeProvider.password,
                      onChanged: (value) => authChangeProvider.password = value,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Icon(
                            CupertinoIcons.lock_fill,
                            size: getDeviceType(context) == DeviceType.Tablet ? 45 : 20,
                          ),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            authChangeProvider.obscurePassword = !authChangeProvider.obscurePassword;
                          },
                          icon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Icon(
                              authChangeProvider.obscurePassword ? CupertinoIcons.eye_slash_fill : CupertinoIcons.eye_fill,
                              size: getDeviceType(context) == DeviceType.Tablet ? 45 : 20,
                            ),
                          ),
                        ),
                        hintText: "Enter Password",
                        hintStyle: TextStyle(
                          fontSize: getDeviceType(context) == DeviceType.Tablet ? 45 : 18,
                        ),
                        labelStyle: TextStyle(
                          fontSize: getDeviceType(context) == DeviceType.Tablet ? 35 : 18,
                        ),
                        label: const Text("Enter Password"),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red[900]!),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Consumer(
                      builder: (BuildContext context, WidgetRef ref, Widget? child) {
                        return SizedBox(
                          height: getDeviceType(context) == DeviceType.Tablet ? 90 : 55,
                          width: ScreenSize.width(context),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.red[900]!),
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                try {
                                  await authProvider.loginUser(authChangeProvider.email, authChangeProvider.password);
                                  ref.read(activeGenreIndexProvider.notifier).state = 0;
                                  context.go(HomeScreen.route);
                                } catch (e) {
                                  AppUtility(context).error(e.toString());
                                }
                              }
                              // final loginResult = await ref.watch(loginProvider({
                              //   "username": userNameCont.text,
                              //   "password": passwordCont.text,
                              // }).future);

                              // final bool? status = loginResult;

                              // if (status == true) {
                              //   print("LOGIN STATUS: $status");
                              //   userNameCont.clear();
                              //   passwordCont.clear();
                              //   Navigator.of(context).pushReplacementNamed(HomePage.route);

                              //   final accountDetails = await ref.watch(accountDeatilsProvider.future);

                              //   await prefs!.setString("NAME", accountDetails!.name!);
                              //   await prefs!.setString("USERNAME", accountDetails.username!);
                              //   await prefs!.setInt("ACCOUNT_ID", accountDetails.id!);
                              // }
                            },
                            child: Text(
                              "LOGIN",
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w600,
                              ),
                              textScaler: TextScaler.linear(getDeviceType(context) == DeviceType.Tablet ? 2 : 1),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Consumer(
                      builder: (BuildContext context, WidgetRef ref, Widget? child) {
                        return SizedBox(
                          height: getDeviceType(context) == DeviceType.Tablet ? 90 : 55,
                          width: ScreenSize.width(context),
                          child: ElevatedButton.icon(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            onPressed: () async {
                              try {
                                await authProvider.loginWithGoogle();
                                ref.read(activeGenreIndexProvider.notifier).state = 0;
                                context.go(HomeScreen.route);
                              } catch (e) {
                                AppUtility(context).error(e.toString());
                              }
                            },
                            icon: Icon(
                              FontAwesomeIcons.google,
                              color: Colors.black,
                              size: getDeviceType(context) == DeviceType.Tablet ? 55 : 30,
                            ),
                            label: Text(
                              "Login with Google",
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w600,
                                // fontSize: 18,
                                color: Colors.black,
                              ),
                              textScaler: TextScaler.linear(getDeviceType(context) == DeviceType.Tablet ? 2 : 1),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        context.push(RegisterScreen.route);
                      },
                      child: Text(
                        "New User? Register",
                        textScaler: TextScaler.linear(getDeviceType(context) == DeviceType.Tablet ? 2 : 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (authChangeProvider.loading)
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
