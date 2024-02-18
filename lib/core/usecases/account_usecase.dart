import 'package:chillflix2/data/models/account_details.dart';
import 'package:chillflix2/data/repositories/account_repo.dart';

import '../../main.dart';
import '../error/failure.dart';

abstract class AccountUseCase {
  Future<AccountDetails?> getAccountDetails();
}

class AccountUseCaseImpl implements AccountUseCase {
  AccountUseCaseImpl(this._accountRepository);

  final AccountRepository _accountRepository;

  @override
  Future<AccountDetails?> getAccountDetails() async {
    try {
      return _accountRepository.getAccountDetails();
    } catch (e) {
      if (e is ServerFailure) {
        throw ServerFailure(serverFailureMessage: e.message);
      } else if (e is NetworkFailure) {
        throw NetworkFailure(networkFailureMessage: e.message);
      } else {
        logger.e('SearchUseCase - multiSearch : $e');
      }
    }
    return null;
  }
}
