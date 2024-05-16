import 'package:table_order/services/models/menu.dart';

class MenuRepo {
  Future<List<Menu>> fetchMenu(int merchantId, int branchId) async {
    return Future(() {
      return [
        Menu(
          id: 1,
          title: "치즈 피자",
          price: 24000,
          image:
              "https://as1.ftcdn.net/v2/jpg/06/36/30/26/1000_F_636302609_Tb1JtDTQ4zawO0ub6L2fHzlrW586f9tr.jpg",
          detailImages: [
            "https://as2.ftcdn.net/v2/jpg/06/17/65/93/1000_F_617659325_d63W96i2WMQiKQRSWgW4ctYLcQO3fgR5.webp",
            "https://as1.ftcdn.net/v2/jpg/06/36/30/26/1000_F_636302609_Tb1JtDTQ4zawO0ub6L2fHzlrW586f9tr.jpg",
          ],
          groups: [1, 3],
          badges: [],
        ),
        Menu(
          id: 2,
          title: "살라미 피자",
          price: 22000,
          image:
              "https://as1.ftcdn.net/v2/jpg/05/90/72/84/1000_F_590728471_7M3MKf85St0AAh1ZcrMxoLrJ6j9Mz2RE.webp",
          detailImages: [
            "https://as1.ftcdn.net/v2/jpg/05/90/72/84/1000_F_590728471_7M3MKf85St0AAh1ZcrMxoLrJ6j9Mz2RE.webp",
            "https://as1.ftcdn.net/v2/jpg/05/90/73/80/1000_F_590738098_7Q3nmGAqz71GDktNUPYTDrSp8aQ0WOTN.jpg",
          ],
          groups: [1, 3],
          badges: [],
        ),
        Menu(
          id: 3,
          title: "슈프림 피자",
          price: 23000,
          image:
              "https://as1.ftcdn.net/v2/jpg/00/27/57/96/1000_F_27579652_tM7V4fZBBw8RLmZo0Bi8WhtO2EosTRFD.jpg",
          detailImages: [
            "https://as1.ftcdn.net/v2/jpg/00/27/57/96/1000_F_27579652_tM7V4fZBBw8RLmZo0Bi8WhtO2EosTRFD.jpg",
            "https://as1.ftcdn.net/v2/jpg/00/27/57/96/1000_F_27579651_gdkklriEGgW6PZoIdNl3IV9u1UUa0PmW.jpg",
          ],
          groups: [1, 3],
          badges: [],
        ),
        Menu(
          id: 4,
          title: "시금치 살라미 피자",
          price: 21000,
          image:
              "https://as2.ftcdn.net/v2/jpg/03/01/81/93/1000_F_301819328_21gphVdXi9koPbtrC6uTcnPRoVJ2ZRkR.jpg",
          detailImages: [
            "https://as2.ftcdn.net/v2/jpg/03/01/81/93/1000_F_301819328_21gphVdXi9koPbtrC6uTcnPRoVJ2ZRkR.jpg",
          ],
          groups: [3],
          badges: [],
        ),
        Menu(
          id: 5,
          title: "베이컨 피자",
          price: 25000,
          image:
              "https://as1.ftcdn.net/v2/jpg/05/37/26/06/1000_F_537260629_218AGcZTPCVZfEE7wC4o1ftjxlt6bsMb.jpg",
          detailImages: [
            "https://as1.ftcdn.net/v2/jpg/05/37/26/06/1000_F_537260629_218AGcZTPCVZfEE7wC4o1ftjxlt6bsMb.jpg",
          ],
          groups: [3],
          badges: [],
        ),
      ];
    });
  }
}

/*
  final int id;
  final String title;
  final double price;
  final List<int> groups;
  final List<int> badges;
*/