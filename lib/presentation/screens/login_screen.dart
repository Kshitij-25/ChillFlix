// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/app_utility.dart';
import '../../common/device_type.dart';
import '../../common/screen_size.dart';
import '../change_notifier_providers/auth_change_notifier_provider.dart';
import '../providers/auth_provider.dart';
import '../providers/genre_provider.dart';
import 'home_screen.dart';
import 'register_screen.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  static const route = "/loginScreen";

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: bodyWidget(context, ref),
      ),
    );
  }

  bodyWidget(BuildContext context, WidgetRef ref) {
    final authChangeProvider = ref.watch(authChangeNotifierProvider);
    final authProvider = ref.watch(authRepositoryProvider);
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const Icon(
                  CupertinoIcons.videocam_fill,
                  size: 100,
                ),
                const SizedBox(height: 50),
                Text(
                  "Welcome back you've been missed!",
                  style: GoogleFonts.raleway(
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
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
                    filled: true,
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
                    filled: true,
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
                const SizedBox(height: 50),
                Consumer(
                  builder: (BuildContext context, WidgetRef ref, Widget? child) {
                    return SizedBox(
                      height: getDeviceType(context) == DeviceType.Tablet ? 90 : 60,
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
                        },
                        child: Text(
                          "LOGIN",
                          style: GoogleFonts.raleway(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          textScaler: TextScaler.linear(getDeviceType(context) == DeviceType.Tablet ? 2 : 1),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 50),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Or continue with",
                        style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Expanded(
                      child: Divider(),
                    )
                  ],
                ),
                const SizedBox(height: 50),
                Consumer(
                  builder: (BuildContext context, WidgetRef ref, Widget? child) {
                    return SizedBox(
                      height: getDeviceType(context) == DeviceType.Tablet ? 90 : 60,
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
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          textScaler: TextScaler.linear(getDeviceType(context) == DeviceType.Tablet ? 2 : 1),
                        ),
                      ),
                    );
                  },
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member?',
                        style: GoogleFonts.raleway(),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () => context.push(RegisterScreen.route),
                        child: Text(
                          'Register now',
                          style: GoogleFonts.raleway(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
