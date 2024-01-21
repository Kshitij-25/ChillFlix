import 'package:chillflix2/presentation/providers/movies_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/big_poster_widget.dart';

class DetailsScreen extends ConsumerWidget {
  const DetailsScreen({super.key});

  static const route = "/detailsScreen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: bodyWidget(context, ref),
    );
  }

  bodyWidget(BuildContext context, WidgetRef ref) {
    final id = ModalRoute.of(context)!.settings.arguments as int;
    final dataAsyncValue = ref.watch(moviesDetails(id));
    return BigPosterWidget(dataAsyncValue: dataAsyncValue);
  }
}
