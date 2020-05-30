
CREATE TABLE "Departments" (
"Id" SERIAL PRIMARY KEY,
"DepartmentName" TEXT,
"Building" TEXT
);

ALTER TABLE "Employees" ADD COLUMN "DepartmentId" INTEGER NULL REFERENCES "Departments" ("Id");

CREATE TABLE "Orders" (
"Id" SERIAL PRIMARY KEY,
"OrderNumber" TEXT,
"DatePlaced" DATE,
"Email" TEXT
);

CREATE TABLE "Products" (
"Id
"Price" DECIMAL(6, 2),
"Name" TEXT,
"Description" TEXT,
"QuantityInStock" INT
);

CREATE TABLE "ProductOrders" ("Id" SERIAL PRIMARY KEY, "OrderQuantity" INTEGER, "ProductId" INTEGER REFERENCES "Products" ("Id"), "OrderId" INTEGER REFERENCES "Orders" ("Id"));

INSERT INTO "Departments" ("DepartmentName", "Building") VALUES ('Development', 'Main');
INSERT INTO "Departments" ("DepartmentName", "Building") VALUES ('Marketing', 'North');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime", "DepartmentId") VALUES ('Tim Smith', 40000, 'Programmer', 123, 'false', 1);
INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime", "DepartmentId") VALUES ('Barbara Ramsey', 80000, 'Manager', 234, 'false', 2);
INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime", "DepartmentId") VALUES ('Tom Jones', 32000, 'Admin', 456, 'true', 2);

INSERT INTO "Products" ("Price", "Name", "Description", "QuantityInStock") VALUES (12.45, 'Widget', 'The Original Widget', 100);
INSERT INTO "Products" ("Price", "Name", "Description", "QuantityInStock") VALUES (99.99, 'Flowbee', 'Perfect for haircuts', 3);

INSERT INTO "Orders" ("OrderNumber", "DatePlaced", "Email") VALUES ('X529', '2020-01-01 16:55:00', 'person@example.com');

INSERT INTO "ProductOrders" ("OrderQuantity", "ProductId", "OrderId") VALUES (3, 1, 1);

INSERT INTO "ProductOrders" ("OrderQuantity", "ProductId", "OrderId") VALUES (2, 2, 1);

SELECT * FROM "Employees" WHERE "DepartmentId" = 2;

SELECT "Employees"."PhoneExtension" FROM "Employees" JOIN "Departments" ON "Employees"."DepartmentId" = "Departments"."Id" WHERE "Departments"."DepartmentName" = ('Marketing');

SELECT * FROM "ProductOrders" JOIN "Products" ON "ProductOrders"."Id" = "Products"."Id" WHERE "Products"."Id" = 2;

DELETE FROM "ProductOrders" USING "Products","Orders" WHERE "Products"."Name" = ('Flowbee') AND "Orders"."OrderNumber" = ('x529');




