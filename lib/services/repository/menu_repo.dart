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
        Menu(
          id: 6,
          title: "양상추 샐러드",
          price: 9000,
          image:
              "https://as2.ftcdn.net/v2/jpg/04/56/12/45/1000_F_456124577_VpxxoqzHT9Xeao0NqwKZ4smrR5IR0byS.jpg",
          detailImages: [
            "https://as2.ftcdn.net/v2/jpg/04/56/12/45/1000_F_456124577_VpxxoqzHT9Xeao0NqwKZ4smrR5IR0byS.jpg",
          ],
          groups: [4, 1],
          badges: [],
        ),
        Menu(
          id: 7,
          title: "구운버섯 샐러드",
          price: 9900,
          image:
              "https://as2.ftcdn.net/v2/jpg/04/53/82/45/1000_F_453824582_jBJW586ONoFG2qGrHexViIVccOIbnNeO.jpg",
          detailImages: [
            "https://as2.ftcdn.net/v2/jpg/04/53/82/45/1000_F_453824582_jBJW586ONoFG2qGrHexViIVccOIbnNeO.jpg",
          ],
          groups: [4, 1],
          badges: [],
        ),
        Menu(
          id: 8,
          title: "닭가슴살 샐러드",
          price: 9900,
          image:
              "https://as1.ftcdn.net/v2/jpg/04/78/02/40/1000_F_478024052_1vSyf9TmIGozfdhtSW2jPA1vVc2CIYfx.jpg",
          detailImages: [
            "https://as1.ftcdn.net/v2/jpg/04/78/02/40/1000_F_478024052_1vSyf9TmIGozfdhtSW2jPA1vVc2CIYfx.jpg",
          ],
          groups: [4],
          badges: [],
        ),
        Menu(
          id: 8,
          title: "닭가슴살 샐러드",
          price: 9900,
          image:
              "https://as1.ftcdn.net/v2/jpg/04/78/02/40/1000_F_478024052_1vSyf9TmIGozfdhtSW2jPA1vVc2CIYfx.jpg",
          detailImages: [
            "https://as1.ftcdn.net/v2/jpg/04/78/02/40/1000_F_478024052_1vSyf9TmIGozfdhtSW2jPA1vVc2CIYfx.jpg",
          ],
          groups: [4],
          badges: [],
        ),
        Menu(
          id: 9,
          title: "복숭아 샐러드",
          price: 9900,
          image:
              "https://as1.ftcdn.net/v2/jpg/06/32/78/34/1000_F_632783459_Y9n9rB4dcgSSExAEQbK3AUoLE0pPVzWh.jpg",
          detailImages: [
            "https://as1.ftcdn.net/v2/jpg/06/32/78/34/1000_F_632783459_Y9n9rB4dcgSSExAEQbK3AUoLE0pPVzWh.jpg",
          ],
          groups: [4],
          badges: [],
        ),
        Menu(
          id: 10,
          title: "키위,수박 주스",
          price: 6500,
          image:
              "https://as2.ftcdn.net/v2/jpg/06/36/15/83/1000_F_636158356_hat2tFUbREbZpcJv5tDJDdlVdSaMDzN4.jpg",
          detailImages: [
            "https://as2.ftcdn.net/v2/jpg/06/36/15/83/1000_F_636158356_hat2tFUbREbZpcJv5tDJDdlVdSaMDzN4.jpg",
          ],
          groups: [6, 1],
          badges: [],
        ),
        Menu(
          id: 11,
          title: "모히또",
          price: 6500,
          image:
              "https://as2.ftcdn.net/v2/jpg/03/95/55/13/1000_F_395551392_pGrzghqiaJjTNBawtzQ7UUtR1lgUp9ZV.jpg",
          detailImages: [
            "https://as2.ftcdn.net/v2/jpg/03/95/55/13/1000_F_395551392_pGrzghqiaJjTNBawtzQ7UUtR1lgUp9ZV.jpg",
          ],
          groups: [6, 1],
          badges: [],
        ),
        Menu(
          id: 12,
          title: "콜라",
          price: 3000,
          image:
              "https://img.danawa.com/prod_img/500000/763/904/img/904763_1.jpg?_v=20200616095718",
          detailImages: [
            "https://img.danawa.com/prod_img/500000/763/904/img/904763_1.jpg?_v=20200616095718",
          ],
          groups: [6],
          badges: [],
        ),
        Menu(
          id: 13,
          title: "사이다",
          price: 3000,
          image: "http://www.sisacast.kr/news/photo/202001/31100_23529_419.jpg",
          detailImages: [
            "http://www.sisacast.kr/news/photo/202001/31100_23529_419.jpg",
          ],
          groups: [6],
          badges: [],
        ),
        Menu(
          id: 14,
          title: "맥주",
          price: 5000,
          image:
              "https://images.emarteveryday.co.kr/images/app/webapps/evd_web2/share/SKU/mall/24/10/8801858011024_1.png",
          detailImages: [
            "https://images.emarteveryday.co.kr/images/app/webapps/evd_web2/share/SKU/mall/24/10/8801858011024_1.png",
          ],
          groups: [6],
          badges: [],
        ),
        Menu(
          id: 15,
          title: "치즈스틱",
          price: 4000,
          image:
              "https://as2.ftcdn.net/v2/jpg/05/79/64/57/1000_F_579645795_yp7uX8yYYPvTvfSyGxwAXz5NYYfwJSDG.jpg",
          detailImages: [
            "https://as2.ftcdn.net/v2/jpg/05/79/64/57/1000_F_579645795_yp7uX8yYYPvTvfSyGxwAXz5NYYfwJSDG.jpg",
          ],
          groups: [5],
          badges: [],
        ),
        Menu(
          id: 16,
          title: "떡볶이",
          price: 4500,
          image:
              "https://as1.ftcdn.net/v2/jpg/04/63/65/98/1000_F_463659844_lwREXov1yPCOhappvbETB2H8Dm4YfLue.jpg",
          detailImages: [
            "https://as1.ftcdn.net/v2/jpg/04/63/65/98/1000_F_463659844_lwREXov1yPCOhappvbETB2H8Dm4YfLue.jpg",
          ],
          groups: [5],
          badges: [],
        ),
        Menu(
          id: 16,
          title: "버팔로 윙",
          price: 6000,
          image:
              "https://as1.ftcdn.net/v2/jpg/04/86/62/74/1000_F_486627491_WwpK6CVUywxN8WfhXXddNr9ROTVQnDJS.jpg",
          detailImages: [
            "https://as1.ftcdn.net/v2/jpg/04/86/62/74/1000_F_486627491_WwpK6CVUywxN8WfhXXddNr9ROTVQnDJS.jpg",
          ],
          groups: [5],
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