import 'package:table_order/services/repository/menu_repo.dart';
import 'package:table_order/services/states/menu_state.dart';

class MenuService {
  final MenuRepo menuRepo = MenuRepo();

  Future<void> load(int merchantId, int branchId) async {
    var menu = await menuRepo.fetchMenu(merchantId, branchId);
    MenuState.to.initMenu(menu);
  }
}
