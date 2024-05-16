import 'package:table_order/services/repository/help_repo.dart';
import 'package:table_order/services/states/help_state.dart';

class HelpService {
  final HelpRepo helpRepo = HelpRepo();

  Future<void> load(int merchantId, int branchId) async {
    var helps = await helpRepo.fetchHelps(merchantId, branchId);
    HelpState.to.initHelps(helps);
  }
}
