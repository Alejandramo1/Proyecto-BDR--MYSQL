USE rappi;

-- Inserción de datos
-- Primero insertamos los datos correspondientes a la tabla usuarios

INSERT INTO usuarios(
	id_usuario,
	nombre_usuario,
	apellido_usuario,
	contraseña,
	direccion,
	email,
	sexo,
	celular
    ) 
	VALUES (1,'Alejandra','Morales Rodriguez','ADNSAK12','Cra 21f #35-5','malejamo24@hotmail.com','Femenino','3294584593'),
	(2,'Patricia','Fernandez Gomez','ad23rcn','Cra 45 #35-5','adjre34@gmail.com','Femenino','3125569432'),
	(3,'Edison Manuel','Lancheros Gaul','1shdi3','Cra 19 #2-6','lapioj2@yahoo.com','Masculino','3124584024'),
	(4,'Alejandra Maria','Taro Suarez','djHDI','Cra 56 #12-7','alejanmo2@gmail.com','Femenino','3002458920'),
	(5,'Alicia','Daza Issa','234444D','Cra 79 #12-8','Gdfnmo2@gmail.com','Femenino','3202584082'),
	(6,'Paola','Ramirez Norena','adhdhdh2','Cra 139 #12-9','EDSnmo2@gmail.com','Femenino','3103462124'),
	(7,'Nelfa','Sanchez Daza','SKSDH2','Cra 149 #12-10','alejaTG@gmail.com','Femenino','3124575821'),
	(8,'Ariel','Gomez Martinez','DHUW3','Cra 129 #12-11','alDJFIA2@gmail.com','Masculino','3134968212'),
	(9,'Gabriel','Paul Macaron','2H21f3','Cra 159 #12-12','aDJSSnmo2@gmail.com','Masculino','3124859293'),
	(10,'Juan Camilo','Anaya PeÃ±a','13DFJ','Cra 19 #12-163','ALKSDnmo2@gmail.com','Masculino','3214849204'),
	(11,'Omar','Penaranda Fernandez','123DFJNC','Cra 193 #12-14','MEUDNnmo2@gmail.com','Masculino','3202948147'),
	(12,'Juan Sebastian','Daza Gomez','ajHDNKA2','Calle 19 #12-15','NSJSJnmo2@gmail.com','Masculino','3228429485'),
	(13,'Jose Jesus','Jimenez Martinez','ASJHXDa123','Calle 34c #2-24','josemñ@hotmail.com','Masculino','3246571239'),
	(14,'Alexandra','Navarro Mendoza','23dafges','Calle 3r #2-24','mendozaale@gmail.com','Femenino','3124537829'),
	(15,'Alexandra','Navarro Mendoza','23dafges','Calle 3r #2-24','mendozaale@gmail.com','Femenino','3124537829'),
	(16,'Alexandra','Navarro Mendoza','23dafges','Calle 3r #2-24','mendozaale@gmail.com','Femenino','3124537829'),
	(17,'Alexandra','Navarro Mendoza','23dafges','Calle 3r #2-24','mendozaale@gmail.com','Femenino','3124537829'),
	(18,'Patricia','Navarro Mendoza','23dafges','Calle 3r #2-24','mendozaale@gmail.com','Femenino','3124537829'),
	(19,'Nelson','Morales Mendoza','23dafges','Calle 3r #2-24','Morales@gmail.com','Masculino','3124537829');

--  Inserción Tabla vendedores

INSERT INTO vendedor (
	id_vendedor,
	Nombre,
	Direccion,
	Categoria
	)
VALUES 
	(1,'Drogueria la rebaja','Cra 21f #35-5','Farmacia'),
	(2,'Exito','Cra 21 #14-5','Viveres'),
	(3,'Farmatodo','Calle 24 #34-4','Farmacia'),
	(4,'Dislicores','Calle 9 #2-5','Licores'),
	(5,'Rapimercar','Calle 15 #4-6','Supermercado'),
	(6,'Drogueria colsubsidio','Calle 2 #34-7','Farmacia'),
	(7,'Porthos pub','Calle 24 #4-8','Restaurante'),
	(8,'Antioquenitos','Calle 54 #34-9','Licores'),
	(9,'La economia','Calle 13 #4-10','Farmacia'),
	(10,'Tome aqui','Calle 17 #34-11','Licores'),
	(11,'Rickys','Calle 6ta 4-53','Licores'),
	(13,'Ale','Calle 6ta','Licores');
	
