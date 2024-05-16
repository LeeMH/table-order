import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:table_order/services/states/group_state.dart';

class MenuGroup extends StatelessWidget {
  const MenuGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [...getGroup()],
        ),
      ),
    );
  }

  List<Widget> getGroup() {
    return GroupState.to
        .getGroups()
        .map(
          (g) => Obx(() => buildGroupItem(g.id, g.title)),
        )
        .toList();
  }

  Widget buildGroupItem(int id, String title) {
    // 선택된 메뉴인가?
    bool selected = (GroupState.to.getSelectedGroupId() == id);

    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0, 10.0),
      child: GestureDetector(
        onTap: () {
          GroupState.to.updateSelectedGroup(id);
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            border: selected
                ? Border.all(
                    color: const Color.fromRGBO(239, 83, 80, 1), // 외곽선 색상
                    width: 2, // 외곽선 두께
                  )
                : null,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20), // 왼쪽 위를 둥글게
              bottomRight: Radius.circular(20), // 오른쪽 아래를 둥글게
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: selected ? FontWeight.bold : FontWeight.normal),
            ),
          ),
        ),
      ),
    );
  }

/*
  Widget buildMenuLine() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      height: 1,
      child: Container(
        color: Colors.black54,
      ),
    );
  }
  */
}
