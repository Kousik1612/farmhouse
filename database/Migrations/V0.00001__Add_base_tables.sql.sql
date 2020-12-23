CREATE TABLE "vegetables" (
  "id" SERIAL PRIMARY KEY,
  "full_name" varchar,
  "price" int,
  "quantity" int,
  "discount" int
);

CREATE TABLE "customer" (
  "id" int PRIMARY KEY,
  "user_id" varchar,
  "mobile_number" varchar
);

CREATE TABLE "payment" (
  "id" int PRIMARY KEY,
  "bank_id" int,
  "account_number" varchar,
  "expiry_date" varchar,
  "is_active" boolean,
  "customer_id" int,
  "card_type" varchar,
  "bank_discount" int
);

CREATE TABLE "purchase" (
  "id" int PRIMARY KEY,
  "customer_id" int,
  "items" jsonb,
  "actual_price" int,
  "payment_mode_id" int,
  "final_price" int
);

ALTER TABLE "payment" ADD FOREIGN KEY ("customer_id") REFERENCES "vegetables" ("id");

ALTER TABLE "purchase" ADD FOREIGN KEY ("customer_id") REFERENCES "payment" ("customer_id");

ALTER TABLE "payment" ADD FOREIGN KEY ("customer_id") REFERENCES "customer" ("id");