-- Inserción Tabla rappitenderos

INSERT INTO rappitenderos(
	id_rappi,
	nombre_rappi,
	apellido_rappi,
	contraseña,
	email,
	sexo,
	celular
)
 VALUES (
  1,'Carlos','Ducuara Rodriguez','fjda12','Carlosdu@hotmail.com','Masculino','3294584593'),
 (2,'Sonia','Suarez Camargo','fsfs434','soniadk@gmail.com','Femenino','3458183943'),
 (3,'Monica','Araujo Noguera','JFJDNM45','lapioj2@yahoo.com','Femenino','3124584024'),
 (4,'Maria','Nore Rincon','123KDs2','Marianore@gmail.com','Femenino','3224531233'),
 (5,'Pedro','Fernandez Siloe','23eJS32','Pedroferna@gmail.com','Masculino','3202584082'),
 (6,'Margarita','Sanchez Morales','AKDJ23dj','Marga134@gmail.com','Femenino','3103462124'),
 (7,'Nelfa','Sanchez Daza','SKSDH2','alejaTG@gmail.com','Femenino','3124575821'),
 (8,'Juan Jose','Cariano Suarez','SJjd','JuanJ@gmail.com','Masculino','3145968212'),
 (9,'Gabriela','Mocoa Morales','234ed3','GabrielaMocoa@gmail.com','Masculino','3124859293'),
 (10,'Camila','Penaranda Ramirez','13DFJ','penarandao@gmail.com','Femenino','3145674321');
 
 -- Inserción 




















-- Creacion vista de top de productos más vendidos
CREATE OR REPLACE VIEW Vw_productos_vendidos AS
(SELECT p.nombre AS Nombre_producto,cantidad AS Unidades_vendidas,total_orden AS Ingresos
	FROM detalle_orden AS d
	JOIN productos AS p 
    ON d.id_producto=p.id_producto
    GROUP BY nombre
    ORDER BY d.total_orden DESC);
    
-- Creacion vista top de rappitenderos con mayores ordenes 
CREATE OR REPLACE VIEW Vw_top_rappitenderos AS
(SELECT CONCAT(r.nombre_rappi, ' ', r.apellido_rappi) As Rappitendero, COUNT(o.id_orden) AS Numero_ordenes, o.total AS Total_ordenes
FROM rappitenderos AS r
INNER JOIN orden AS o ON r.id_rappi=o.id_rappi
GROUP BY r.nombre_rappi
ORDER BY Numero_ordenes DESC);

-- Medios de pago más usados 
CREATE OR REPLACE VIEW Vw_top_metodo_pago AS
(SELECT p.metodo_pago, COUNT(p.id_pago) AS numero_veces_usado, o.total
FROM pagos AS p
INNER JOIN orden AS o
ON p.id_pago=o.id_pago
GROUP BY p.metodo_pago)
ORDER BY numero_veces_usado DESC;

-- Vendedores con más numero de ordenes
CREATE OR REPLACE VIEW Vw_top_vendedores AS
(SELECT v.nombre, COUNT(o.id_orden) AS numero_ordenes, o.total
FROM vendedor AS v
INNER JOIN orden AS o
ON v.id_vendedor=o.id_vendedor
GROUP BY v.nombre)
ORDER BY numero_ordenes DESC;

-- Usuarios con más numero de ordenes en rappi

CREATE OR REPLACE VIEW Vw_top_usuarios AS
(SELECT CONCAT(u.nombre_usuario, ' ', u.apellido_usuario) As Usuarios, COUNT(o.id_orden) AS numero_ordenes, o.total AS Total_ordenes
FROM usuarios AS u
INNER JOIN orden AS o
ON u.id_usuario=o.id_usuario
GROUP BY u.nombre_usuario
ORDER BY numero_ordenes DESC);
