import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../change_notifier_providers/auth_change_notifier_provider.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class InitialScreen extends ConsumerWidget {
  const InitialScreen({super.key});

  static const route = "/";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authChangeProvider = ref.watch(authChangeNotifierProvider);
    return authChangeProvider.user != null ? const HomeScreen() : LoginScreen();
  }
}
