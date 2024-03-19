import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/auth_providers.dart';
import 'homepage.dart';
import 'login.dart';

class InitialScreen extends ConsumerWidget {
  const InitialScreen({super.key});

  static const route = "/";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProvider = ref.watch(authChangeProvider);
    return authProvider.user != null ? const HomePage() : LoginScreen();
  }
}
