import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_order/controller/group_controller.dart';
import 'package:table_order/controller/item_controller.dart';
import 'package:table_order/controller/models/menu.dart';
import 'package:table_order/util.dart';

class MenuList extends StatelessWidget {
  const MenuList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var items = ItemController.to
          .getItemsBySelectedGroupId(GroupController.to.getSelectedGroupId());

      return Container(
        color: Colors.white70,
        child: GridView.builder(
          itemCount: items.length, // 총 목록의 수
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 행에 표시될 위젯 수
            crossAxisSpacing: 10.0, // 가로 간격
            mainAxisSpacing: 10.0, // 세로 간격
          ),
          itemBuilder: (context, index) {
            // 각 목록 아이템 생성
            return buildMenu(items[index]);
          },
        ),
      );
    });
  }

  Widget buildMenu(Item item) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          ItemController.to.updateSelectedItem(item.id);
        },
        child: Container(
          //color: Colors.red,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 8,
                child: ClipPath(
                  clipper: CustomImageClipper(),
                  child: Image(image: NetworkImage(item.image)),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Text(
                    item.title,
                    style: TextStyle(fontSize: 20),
                  )),
              Expanded(
                  flex: 1, child: Text(Util.formatNumber(item.price.toInt()))),
            ],
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

class CustomImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width - 50, size.height);
    path.lineTo(size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
