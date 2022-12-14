const List<String> sqlCreateDataBase = [
  '''
CREATE TABLE CustomersTypes
(
  _id   INTEGER NOT NULL UNIQUE,
  name VARCHAR NOT NULL UNIQUE,
  PRIMARY KEY (_id AUTOINCREMENT)
);
''',
  '''
CREATE TABLE EmployeeTypes
(
  _id   INTEGER NOT NULL UNIQUE,
  name VARCHAR NOT NULL UNIQUE,
  PRIMARY KEY (_id AUTOINCREMENT)
);
''',
  '''
CREATE TABLE IncomesTypes
(
  _id   INTEGER NOT NULL UNIQUE,
  name VARCHAR NOT NULL UNIQUE,
  PRIMARY KEY (_id AUTOINCREMENT)
);
''',
  '''
CREATE TABLE PaymentsTypes
(
  _id   INTEGER NOT NULL UNIQUE,
  name VARCHAR NOT NULL UNIQUE,
  PRIMARY KEY (_id AUTOINCREMENT)
);
''',
  '''
CREATE TABLE Products
(
  _id          INTEGER NOT NULL UNIQUE,
  name         VARCHAR    NOT NULL UNIQUE,
  notes        TEXT    NULL    ,
  PRIMARY KEY (_id AUTOINCREMENT)
);
''',
  '''
CREATE TABLE Suppliers
(
  _id           INTEGER  NOT NULL UNIQUE,
  name         VARCHAR  NOT NULL,
  phone_number CHAR(11) NULL     UNIQUE,
  address      TEXT     NULL    ,
  notes        TEXT     NULL    ,
  PRIMARY KEY (_id AUTOINCREMENT)
);
''',
  '''
CREATE TABLE Employees
(
  _id       INTEGER NOT NULL UNIQUE,
  name     VARCHAR NOT NULL,
  salary   INT     NULL    ,
  is_admin BOOL    NOT NULL,
  notes    TEXT    NULL    ,
  type_id  INTEGER NOT NULL,
  PRIMARY KEY (_id AUTOINCREMENT),
  FOREIGN KEY (type_id) REFERENCES EmployeeTypes (_id)
);
''',
  '''
CREATE TABLE Customers
(
  _id           INTEGER  NOT NULL UNIQUE,
  name         VARCHAR  NOT NULL,
  phone_number CHAR(11) NULL     UNIQUE,
  notes        TEXT     NULL    ,
  type_id      INTEGER  NOT NULL,
  PRIMARY KEY (_id AUTOINCREMENT),
  FOREIGN KEY (type_id) REFERENCES CustomersTypes (_id)
);
''',
  '''
CREATE TABLE Materials
(
  _id          INTEGER NOT NULL UNIQUE,
  name        VARCHAR NOT NULL UNIQUE,
  quantity    FLOAT   NOT NULL,
  measurement VARCHAR NULL     DEFAULT KG,
  notes       TEXT    NULL    ,
  supplier_id INTEGER NULL,
  PRIMARY KEY (_id AUTOINCREMENT),
  FOREIGN KEY (supplier_id) REFERENCES Suppliers (_id)
);
''',
  '''
CREATE TABLE Bills
(
  _id          INTEGER NOT NULL UNIQUE,
  payment_id  INTEGER NULL    ,
  income_id   INTEGER NULL    ,
  material_id INTEGER NULL    ,
  product_id  INTEGER NULL    ,
  is_payment  BOOL    NOT NULL,
  PRIMARY KEY (_id AUTOINCREMENT),
  FOREIGN KEY (payment_id) REFERENCES Payments (_id),
  FOREIGN KEY (income_id) REFERENCES Incomes (_id),
  FOREIGN KEY (material_id) REFERENCES Materials (_id),
  FOREIGN KEY (product_id) REFERENCES Products (_id)
);
''',
  '''
CREATE TABLE Payments
(
  _id              INTEGER  NOT NULL UNIQUE,
  date            DATETIME NOT NULL,
  money           FLOAT    NOT NULL,
  is_for_employee BOOL     NOT NULL,
  is_for_supplier BOOL     NOT NULL,
  notes           TEXT     NULL    ,
  employee_id     INTEGER  NOT NULL,
  sec_employee_id INTEGER  NULL    ,
  supplier_id     INTEGER  NULL    ,
  type_id         INTEGER  NOT NULL,
  PRIMARY KEY (_id AUTOINCREMENT),
  FOREIGN KEY (sec_employee_id) REFERENCES Employees (_id),
  FOREIGN KEY (supplier_id) REFERENCES Suppliers (_id),
  FOREIGN KEY (type_id) REFERENCES PaymentsTypes (_id),
  FOREIGN KEY (employee_id) REFERENCES Employees (_id)
);
''',
  '''
CREATE TABLE Incomes
(
  _id               INTEGER  NOT NULL UNIQUE,
  date             DATETIME NOT NULL,
  money            FLOAT    NOT NULL,
  notes            TEXT     NULL    ,
  is_from_employee BOOL     NULL    ,
  employee_id      INTEGER  NOT NULL,
  customer_id      INTEGER  NOT NULL,
  type_id          INTEGER  NOT NULL,
  sec_employee_id  INTEGER  NULL    ,
  PRIMARY KEY (_id AUTOINCREMENT),
  FOREIGN KEY (employee_id) REFERENCES Employees (_id),
  FOREIGN KEY (customer_id) REFERENCES Customers (_id),
  FOREIGN KEY (type_id) REFERENCES IncomesTypes (_id),
  FOREIGN KEY (sec_employee_id) REFERENCES Employees (_id)
);
''',
  '''
CREATE TABLE Prices
(
  _id          INTEGER  NOT NULL UNIQUE,
  product_id  INTEGER  NULL    ,
  material_id INTEGER  NULL    ,
  date        DATETIME NOT NULL,
  price       FLOAT    NOT NULL,
  PRIMARY KEY (_id AUTOINCREMENT),
  FOREIGN KEY (product_id) REFERENCES Products (_id),
  FOREIGN KEY (material_id) REFERENCES Materials (_id)
);
''',
  '''
-- Don't forget to add price depends on  quantity.
CREATE TABLE ProductsRecipes
(
  _id          INTEGER NOT NULL UNIQUE,
  material_id INTEGER NOT NULL,
  product_id  INTEGER NOT NULL,
  quantity    FLOAT   NOT NULL,
  PRIMARY KEY (_id AUTOINCREMENT),
  FOREIGN KEY (product_id) REFERENCES Products (_id),
  FOREIGN KEY (material_id) REFERENCES Materials (_id)
);
'''
];
