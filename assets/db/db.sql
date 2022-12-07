
CREATE TABLE Assets
(
);

CREATE TABLE CustomersTypes
(
  id   INT     NOT NULL UNIQUE,
  name VARCHAR NOT NULL UNIQUE,
  PRIMARY KEY (id AUTOINCREMENT)
);

CREATE TABLE EmployeeTypes
(
  id   INT     NOT NULL UNIQUE,
  name VARCHAR NOT NULL UNIQUE,
  PRIMARY KEY (id AUTOINCREMENT)
);

CREATE TABLE IncomesTypes
(
  id   INT     NOT NULL UNIQUE,
  name VARCHAR NOT NULL UNIQUE,
  PRIMARY KEY (id AUTOINCREMENT)
);

CREATE TABLE PaymentsTypes
(
  id   INT     NOT NULL UNIQUE,
  name VARCHAR NOT NULL UNIQUE,
  PRIMARY KEY (id AUTOINCREMENT)
);

CREATE TABLE Products
(
  id          INT  NOT NULL UNIQUE,
  name        VARC NOT NULL UNIQUE,
  quantity    INT  NOT NULL,
  description TEXT NULL    ,
  PRIMARY KEY (id AUTOINCREMENT)
);

CREATE TABLE Suppliers
(
  id           INT      NOT NULL UNIQUE,
  name         VARCHAR  NOT NULL,
  phone_number CHAR(11) NULL     UNIQUE,
  address      TEXT     NULL    ,
  notes        TEXT     NULL    ,
  PRIMARY KEY (id AUTOINCREMENT)
);

CREATE TABLE Employees
(
  id       INT     NOT NULL UNIQUE,
  name     VARCHAR NOT NULL,
  salary   INT     NULL    ,
  is_admin BOOL    NOT NULL,
  notes    TEXT    NULL    ,
  type_id  INT     NOT NULL,
  PRIMARY KEY (id AUTOINCREMENT),
  FOREIGN KEY (type_id) REFERENCES EmployeeTypes (id)
);

CREATE TABLE Customers
(
  id           INT      NOT NULL UNIQUE,
  name         VARCHAR  NOT NULL,
  phone_number CHAR(11) NULL     UNIQUE,
  notes        TEXT     NULL    ,
  type_id      INT      NOT NULL,
  PRIMARY KEY (id AUTOINCREMENT),
  FOREIGN KEY (type_id) REFERENCES CustomersTypes (id)
);

CREATE TABLE Materials
(
  id          INT     NOT NULL UNIQUE,
  name        VARCHAR NOT NULL UNIQUE,
  quantity    FLOAT   NOT NULL,
  measurement VARCHAR NULL     DEFAULT KG,
  notes       TEXT    NULL    ,
  supplier_id INT     NOT NULL,
  PRIMARY KEY (id AUTOINCREMENT),
  FOREIGN KEY (supplier_id) REFERENCES Suppliers (id)
);

CREATE TABLE Bills
(
  id          INT  NOT NULL UNIQUE,
  payment_id  INT  NULL    ,
  income_id   INT  NULL    ,
  material_id INT  NULL    ,
  product_id  INT  NULL    ,
  is_payment  BOOL NOT NULL,
  PRIMARY KEY (id AUTOINCREMENT),
  FOREIGN KEY (payment_id) REFERENCES Payments (id),
  FOREIGN KEY (income_id) REFERENCES Incomes (id),
  FOREIGN KEY (material_id) REFERENCES Materials (id),
  FOREIGN KEY (product_id) REFERENCES Products (id)
);

CREATE TABLE Payments
(
  id              INT      NOT NULL UNIQUE,
  date            DATETIME NOT NULL,
  money           FLOAT    NOT NULL,
  is_for_employee BOOL     NOT NULL,
  is_for_supplier BOOL     NOT NULL,
  notes           TEXT     NULL    ,
  employee_id     INT      NOT NULL,
  sec_employee_id INT      NULL    ,
  supplier_id     INT      NULL    ,
  type_id         INT      NOT NULL,
  PRIMARY KEY (id AUTOINCREMENT),
  FOREIGN KEY (sec_employee_id) REFERENCES Employees (id),
  FOREIGN KEY (supplier_id) REFERENCES Suppliers (id),
  FOREIGN KEY (type_id) REFERENCES PaymentsTypes (id),
  FOREIGN KEY (employee_id) REFERENCES Employees (id)
);

CREATE TABLE Incomes
(
  id               INT      NOT NULL UNIQUE,
  date             DATETIME NOT NULL,
  money            FLOAT    NOT NULL,
  notes            TEXT     NULL    ,
  is_from_employee          NULL    ,
  employee_id      INT      NOT NULL,
  customer_id      INT      NOT NULL,
  type_id          INT      NOT NULL,
  sec_employee_id  INT      NULL    ,
  PRIMARY KEY (id AUTOINCREMENT),
  FOREIGN KEY (employee_id) REFERENCES Employees (id),
  FOREIGN KEY (customer_id) REFERENCES Customers (id),
  FOREIGN KEY (type_id) REFERENCES IncomesTypes (id),
  FOREIGN KEY (sec_employee_id) REFERENCES Employees (id)
);

CREATE TABLE Prices
(
  id          INT      NOT NULL UNIQUE,
  product_id  INT      NULL    ,
  material_id INT      NULL    ,
  date        DATETIME NOT NULL,
  price       FLOAT    NOT NULL,
  PRIMARY KEY (id AUTOINCREMENT),
  FOREIGN KEY (product_id) REFERENCES Products (id),
  FOREIGN KEY (material_id) REFERENCES Materials (id)
);

-- Don't forget to add price depends on  quantity.
CREATE TABLE ProductsRecipes
(
  id          INT   NOT NULL UNIQUE,
  material_id INT   NOT NULL,
  product_id  INT   NOT NULL,
  quantity    FLOAT NOT NULL,
  PRIMARY KEY (id AUTOINCREMENT),
  FOREIGN KEY (product_id) REFERENCES Products (id),
  FOREIGN KEY (material_id) REFERENCES Materials (id)
);
