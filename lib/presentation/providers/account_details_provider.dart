import 'package:chillflix2/core/usecases/account_usecase.dart';
import 'package:chillflix2/data/models/account_details.dart';
import 'package:chillflix2/data/repositories/account_repo.dart';
import 'package:chillflix2/data/sources/account_data_source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final accountDataSourceProvider = Provider<AccountDataSource>((ref) {
  return AccountDataSource();
});

final accountRepositoryProvider = Provider<AccountRepository>((ref) {
  final accountDataSource = ref.read(accountDataSourceProvider);
  return AccountRepository(accountDataSource);
});

final accountUseCaseProvider = FutureProvider<AccountUseCase>((ref) {
  final accountRepository = ref.read(accountRepositoryProvider);
  return AccountUseCaseImpl(accountRepository);
});

final accountDeatilsProvider = FutureProvider<AccountDetails?>((ref) async {
  final accountUseCase = await ref.read(accountUseCaseProvider.future);
  return accountUseCase.getAccountDetails();
});
