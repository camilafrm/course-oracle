--Product y Suppliers

SELECT * FROM Products

SELECT * FROM Products p
LEFT JOIN Suppliers s
ON p.SupplierID = s.SupplierID

SELECT * FROM Products p
RIGHT JOIN Suppliers s
ON p.SupplierID = s.SupplierID

SELECT s.CompanyName, p.ProductName FROM Products p
INNER JOIN Suppliers s
ON p.SupplierID = s.SupplierID

--Hacer una consulta usando inner join para las tablas:
--Region y Territories
SELECT * FROM Region r
INNER JOIN Territories t
ON t.RegionID = r.RegionID

--VIEWS 
--CREAR UNA VISTA EN SQL
CREATE VIEW View_Customers
AS
SELECT * FROM Customers
WHERE CustomerID LIKE 'A%'
SELECT * FROM View_Customers

--Crear 05 vistas adicionales, son consultas libres
CREATE VIEW View_Products
AS
SELECT * FROM Products
WHERE ProductName LIKE 'C%'
SELECT * FROM View_Products

CREATE VIEW View_Suppliers
AS
SELECT * FROM Suppliers
WHERE ContactName LIKE 'E%'
SELECT * FROM View_Suppliers

CREATE VIEW View_Orders
AS
SELECT * FROM Orders
WHERE ShipName LIKE '%A'
SELECT * FROM View_Orders

CREATE VIEW View_Territories
AS
SELECT * FROM Territories
WHERE ContactName LIKE 'E%'
SELECT * FROM View_Suppliers

--TRIGGER CUANDO SE INSERTA REGISTROS

CREATE TABLE Region_Logs(
	Id int primary key identity (1, 1),
	Usuario VARCHAR(100),
	Accion VARCHAR(30),
	Fecha datetime
)


CREATE TRIGGER tgr_insert_region
ON Region
FOR INSERT
AS
	INSERT INTO Region_Logs VALUES(SUSER_NAME(), 'INSERT', CURRENT_TIMESTAMP)

SELECT * FROM Region_Logs
SELECT * FROM Region	

INSERT INTO Region VALUES(5, 'Este')
INSERT INTO Region VALUES(6, 'Oeste')
INSERT INTO Region VALUES(7, 'Norte')
INSERT INTO Region VALUES(8, 'Sur')


--Realizar un trigger para update
CREATE TRIGGER tgr_update_region
ON Region
FOR UPDATE
AS
	INSERT INTO Region_Logs
		VALUES(SUSER_NAME(), 'UPDATE', CURRENT_TIMESTAMP)

UPDATE Region SET RegionDescription = 'NorOeste'
WHERE RegionID = 5

--Realizar un trigger para delete
CREATE TRIGGER tgr_delete_region
ON Region
FOR DELETE
AS
	INSERT INTO Region_Logs
		VALUES(SUSER_NAME(), 'DELETE', CURRENT_TIMESTAMP)

DELETE FROM Region 
WHERE RegionID = 5



DECLARE @Nombre VARCHAR (100)
SET @Nombre = 'Juan' + ' Solorzano'
PRINT @Nombre

DECLARE @edad int
SET @edad = 45
IF @edad > 18
	PRINT 'Eres mayor de edad'
ELSE
	PRINT 'Eres menor de edad'

--Mostrar el promedio de 3 números
DECLARE @n1 float
DECLARE @n2 float
DECLARE @n3 float
SET @n1 = 12
SET @n2 = 10
SET @n3 = 9
PRINT (@n1 + @n2 + @n3)/3
 

CREATE PROCEDURE sp_sumar(
	@numero1 float,
	@numero2 float
)
AS 
	DECLARE @resultado = @numero1 + @numero2
