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
  name        VARC    NOT NULL UNIQUE,
  quantity    INT     NOT NULL,
  description TEXT    NULL    ,
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
  type__id  INTEGER NOT NULL,
  PRIMARY KEY (_id AUTOINCREMENT),
  FOREIGN KEY (type__id) REFERENCES EmployeeTypes (_id)
);
''',
  '''
CREATE TABLE Customers
(
  _id           INTEGER  NOT NULL UNIQUE,
  name         VARCHAR  NOT NULL,
  phone_number CHAR(11) NULL     UNIQUE,
  notes        TEXT     NULL    ,
  type__id      INTEGER  NOT NULL,
  PRIMARY KEY (_id AUTOINCREMENT),
  FOREIGN KEY (type__id) REFERENCES CustomersTypes (_id)
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
  supplier__id INTEGER NOT NULL,
  PRIMARY KEY (_id AUTOINCREMENT),
  FOREIGN KEY (supplier__id) REFERENCES Suppliers (_id)
);
''',
  '''
CREATE TABLE Bills
(
  _id          INTEGER NOT NULL UNIQUE,
  payment__id  INTEGER NULL    ,
  income__id   INTEGER NULL    ,
  material__id INTEGER NULL    ,
  product__id  INTEGER NULL    ,
  is_payment  BOOL    NOT NULL,
  PRIMARY KEY (_id AUTOINCREMENT),
  FOREIGN KEY (payment__id) REFERENCES Payments (_id),
  FOREIGN KEY (income__id) REFERENCES Incomes (_id),
  FOREIGN KEY (material__id) REFERENCES Materials (_id),
  FOREIGN KEY (product__id) REFERENCES Products (_id)
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
  employee__id     INTEGER  NOT NULL,
  sec_employee__id INTEGER  NULL    ,
  supplier__id     INTEGER  NULL    ,
  type__id         INTEGER  NOT NULL,
  PRIMARY KEY (_id AUTOINCREMENT),
  FOREIGN KEY (sec_employee__id) REFERENCES Employees (_id),
  FOREIGN KEY (supplier__id) REFERENCES Suppliers (_id),
  FOREIGN KEY (type__id) REFERENCES PaymentsTypes (_id),
  FOREIGN KEY (employee__id) REFERENCES Employees (_id)
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
  employee__id      INTEGER  NOT NULL,
  customer__id      INTEGER  NOT NULL,
  type__id          INTEGER  NOT NULL,
  sec_employee__id  INTEGER  NULL    ,
  PRIMARY KEY (_id AUTOINCREMENT),
  FOREIGN KEY (employee__id) REFERENCES Employees (_id),
  FOREIGN KEY (customer__id) REFERENCES Customers (_id),
  FOREIGN KEY (type__id) REFERENCES IncomesTypes (_id),
  FOREIGN KEY (sec_employee__id) REFERENCES Employees (_id)
);
''',
  '''
CREATE TABLE Prices
(
  _id          INTEGER  NOT NULL UNIQUE,
  product__id  INTEGER  NULL    ,
  material__id INTEGER  NULL    ,
  date        DATETIME NOT NULL,
  price       FLOAT    NOT NULL,
  PRIMARY KEY (_id AUTOINCREMENT),
  FOREIGN KEY (product__id) REFERENCES Products (_id),
  FOREIGN KEY (material__id) REFERENCES Materials (_id)
);
''',
  '''
-- Don't forget to add price depends on  quantity.
CREATE TABLE ProductsRecipes
(
  _id          INTEGER NOT NULL UNIQUE,
  material__id INTEGER NOT NULL,
  product__id  INTEGER NOT NULL,
  quantity    FLOAT   NOT NULL,
  PRIMARY KEY (_id AUTOINCREMENT),
  FOREIGN KEY (product__id) REFERENCES Products (_id),
  FOREIGN KEY (material__id) REFERENCES Materials (_id)
);
'''
];
