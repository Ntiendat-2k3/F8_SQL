CREATE TABLE "customers" (
  "customer_id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(20),
  "email" varchar(20),
  "phone" varchar(11),
  "created_at" timestamptz,
  "updated_at" timestamptz
);

CREATE TABLE "products" (
  "product_id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(10),
  "price" money,
  "created_at" timestamptz,
  "updated_at" timestamptz
);

CREATE TABLE "orders" (
  "order_id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "customer_id" int,
  "total_quantity" int,
  "total_price" int,
  "status" varchar(10),
  "order_time" timestamptz,
  "last_updated" timestamptz,
  "created_at" timestamptz,
  "updated_at" timestamptz
);

CREATE TABLE "order_details" (
  "order_detail_id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "order_id" int,
  "product_id" int,
  "quantity" int,
  "total_price" money
);

ALTER TABLE "orders" ADD FOREIGN KEY ("customer_id") REFERENCES "customers" ("customer_id");

ALTER TABLE "order_details" ADD FOREIGN KEY ("order_id") REFERENCES "orders" ("order_id");

ALTER TABLE "order_details" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("product_id");
