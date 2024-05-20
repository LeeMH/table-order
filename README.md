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
# ITEM_GROUP TABLE
#########################
DROP TABLE ITEM_GROUP;
CREATE TABLE ITEM_GROUP (
    id INTEGER PRIMARY KEY,
    title TEXT,
    order_value INTEGER
);

insert into ITEM_GROUP(title, order_value) values 
('베스트', 10),
('세트', 20),
('피자', 30),
('샐러드', 40),
('사이드', 50),
('음료', 60);
```
