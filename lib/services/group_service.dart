import 'package:table_order/services/models/group.dart';
import 'package:table_order/services/repository/group_repo.dart';
import 'package:table_order/services/states/group_state.dart';

class GroupService {
  final GroupRepo groupRepo = GroupRepo();

  Future<void> load(int merchantId, int branchId) async {
    var groups = await groupRepo.fetchGroups(merchantId, branchId);
    GroupState.to.initGroups(groups);
  }
}
