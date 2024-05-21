import 'package:table_order/controller/models/option.dart';
import 'package:table_order/controller/models/option_pick.dart';
import 'package:table_order/controller/repository/option_repo.dart';

class OptionController {
  final OptionRepo optionRepo = OptionRepo();

  Future<List<Option>> getOptionsByItemId(int itemId) async {
    return await optionRepo.getOptionsByItemId(itemId);
  }

  Future<List<OptionPick>> getOptionPickByItemId(int itemId) async {
    return await optionRepo.getOptionPickByItemId(itemId);
  }
}
