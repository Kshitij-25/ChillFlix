import 'package:chillflix2/data/models/account_details.dart';
import 'package:chillflix2/data/sources/account_data_source.dart';

class AccountRepository {
  AccountRepository(this._accountDataSource);

  final AccountDataSource _accountDataSource;

  Future<AccountDetails?> getAccountDetails() async {
    return _accountDataSource.getAccountDetails();
  }
}
