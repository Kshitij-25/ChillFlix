import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tmdb_chillflix/presentation/change_notifier_providers/auth_change_notifier_provider.dart';

import '../../data/models/movie_details.dart';
import '../providers/firestore_service_provider.dart';

final myListProvider = StreamProvider<List<MovieDetails>>((ref) {
  final firestore = ref.watch(firestoreProvider);
  final auth = ref.watch(authChangeNotifierProvider);

  if (auth.user != null) {
    final userId = auth.user!.uid;
    return firestore
        .collection('users')
        .doc(userId)
        .collection('my_list')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => MovieDetails.fromJson(doc.data())).toList());
  } else {
    return Stream.value([]); // Return an empty list if user is not logged in
  }
});
