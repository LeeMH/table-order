# table_order

A new Flutter project.

## Getting Started

This project is for simple & free table order app.


## Model Object build

```bash
dart run build_runner build
```

## Model file

```sql
#########################
# GROUPS TABLE
#########################
DROP TABLE GROUPS;
CREATE TABLE GROUPS (
    id INTEGER PRIMARY KEY,
    title TEXT,
    order_value INTEGER
);

INSERT INTO GROUPS(title, order_value) VALUES
('베스트', 1),
('세트', 2),
('피자', 3),
('샐러드', 4),
('사이드', 5),
('음료', 6);


#########################
# ITEMS TABLE
#########################
DROP TABLE ITEMS;
CREATE TABLE ITEMS (
    id INTEGER PRIMARY KEY,
    title TEXT,  
    price INTEGER,
    image TEXT,
    detail_images TEXT,
    description TEXT,
    max_order_count INTEGER,
    ref_code TEXT,
    order_value INTEGER
);

INSERT INTO ITEMS(id, title, price, image, detail_images, description, max_order_count) VALUES 
(1, '치즈 피자', 24000, 'https://as1.ftcdn.net/v2/jpg/06/36/30/26/1000_F_636302609_Tb1JtDTQ4zawO0ub6L2fHzlrW586f9tr.jpg','https://as2.ftcdn.net/v2/jpg/06/17/65/93/1000_F_617659325_d63W96i2WMQiKQRSWgW4ctYLcQO3fgR5.webp,https://as1.ftcdn.net/v2/jpg/06/36/30/26/1000_F_636302609_Tb1JtDTQ4zawO0ub6L2fHzlrW586f9tr.jpg','치즈 피자는 치즈가 많이 들어간 피자입니다.<br>치즈가 많이 들어가서 맛있습니다.<br>아이들이 정말 좋아하는 치즈 피자 입니다.', 1);
INSERT INTO ITEMS(id, title, price, image, detail_images, description, max_order_count) VALUES 
(2, '살라미 피자', 22000, 'https://as1.ftcdn.net/v2/jpg/05/90/72/84/1000_F_590728471_7M3MKf85St0AAh1ZcrMxoLrJ6j9Mz2RE.webp','https://as1.ftcdn.net/v2/jpg/05/90/72/84/1000_F_590728471_7M3MKf85St0AAh1ZcrMxoLrJ6j9Mz2RE.webp,https://as1.ftcdn.net/v2/jpg/05/90/73/80/1000_F_590738098_7Q3nmGAqz71GDktNUPYTDrSp8aQ0WOTN.jpg', '살라미 피자는 살라미가 많이 들어간 피자입니다.<br>살라미가 많이 들어가서 맛있습니다.<br>아이들이 정말 좋아하는 살라미 피자 입니다.',1);
INSERT INTO ITEMS(id, title, price, image, detail_images, description, max_order_count) VALUES 
(3, '슈프림 피자', 23000, 'https://as1.ftcdn.net/v2/jpg/00/27/57/96/1000_F_27579652_tM7V4fZBBw8RLmZo0Bi8WhtO2EosTRFD.jpg',        'https://as1.ftcdn.net/v2/jpg/00/27/57/96/1000_F_27579652_tM7V4fZBBw8RLmZo0Bi8WhtO2EosTRFD.jpg,https://as1.ftcdn.net/v2/jpg/00/27/57/96/1000_F_27579651_gdkklriEGgW6PZoIdNl3IV9u1UUa0PmW.jpg','슈프림 피자는 슈프림이 많이 들어간 피자입니다.<br>슈프림이 많이 들어가서 맛있습니다.<br>아이들이 정말 좋아하는 슈프림 피자 입니다.',1);
INSERT INTO ITEMS(id, title, price, image, detail_images, description, max_order_count) VALUES 
(4,'시금치 살라미 피자', 21000,'https://as2.ftcdn.net/v2/jpg/03/01/81/93/1000_F_301819328_21gphVdXi9koPbtrC6uTcnPRoVJ2ZRkR.jpg','https://as2.ftcdn.net/v2/jpg/03/01/81/93/1000_F_301819328_21gphVdXi9koPbtrC6uTcnPRoVJ2ZRkR.jpg', '시금치 살라미 피자는 시금치와 살라미가 많이 들어간 피자입니다.<br>시금치와 살라미가 많이 들어가서 맛있습니다.<br>아이들이 정말 좋아하는 시금치 살라미 피자 입니다.',1);
INSERT INTO ITEMS(id, title, price, image, detail_images, description, max_order_count) VALUES 
(5, '베이컨 피자',25000, 'https://as1.ftcdn.net/v2/jpg/05/37/26/06/1000_F_537260629_218AGcZTPCVZfEE7wC4o1ftjxlt6bsMb.jpg','https://as1.ftcdn.net/v2/jpg/05/37/26/06/1000_F_537260629_218AGcZTPCVZfEE7wC4o1ftjxlt6bsMb.jpg', '베이컨 피자는 베이컨이 많이 들어간 피자입니다.<br>베이컨이 많이 들어가서 맛있습니다.<br>아이들이 정말 좋아하는 베이컨 피자 입니다.', 1);
INSERT INTO ITEMS(id, title, price, image, detail_images, description, max_order_count) VALUES 
(6, '양상추 샐러드',9000,'https://as2.ftcdn.net/v2/jpg/04/56/12/45/1000_F_456124577_VpxxoqzHT9Xeao0NqwKZ4smrR5IR0byS.jpg','https://as2.ftcdn.net/v2/jpg/04/56/12/45/1000_F_456124577_VpxxoqzHT9Xeao0NqwKZ4smrR5IR0byS.jpg','양상추 샐러드는 양상추가 많이 들어간 샐러드입니다.<br>양상추가 많이 들어가서 맛있습니다.<br>아이들이 정말 좋아하는 양상추 샐러드 입니다.', 1);
INSERT INTO ITEMS(id, title, price, image, detail_images, description, max_order_count) VALUES 
(7,'구운버섯 샐러드',9900,'https://as2.ftcdn.net/v2/jpg/04/53/82/45/1000_F_453824582_jBJW586ONoFG2qGrHexViIVccOIbnNeO.jpg','https://as2.ftcdn.net/v2/jpg/04/53/82/45/1000_F_453824582_jBJW586ONoFG2qGrHexViIVccOIbnNeO.jpg','구운버섯 샐러드는 구운버섯이 많이 들어간 샐러드입니다.<br>구운버섯이 많이 들어가서 맛있습니다.<br>아이들이 정말 좋아하는 구운버섯 샐러드 입니다.',1);
INSERT INTO ITEMS(id, title, price, image, detail_images, description, max_order_count) VALUES 
(8,'닭가슴살 샐러드',9900,'https://as1.ftcdn.net/v2/jpg/04/78/02/40/1000_F_478024052_1vSyf9TmIGozfdhtSW2jPA1vVc2CIYfx.jpg','https://as1.ftcdn.net/v2/jpg/04/78/02/40/1000_F_478024052_1vSyf9TmIGozfdhtSW2jPA1vVc2CIYfx.jpg','닭가슴살 샐러드는 닭가슴살이 많이 들어간 샐러드입니다.<br>닭가슴살이 많이 들어가서 맛있습니다.<br>아이들이 정말 좋아하는 닭가슴살 샐러드 입니다.',1);
INSERT INTO ITEMS(id, title, price, image, detail_images, description, max_order_count) VALUES 
(9,'복숭아 샐러드',9900,'https://as1.ftcdn.net/v2/jpg/06/32/78/34/1000_F_632783459_Y9n9rB4dcgSSExAEQbK3AUoLE0pPVzWh.jpg','https://as1.ftcdn.net/v2/jpg/06/32/78/34/1000_F_632783459_Y9n9rB4dcgSSExAEQbK3AUoLE0pPVzWh.jpg','복숭아 샐러드는 복숭아가 많이 들어간 샐러드입니다.<br>복숭아가 많이 들어가서 맛있습니다.<br>아이들이 정말 좋아하는 복숭아 샐러드 입니다.',1);
INSERT INTO ITEMS(id, title, price, image, detail_images, description, max_order_count) VALUES 
(10,'키위,수박 주스',6500,'https://as2.ftcdn.net/v2/jpg/06/36/15/83/1000_F_636158356_hat2tFUbREbZpcJv5tDJDdlVdSaMDzN4.jpg','https://as2.ftcdn.net/v2/jpg/06/36/15/83/1000_F_636158356_hat2tFUbREbZpcJv5tDJDdlVdSaMDzN4.jpg','키위,수박 주스는 키위와 수박이 많이 들어간 주스입니다.<br>키위와 수박이 많이 들어가서 맛있습니다.<br>아이들이 정말 좋아하는 키위,수박 주스 입니다.',9);
INSERT INTO ITEMS(id, title, price, image, detail_images, description, max_order_count) VALUES 
(11,'모히또',6500,'https://as2.ftcdn.net/v2/jpg/03/95/55/13/1000_F_395551392_pGrzghqiaJjTNBawtzQ7UUtR1lgUp9ZV.jpg','https://as2.ftcdn.net/v2/jpg/03/95/55/13/1000_F_395551392_pGrzghqiaJjTNBawtzQ7UUtR1lgUp9ZV.jpg','모히또는 라임이 많이 들어간 칵테일입니다.<br>라임이 많이 들어가서 맛있습니다.<br>아이들이 정말 좋아하는 모히또 입니다.',9);
INSERT INTO ITEMS(id, title, price, image, detail_images, description, max_order_count) VALUES 
(12,'콜라',3000,'https://img.danawa.com/prod_img/500000/763/904/img/904763_1.jpg?_v=20200616095718','https://img.danawa.com/prod_img/500000/763/904/img/904763_1.jpg?_v=20200616095718','',9);
INSERT INTO ITEMS(id, title, price, image, detail_images, description, max_order_count) VALUES 
(13,'사이다',3000,'http://www.sisacast.kr/news/photo/202001/31100_23529_419.jpg','http://www.sisacast.kr/news/photo/202001/31100_23529_419.jpg','',9);
INSERT INTO ITEMS(id, title, price, image, detail_images, description, max_order_count) VALUES 
(14,'맥주',5000,'https://images.emarteveryday.co.kr/images/app/webapps/evd_web2/share/SKU/mall/24/10/8801858011024_1.png','https://images.emarteveryday.co.kr/images/app/webapps/evd_web2/share/SKU/mall/24/10/8801858011024_1.png','',9);
INSERT INTO ITEMS(id, title, price, image, detail_images, description, max_order_count) VALUES 
(15,'치즈스틱',4000,'https://as2.ftcdn.net/v2/jpg/05/79/64/57/1000_F_579645795_yp7uX8yYYPvTvfSyGxwAXz5NYYfwJSDG.jpg','https://as2.ftcdn.net/v2/jpg/05/79/64/57/1000_F_579645795_yp7uX8yYYPvTvfSyGxwAXz5NYYfwJSDG.jpg','',9);
INSERT INTO ITEMS(id, title, price, image, detail_images, description, max_order_count) VALUES 
(16,'떡볶이',4500,'https://as1.ftcdn.net/v2/jpg/04/63/65/98/1000_F_463659844_lwREXov1yPCOhappvbETB2H8Dm4YfLue.jpg','https://as1.ftcdn.net/v2/jpg/04/63/65/98/1000_F_463659844_lwREXov1yPCOhappvbETB2H8Dm4YfLue.jpg','매콤 달콤 떡볶이',9);
INSERT INTO ITEMS(id, title, price, image, detail_images, description, max_order_count) VALUES 
(17,'버팔로 윙',6000,'https://as1.ftcdn.net/v2/jpg/04/86/62/74/1000_F_486627491_WwpK6CVUywxN8WfhXXddNr9ROTVQnDJS.jpg','https://as1.ftcdn.net/v2/jpg/04/86/62/74/1000_F_486627491_WwpK6CVUywxN8WfhXXddNr9ROTVQnDJS.jpg','매콤한 버팔로 윙',9);

#########################
# GROUP_ITEM TABLE
#########################
DROP TABLE GROUP_ITEM;
CREATE TABLE GROUP_ITEM (
    group_id INTEGER,
    item_id INTEGER,
    PRIMARY KEY (group_id, item_id)
);

INSERT INTO GROUP_ITEM VALUES
(1, 1),(3, 1),(1, 2),(3, 2),(1, 3),(3, 3),(3, 4),(3, 5),(1, 6),
(4, 6),(1, 7),(4, 7),(4, 8),(4, 9),(1, 10),(6, 10),(1, 11),(6, 11),
(6, 12),(6, 13),(6, 14),(5, 15),(5, 16),(5, 17);

#########################
# OPTIONS TABLE
#########################
DROP TABLE OPTIONS;
CREATE TABLE OPTIONS (
    id INTEGER PRIMARY KEY,
    title TEXT,
    min_pick INTEGER,
    max_pick INTEGER,
    order_value INTEGER
);
INSERT INTO OPTIONS(id, title, min_pick, max_pick) VALUES
(1, '사이즈', 1, 1),
(2, '토핑', 1, 3),
(3, '얼음', 1, 1),
(4, '맵기', 1, 1),
(5, '제공 사이드', 1, 3);

#########################
# OPTION_PICK TABLE
#########################
DROP TABLE OPTION_PICK;
CREATE TABLE OPTION_PICK (
    id INTEGER PRIMARY KEY,
    option_id INTEGER,
    title TEXT,
    price INTEGER,
    default_pick INTEGER,    
    order_value INTEGER
);
CREATE INDEX IDX1 ON OPTION_PICK (option_id);

INSERT INTO OPTION_PICK(id, option_id, title, price, default_pick) VALUES
(1, 1, 'Small', 0, 1),
(2, 1, 'Medium', 2000, 0),
(3, 1, 'Large', 3000, 0),
(4, 2, '선택안함', 0, 1),
(5, 2, '치즈', 1000, 0),
(6, 2, '버섯', 1000, 0),
(7, 2, '올리브', 500, 0),
(8, 2, '소시지', 1500, 0),
(9, 2, '야채', 1200, 0),
(10, 3, '선택안함', 0, 1),
(11, 3, '선택', 0, 0),
(12, 4, '보통', 0, 1),
(13, 4, '매콤한맛', 0, 0),
(14, 4, '매운맛', 0, 0),
(15, 5, '단무지', 0, 1),
(16, 5, '피클', 0, 0),
(17, 5, '할리피뇨', 0, 0);

#########################
# ITEM_OPTION TABLE
#########################
DROP TABLE ITEM_OPTION;
CREATE TABLE ITEM_OPTION (
    item_id INTEGER,
    option_id INTEGER,
    PRIMARY KEY (item_id, option_id)
);

INSERT INTO ITEM_OPTION VALUES
(1, 1),(1, 2),(1, 5),(2, 1),(2, 2),(2, 5),(3, 1),(3, 2),
(3, 5),(4, 1),(4, 2),(4, 5),(5, 1),(5, 2),(5, 5),(10, 3),
(11, 3),(12, 3),(13, 3),(16, 4);
```
