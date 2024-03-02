CREATE DATABASE TallerSQL
GO

CREATE TABLE Clientes(
	Id varchar(4) primary key,
	Nombre varchar(50) NOT NULL,
	Apellidos varchar(50) NOT NULL,
	Telefono char(9) NULL,
	Direccion varchar(100) NULL,
	Email varchar(100) NULL
);

INSERT INTO Clientes
	VALUES('0001', 'Camila', 'Fuentes Rivera', '923673202','Carabayllo','1540552@senati.pe'),
	      ('0002', 'Rossana', 'Gutierrez', '990674459','Los Olivos', '1367754@senati.pe'),
		  ('0003', 'Vanessa', 'Fasabi', '923679866','Independencia', '1977651@senati.pe'),
		  ('0004', 'Lucia', 'Mejia','977530951','Comas',  '1330984@senati.pe'),
		  ('0005', 'Diego', 'Castillo','938764554','San Miguel',  '1585624@senati.pe'),
		  ('0006', 'Nicole', 'Ramirez','967223547','Ventanilla',  '1755963@senati.pe'),
		  ('0007', 'Gonsalo', 'Mejia','977443258','Pachacutec',  '1633578@senati.pe'),
		  ('0008', 'Erika', 'Sotelo', '941158726', 'Pte. Piedra', 'erikasot@gmail.com'),
		  ('0009', 'Mariel', 'Blas', '954412665', 'Carabayllo' , 'marie@gmail.com'),
		  ('0010', 'Arturo', 'Lopez', '991014475', 'Carabayllo', 'artulop@gmail.com');

SELECT * FROM Clientes 
UPDATE Clientes SET Direccion = 'Callao'
WHERE Id IN ('0007','0003','0005','0001','0010')

DELETE FROM Clientes
WHERE Id IN ('0004','0006')

DROP TABLE Clientes