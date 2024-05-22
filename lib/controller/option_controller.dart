import 'package:table_order/controller/models/option.dart';
import 'package:table_order/controller/models/option_group.dart';
import 'package:table_order/controller/repository/option_repo.dart';

class OptionController {
  final OptionRepo optionRepo = OptionRepo();

  Future<List<OptionGroup>> getOptionGroupsByItemId(int itemId) async {
    return await optionRepo.getOptionGroupsByItemId(itemId);
  }

  Future<List<Option>> getOptionsByItemId(int itemId) async {
    return await optionRepo.getOptionsByItemId(itemId);
  }
}
