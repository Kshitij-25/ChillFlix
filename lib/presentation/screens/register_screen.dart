import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/app_utility.dart';
import '../../common/screen_size.dart';
import '../change_notifier_providers/auth_change_notifier_provider.dart';
import '../providers/auth_provider.dart';
import 'initial_screen.dart';

class RegisterScreen extends ConsumerWidget {
  RegisterScreen({super.key});

  static const route = "/register";

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.red[900],
      resizeToAvoidBottomInset: false,
      body: bodyWidget(context, ref),
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
                      // controller: userNameCont,
                      keyboardType: TextInputType.emailAddress,
                      initialValue: authChangeProvider.email,
                      onChanged: (value) => authChangeProvider.email = value,
                      validator: (value) => authChangeProvider.emailValidate(value!),
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        prefixIcon: const Icon(CupertinoIcons.mail_solid),
                        hintText: "Enter Username",
                        label: const Text("Enter Username"),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red[900]!),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      // controller: userNameCont,
                      keyboardType: TextInputType.emailAddress,
                      initialValue: authChangeProvider.email,
                      onChanged: (value) => authChangeProvider.email = value,
                      validator: (value) => authChangeProvider.emailValidate(value!),
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        prefixIcon: const Icon(CupertinoIcons.mail_solid),
                        hintText: "Enter Email",
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
                      // controller: passwordCont,
                      obscureText: authChangeProvider.obscurePassword,
                      initialValue: authChangeProvider.password,
                      onChanged: (value) => authChangeProvider.password = value,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        prefixIcon: const Icon(CupertinoIcons.lock_fill),
                        suffixIcon: IconButton(
                          onPressed: () {
                            authChangeProvider.obscurePassword = !authChangeProvider.obscurePassword;
                          },
                          icon: Icon(authChangeProvider.obscurePassword ? CupertinoIcons.eye_slash_fill : CupertinoIcons.eye_fill),
                        ),
                        hintText: "Enter Password",
                        label: const Text("Enter Password"),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red[900]!),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      // controller: passwordCont,
                      obscureText: authChangeProvider.obscureConfirmPassword,
                      initialValue: authChangeProvider.password,
                      onChanged: (value) => authChangeProvider.password = value,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        prefixIcon: const Icon(CupertinoIcons.lock_fill),
                        suffixIcon: IconButton(
                          onPressed: () {
                            authChangeProvider.obscureConfirmPassword = !authChangeProvider.obscureConfirmPassword;
                          },
                          icon: Icon(authChangeProvider.obscureConfirmPassword ? CupertinoIcons.eye_slash_fill : CupertinoIcons.eye_fill),
                        ),
                        hintText: "Confirm Password",
                        label: const Text("Confirm Password"),
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
                                if (authChangeProvider.password == authChangeProvider.confirmPassword) {
                                  try {
                                    await authProvider.registerUser(authChangeProvider.email, authChangeProvider.password);
                                    context.go(InitialScreen.route);
                                  } catch (e) {
                                    AppUtility(context).error(e.toString());
                                  }
                                } else {
                                  AppUtility(context).error("Passwords dont match.");
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
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: const Text("Already Registered? Login"),
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
