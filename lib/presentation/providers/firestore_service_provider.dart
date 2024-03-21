import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/firebase_db/firestore_service.dart';

final firestoreProvider = Provider((ref) => FirebaseFirestore.instance);

final firestoreServiceProvider = Provider((ref) => FirestoreService());
