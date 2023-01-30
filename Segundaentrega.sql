-- DROP DATABASE RAPPI;

CREATE DATABASE IF NOT EXISTS Rappi ;
-- Tablas
-- Usar base de datos 
USE rappi;

CREATE TABLE IF NOT EXISTS pagos(
	id_pago INT NOT NULL AUTO_INCREMENT,
    fecha DATETIME NOT NULL,
    metodo_pago VARCHAR(50) NOT NULL,
	CONSTRAINT PK_PAGOS PRIMARY KEY(id_pago)
    );

-- Tabla Vendedor 
CREATE TABLE IF NOT EXISTS Vendedor(
	id_vendedor INT NOT NULL AUTO_INCREMENT,
	Nombre VARCHAR(100) NOT NULL,
    Direccion VARCHAR(150) NOT NULL,
    Categoria VARCHAR(30) NOT NULL,
    CONSTRAINT PK_VENDEDOR PRIMARY KEY(id_vendedor)
    );

								       
-- Tabla usuarios
CREATE TABLE IF NOT EXISTS usuarios(
	id_usuario INT NOT NULL AUTO_INCREMENT,
    nombre_usuario VARCHAR(50) NOT NULL,
    apellido_usuario VARCHAR(50) NOT NULL,
    contraseña VARCHAR(50) NOT NULL,
    direccion VARCHAR(150) NOT NULL,
    email VARCHAR(130) NOT NULL,
    sexo VARCHAR(30) NOT NULL,
    celular VARCHAR(30) NOT NULL,
    CONSTRAINT PK_USUARIOS PRIMARY KEY (id_usuario) 
    );
    
    -- Tabla rappitendero
CREATE TABLE IF NOT EXISTS rappitenderos(
	id_rappi INT NOT NULL AUTO_INCREMENT,
    nombre_rappi VARCHAR(50) NOT NULL,
    apellido_rappi VARCHAR(50) NOT NULL,
    contraseña VARCHAR(50) NOT NULL,
    email VARCHAR(130) NOT NULL,
    sexo VARCHAR(30) NOT NULL,
    celular VARCHAR(30) NOT NULL,
    CONSTRAINT PK_RAPPITENDERO PRIMARY KEY (id_rappi)
    );
    
-- Tabla Productos 
CREATE TABLE IF NOT EXISTS Productos(
	id_producto INT NOT NULL AUTO_INCREMENT,
    id_vendedor INT NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(300) NOT NULL,
    Precio FLOAT NOT NULL,
    Categoria VARCHAR(30) NOT NULL,
    CONSTRAINT PK_PRODUCTOS PRIMARY KEY(id_producto));
    
    -- Llaves foraneas tabla productos
    ALTER TABLE Productos ADD CONSTRAINT FK_PRODUCTOS_VEN 
    FOREIGN KEY (id_vendedor)
    REFERENCES Vendedor (id_vendedor) ON DELETE CASCADE;
    
-- Tabla orden 

CREATE TABLE IF NOT EXISTS orden(
	id_orden INT NOT NULL AUTO_INCREMENT,
    id_pago INT NOT NULL,
    id_rappi INT NOT NULL,
    id_vendedor INT NOT NULL,
    id_usuario INT NOT NULL,
    fecha DATETIME NOT NULL,
    total FLOAT NOT NULL DEFAULT 0, -- Nuevo agregado
    CONSTRAINT PK_ORDEN PRIMARY KEY(id_orden));
    
    -- Llaves foraneas tabla orden
	ALTER TABLE Orden ADD CONSTRAINT FK_ORDEN_PAGO
    FOREIGN KEY (id_pago)
    REFERENCES pagos (id_pago) ON DELETE CASCADE;
    
    ALTER TABLE Orden ADD CONSTRAINT FK_ORDEN_RAPPI
    FOREIGN KEY (id_rappi)
    REFERENCES rappitenderos(id_rappi) ON DELETE CASCADE;

    ALTER TABLE Orden ADD CONSTRAINT FK_ORDEN_USUARIOS
    FOREIGN KEY (id_usuario)
    REFERENCES usuarios (id_usuario) ON DELETE CASCADE;
    
	ALTER TABLE Orden ADD CONSTRAINT FK_ORDEN_VENDEDOR
    FOREIGN KEY (id_vendedor)
    REFERENCES vendedor (id_vendedor) ON DELETE CASCADE;
    
	-- Tabla detalle ordenes 
	
CREATE TABLE IF NOT EXISTS detalle_orden(
	id_detalle INT NOT NULL AUTO_INCREMENT,
	id_orden INT NOT NULL,
	id_producto INT NOT NULL,
	Precio_unit FLOAT NOT NULL,
	Cantidad FLOAT NOT NULL,
    CONSTRAINT PK_DETALLE_ORDEN PRIMARY KEY (id_detalle));
    
	-- Llaves foraneas tabla detalle orden
    
	ALTER TABLE detalle_orden ADD CONSTRAINT FK_DETALLEORDEN_ORDEN
    FOREIGN KEY (id_orden)
    REFERENCES orden (id_orden) ON DELETE CASCADE;
    
    ALTER TABLE detalle_orden ADD CONSTRAINT FK_DETALLEORDEN_PROD
    FOREIGN KEY (id_producto)
    REFERENCES productos (id_producto)  ON DELETE CASCADE;
    
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
 
 -- Inserción Tabla productos
 
 INSERT INTO productos(
	id_producto,
       id_vendedor,
       Nombre,
       Descripcion,
       Precio,
       Categoria) 
      VALUES 
      (1,1,'Cepillo dental colgate x 3und','Cepillo dental colgate premier clean',8900,'Farmacia'),
      (2,2,'Buchanans deluxe 750 ml 12 anos','Buchanans 12 Deluxe es sedoso y refrescante, lo que lo aleja de los perfiles pesados del whisky. Su sabor suave y afrutado, con notas de naranja y chocolate permiten servirlo en las rocas o con soda, acompanado de una rodaja de naranja.',180600,'Licores'),
      (3,5,'Arroz diana 1000 gr','Arroz blanco marca Diana. Contenido 1000 gramos',8000,'Supermercado'),
      (4,6,'Dolex gripa 500 mg','Dolex rapido y efectivo alivio contra los sintomas de la gripa.',20000,'Farmacia'),
      (5,3,'Sinovul anticonceptivos','SINOVUL Comprimido recubierto 0.15 mg 0.03 mg',14000,'Farmacia'),
      (6,6,'Colgate luminex 45 gramos','Crema dental colgate luminous white brilliant',18000,'Supermercado'),
      (7,8,'Old parr','Whisky con aroma fino, lleno y una riqueza unica, tiene un color dorado. Su aroma incluye un toque de hojas verdes y flores, y notas de roble.',157400,'Licores'),
      (8,9,'Crema palmolive limon','Con una deliciosa sensacion de suavidad y nutricion todos los dias, mientras su placentera fragancia deleita tus sentidos.',11317,'Farmacia'),
      (9,7,'Hamburguesa doble carne','Jugosa carne 100% de res de 125 g, con una taja de queso tipo mozzarella, increible guacamole, tomate en rodajas, cebolla en rodajas, lechuga fresca y salsa blanca en pan ajonjoli.',24000,'Restaurantes'),
      (10,1,'Acetaminofen 10 tabletas','Medicamento comun para aliviar el dolor ligero o moderado de dolores de cabeza, dolores musculares, periodos menstruales, resfriados y gargantas irritadas, dolores de muelas, dolores de espalda y para reducir la fiebre',10000,'Farmacia'),
      (11,2,'Chocolisto 1000 gr','Chocolisto es una mezcla en polvo para una deliciosa bebida instantanea de chocolate enriquecida con vitaminas y minerales. Ofrece la mejor nutricion con el mÃ¡s rico sabor a chocolate.',6700,'Restaurantes'),
      (12,4,'Buchanans master 1000ml','El Whisky Buchanan\'s 12 anos ha sido un clasico durante casi 100 aÃ±os y es uno de los whiskies escoceses de lujo mas iconicos y premiados.',175900,'Licores'),
      (13,3,'Acido Salicilico crema','El acido salicilico topico alivia el acne al reducir la hinchazon y enrojecimiento y abrir los poros de la piel obstruidos, lo que permite que las espinillas se sequen. Alivia otras enfermedades de la piel al suavizar y aflojar la piel seca',25000,'Farmacia'),
      (14,6,'Acetato de aluminio 250 ml','El Acetato de Aluminio Genfar restituye la acidez perdida de la piel y coloca su pH de nuevo a niveles normales.',28000,'Farmacia'),
      (15,5,'Chocolate jumbo 100 gr','Chocolatina Jumbo jet mani mezlca de cacao y mani x 100 gr',2800,'Farmacia'),
      (16,6,'Iboprofeno 500 mg','Medicamento que se usa para tratar la fiebre, la hinchazon, el dolor y el enrojecimiento al impedir que el cuerpo elabore sustancias que causan inflamacion.',5600,'Farmacia'),
      (17,7,'Pizza mediana hawaiana','Pizza de 30 cm, con jamon, queso y hawaina',18000,'Restaurantes');


-- Inserción Tabla pagos

INSERT INTO pagos(
  id_pago,
  fecha,
  metodo_pago) 
  VALUES (
  1,'2022-12-01 00:00:00','Efectivo'),
  (2,'2022-12-01 00:00:00','Efectivo'),
  (3,'2022-12-01 00:00:00','PSE Banco popular'),
  (4,'2022-12-02 00:00:00','PSE Davivienda'),
  (5,'2022-12-03 00:00:00','Nequi'),
  (6,'2022-12-04 00:00:00','Efectivo'),
  (7,'2022-12-05 00:00:00','Efectivo'),
  (8,'2022-12-05 00:00:00','Efectivo'),
  (9,'2022-12-06 00:00:00','Efectivo'),
  (10,'2022-12-07 00:00:00','Nequi'),
  (11,'2022-12-07 00:00:00','Efectivo'),
  (12,'2022-12-09 00:00:00','PSE Banco occidente'),
  (13,'2022-12-10 00:00:00','Efectivo'),
  (14,'2022-12-10 00:00:00','Efectivo'),
  (15,'2022-12-11 00:00:00','Nequi');
  
  -- Inserción Tabla orden
  
  INSERT INTO orden(
	id_orden,
	id_pago,
	id_rappi,
	id_vendedor,
	id_usuario,
	fecha,
	total)
    VALUES (
    1,2,1,1,12,'2022-12-25 01:00:00',99740),
    (2,1,1,1,12,'2022-12-25 14:00:00',76033),
    (3,3,2,10,11,'2022-12-25 00:00:00',124843),
    (4,4,5,7,9,'2022-12-25 05:00:00',35500),
    (5,7,7,4,5,'2022-12-26 14:00:00',28000),
    (6,8,9,5,4,'2022-12-27 21:00:00',22110),
    (7,15,1,6,3,'2022-12-28 22:00:00',24000),
    (8,14,1,2,2,'2022-12-29 15:00:00',12500),
    (9,12,10,4,1,'2022-12-29 01:00:00',14000),
    (10,10,7,1,5,'2022-12-29 02:00:00',12400);


-- Inserción Tabla detalle orden

INSERT INTO detalle_orden(
	id_detalle,
	id_orden,
	id_producto,
	Precio_unit,
	Cantidad
)
	 VALUES (
	 1,1,1,8900,2),
	 (2,2,17,18000,1),
	 (3,3,14,8000,4),
	 (4,4,12,20000,2),
	 (5,5,15,2800,6),
	 (6,6,14,28000,7),
	 (7,7,17,18000,2),
	 (8,8,1,11317,1),
	 (9,9,1,24000,4),
	 (10,10,1,10000,5);

-- CREACIÓN DE VISTAS
-- Creacion vista de top de productos con más unidades vendidas
    
    CREATE OR REPLACE VIEW Vw_productos_vendidos AS
(SELECT p.nombre AS Nombre_producto,cantidad AS Unidades_vendidas
	FROM detalle_orden AS d
	JOIN productos AS p 
    ON d.id_producto=p.id_producto
    GROUP BY nombre
    ORDER BY d.Cantidad DESC);
    
    
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

-- CREACIÓN DE FUNCIONES 

-- La primera función nos calcula el numero de compras que ha realizado un usuario.
DELIMITER $$
CREATE FUNCTION fnnum_compras (id_usuario_param INT)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE num_compras INT;
	SELECT COUNT(id_orden) AS numero_orden
		INTO num_compras	
	FROM usuarios AS u
	JOIN orden AS o 
	ON u.id_usuario=o.id_usuario
    WHERE u.id_usuario=id_usuario_param;
    
  RETURN num_compras;

END

$$ ;

-- Segunda función arroja la categoria del producto según id ingresado

DELIMITER $$
CREATE FUNCTION fncat_prod_vendidos (id_producto_para INT)
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
	DECLARE categoria VARCHAR(30);
	SELECT p.categoria
		INTO categoria
	FROM productos AS p
	WHERE  p.id_producto=id_producto_para;
    
  RETURN categoria ;

END

$$ ;


-- Tercera función muestra unidades vendidas por categoría.


DELIMITER $$
CREATE FUNCTION fnund_vendidas_cat (categoria_param VARCHAR(30))
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE categoria VARCHAR(30);
	SELECT COUNT(d.id_producto)
		INTO categoria
	FROM productos AS p
	INNER JOIN detalle_orden AS d
		ON p.id_producto=d.id_producto
	WHERE  p.categoria=categoria_param;
    
  RETURN categoria ;

END

$$ ;


-- STORED PROCEDURES

-- SP1: STORED PROCEDURE PARA INGRESAR NUEVAS ORDENES
-- DROP PROCEDURE sp_nueva_orden;

DELIMITER $$

CREATE PROCEDURE sp_nueva_orden (
	IN id_orden_entrada INT,
    IN id_pago_entrada INT,
	IN id_rappi_entrada INT,
    IN id_vendedor_entrada INT,
    IN id_usuario_entrada INT,
    IN fecha_entrada DATETIME
    )
BEGIN 
-- Enuncia los campos a insertar
	INSERT INTO orden(
        id_orden,
        id_pago,
        id_rappi,
        id_vendedor,
        id_usuario,
        fecha)        
-- Asigna los valores según los datos de entrada ingresados
    VALUES(
		id_orden_entrada,
        id_pago_entrada,
        id_rappi_entrada,
        id_vendedor_entrada,
        id_usuario_entrada,
        fecha_entrada);

-- Devuelve el campo ingresado
	SELECT * FROM ORDEN ORDER BY id_orden DESC LIMIT 1;
END

$$;

-- Ingresar una nueva orden
START TRANSACTION;
CALL sp_nueva_orden(11,
	5,
	7,
    1,
    2,
    curtime()
    );
    
    -- CURTIME;
    -- ROLLBACK;
    
-- STORED PROCEDURE TABLA DETALLE DE ORDEN Y ORDEN
-- EL SP DILIGENCIA LA TABLA DETALLE DE ORDEN ESPECIFICANDO LOS PRODUCTOS Y LA CANTIDAD DE CADA UNO DE ELLOS, ADEMAS DE ASOCIARLO
-- CON EL PRECIO ESTABLECIDO EN LA TABLA PRODUCTOS. A SU VEZ REALIZA LA SUMATORIA DEL TOTAL DEL VALOR DE DICHOS PRODUCTOS Y
-- LOS ACTUALIZA EN EL CAMPO "total" DE LA TABLA ORDEN.

-- SP detalle orden
DELIMITER $$
CREATE PROCEDURE sp_detalle_orden(
	IN id_orden_entrada INT,
    IN id_producto_entrada INT,
    IN Cantidad_entrada INT )
BEGIN 
DECLARE v_Precio_prod FLOAT;
DECLARE v_cantidad_prod FLOAT; 

	SELECT Precio 
		INTO v_Precio_prod
	FROM Productos AS p
	WHERE id_producto = id_producto_entrada;

    INSERT INTO detalle_orden(
		id_detalle,
        id_orden,
        id_producto,
        precio_unit, 
        cantidad)
	VALUES( 
        NULL, 
        id_orden_entrada,
        id_producto_entrada,
        v_Precio_prod,
        Cantidad_entrada);
	
    -- En este se utilizara un cursos para ir recorriendo cada una de las filas
    BEGIN 
    -- Se declara la variable v_finbucle con valor de cero la cual tendra la finalidad de concluir el bucle.
	DECLARE v_finbucle INT DEFAULT 0;
	DECLARE v_total_orden FLOAT;
    DECLARE v_total FLOAT DEFAULT 0; -- Para que el contador del bucle siempre inicie en cero
    DECLARE cursor_detalle CURSOR FOR SELECT Precio_unit*cantidad FROM detalle_orden WHERE id_orden=id_orden_entrada;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_finbucle = 1; -- Esta sentencia asigna a la variable v_finbucle el valor de 1 cuando no existen mas registros con las condiciones dadas

OPEN cursor_detalle;
    -- Establezco el bucle
  bucle: LOOP
  -- El Fetch tiene como finalidad recuperar los valores de la consulta establecida anteriormente 
  -- y las va almacenando una a una en la variable v_total_orden hasta que se cumpla el bucle
    FETCH cursor_detalle INTO v_total_orden ;
    IF v_finbucle = 1 THEN
      LEAVE bucle;
    END IF;
	-- Asignación en la variable contador, los valores de productos asociados
    SET v_total = v_total + v_total_orden;
    END LOOP bucle;
    
    -- Una vez finalizado el bucle realiza actualizacion de registo en eñ campo total de la tabla orden
	UPDATE orden 
    SET total = v_total -- En esta sentencia se asigna al campo total el valor que la variable que ha ido acumulando en el bucle
    WHERE id_orden=id_orden_entrada;
	
CLOSE cursor_detalle;
END;
END;
$$;

-- Teniendo en cuenta el registro ingresado anteriormente numero 11, probamos el stored procedure ingresando 3 productos
-- correspondientes al mismo numero de orden;

START TRANSACTION;
call sp_detalle_orden(11,10,4);
call sp_detalle_orden(11,1,1);
call sp_detalle_orden(11,18,1);
call sp_detalle_orden(11,10,1);
call sp_detalle_orden(10,1,1);

-- COMMIT;
-- ROLLBACK;

-- SELECT * FROM DETALLE_ORDEN ORDER BY id_orden DESC;
-- SELECT * FROM ORDEN ORDER BY id_orden DESC; 


-- SP2 Stored Procedures 
-- Crea un procedimiento almacenado para consultar en la tabla de vendedores según un campo de ordenación

DELIMITER $$

CREATE PROCEDURE sp_vendedores (
	IN campo_ordenamiento VARCHAR(100),
    IN tipo_orden VARCHAR(30))

BEGIN

	DECLARE orden_vendedores VARCHAR(100) ; -- Indica el campo por el cual ejecutar ORDER BY
	DECLARE tipo_orden_var VARCHAR(30); -- Indica si será descendiente o ascendente
	DECLARE consulta_ejecutar VARCHAR(200); 
    
    -- Sentencia IF según los valores ingresados
	IF campo_ordenamiento <> '' THEN
    
		SET orden_vendedores = CONCAT(' ORDER BY ', campo_ordenamiento);
		IF tipo_orden <> '' THEN
			SET tipo_orden_var = tipo_orden;
		END IF;
	END IF;

-- Asignación de la variable consulta ejecutar
  SET @consulta_ejecutar = CONCAT('SELECT * FROM vendedor', orden_vendedores ,' ' ,tipo_orden_var);

-- Preparación del objeto
  SELECT consulta_ejecutar;
  PREPARE runSentencia FROM @consulta_ejecutar;
  EXECUTE runSentencia;
  DEALLOCATE PREPARE runSentencia;

END

$$ ;

-- Prueba para los Stored procedures

-- Prueba Primer SP

CALL sp_vendedores('Nombre','Desc');

-- Segundo Stored Procedures

-- El siguiente SP inserta datos de usuarios nuevos en la tabla de usuarios.

DELIMITER $$

CREATE PROCEDURE sp_usuario_nuevo (
	IN nombre_usuario_entrada VARCHAR(50),
    IN apellido_usuario_entrada VARCHAR(50),
    IN contraseña_entrada VARCHAR(50),
    IN direccion_entrada VARCHAR(150),
    IN email_entrada VARCHAR(130),
    IN sexo_entrada VARCHAR(30),
    IN celular_entrada VARCHAR(30)
    )
    
BEGIN 
-- Enuncia los campos a insertar
	INSERT INTO usuarios(
        nombre_usuario,
        apellido_usuario,
        contraseña,
        direccion,
        email,
        sexo,
        celular
        )
        
-- Asigna los valores según los datos de entrada ingresados
    VALUES(
		nombre_usuario_entrada
        ,apellido_usuario_entrada
        ,contraseña_entrada 
        ,direccion_entrada
        ,email_entrada
        ,sexo_entrada
        ,celular_entrada);

-- Devuelve el campo ingresado

	SELECT * FROM USUARIOS ORDER BY id_usuario DESC LIMIT 1;
END

$$;

-- Prueba para los Stored procedures

-- Ingresar datos de nuevo usuario
CALL sp_usuario_nuevo(
            'Patricia'
            , 'Navarro Mendoza'
            , '23dafges'
            , 'Calle 3r #2-24'
            , 'mendozaale@gmail.com'
			, 'Femenino'
            , '3124537829'
        );
	

-- TRIGGERS 

-- TABLA VENDEDOR
-- PRIMER TRIGGER BEFORE
-- Integrar trigger para registrar las modificaciones de los registros en la tabla de vendedor.
    -- Primero crear la tabla para guardar log
  CREATE TABLE IF NOT EXISTS Bitacora_vendedor_log (
        id_bitacora INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
        id_vendedor INT NOT NULL,
		Tipo_movimiento VARCHAR(30),
        Nombre VARCHAR(100) NOT NULL,
        Direccion VARCHAR(150) NOT NULL,
        Categoria VARCHAR(30),
        Usuario_registro VARCHAR(100),
        Fecha DATE,
        Hora TIME
        );

	DROP TRIGGER IF EXISTS tr_update_vendedor;
        -- Crear el trigger que registre los datos de modificación del registro en la tabla de vendedores
    DELIMITER $$
    CREATE TRIGGER tr_update_vendedor
    BEFORE UPDATE ON VENDEDOR
    FOR EACH ROW
    BEGIN
        INSERT INTO Bitacora_vendedor_log (
			id_vendedor,
            Tipo_movimiento,
			Nombre,
			Direccion,
			Categoria,
			Usuario_registro,
			Fecha,
			Hora
        )     
         VALUES (
            NEW.id_vendedor,
            "Update",
			NEW.Nombre,
			NEW.Direccion,
            NEW.Categoria,
            USER(),
            CURDATE(),
            CURTIME()
        );
    END
    $$ ;
    
       -- Prueba para modificar un registro
    UPDATE vendedor
		SET Direccion='Cra 21f #35-5'
	WHERE id_vendedor=1;
    -- Revisar datos
    SELECT * FROM Bitacora_vendedor_log;
    
    -- SEGUNDO TRIGGER
    -- Este trigger inserta un registro nuevo en la tabla vendedores primero evaluando que no se encuentre repetido
	-- Crear el trigger que realiza la verificación e insercion del nuevo registro en la tabla de vendedores
    
    DROP TRIGGER IF EXISTS tr_insert_vendedor;
    
    DELIMITER $$
    CREATE TRIGGER tr_insert_vendedor
	AFTER INSERT ON VENDEDOR
    FOR EACH ROW
    BEGIN
			INSERT INTO Bitacora_vendedor_log (
			id_vendedor,
            Tipo_movimiento,
			Nombre,
			Direccion,
			Categoria,
			Usuario_registro,
			Fecha,
			Hora
        )     
          VALUES (
            NEW.id_vendedor,
            "Insert",
			NEW.Nombre,
			NEW.Direccion,
            NEW.Categoria,
            USER(),
            CURDATE(),
            CURTIME()
        );
    END
    $$ ;
    
      -- Prueba para insertar un registro
    INSERT INTO vendedor(
			Nombre,
			Direccion,
			Categoria)
	VALUES('Ale', 'Calle 6ta', 'Licores');
    
    -- Revisar datos
    SELECT * FROM Bitacora_vendedor_log;
    
-- TERCER TRIGGER
    -- Este trigger elimina un registro en la tabla vendedores.
	-- Crear el trigger que realiza la eliminación de un registro en la tabla de vendedores
    
    DROP TRIGGER IF EXISTS tr_delete_vendedor;
    
    DELIMITER $$
    CREATE TRIGGER tr_delete_vendedor
	BEFORE DELETE ON VENDEDOR
    FOR EACH ROW
    BEGIN
			INSERT INTO Bitacora_vendedor_log(
			id_vendedor,
            Tipo_movimiento,
			Nombre,
			Direccion,
			Categoria,
			Usuario_registro,
			Fecha,
			Hora
        )     
          VALUES (
            OLD.id_vendedor,
            "Delete",
			OLD.Nombre,
			OLD.Direccion,
            OLD.Categoria,
            USER(),
            CURDATE(),
            CURTIME()
        );
    END
    $$ ;
    
      -- Prueba para insertar un registro
	
	SET FOREIGN_KEY_CHECKS=0; -- Funcion para no chequear llaves foraneas
    
    DELETE FROM vendedor
	WHERE id_vendedor= 2;
    
    -- Revisar datos
    SELECT * FROM Bitacora_vendedor_log;
    
     -- TABLA USUARIOS
-- PRIMER TRIGGER BEFORE
-- Integrar trigger para registrar las modificaciones de los registros en la tabla de usuarios existentes.
    -- Primero crear la tabla para guardar log
    
    CREATE TABLE Bitacora_Usuario_log (
		id_bitacora INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        id_usuario INT NOT NULL,
        tipo_movimiento VARCHAR(30),
        nombre_usuario VARCHAR(50),
		apellido_usuario VARCHAR(50),
		contraseña VARCHAR(50),
		direccion VARCHAR(150),
		email VARCHAR(130),
		sexo VARCHAR(30),
		celular VARCHAR(30),
        Usuario_registro VARCHAR(100),
        Fecha DATE,
        Hora TIME
    );
	
    DROP TRIGGER IF EXISTS tr_update_usuarios;
    
-- Crear el trigger que registre los datos de modificación del registro en la tabla de usuarios

    DELIMITER $$
    CREATE TRIGGER tr_update_usuarios
	BEFORE UPDATE ON usuarios
    FOR EACH ROW
    BEGIN
	INSERT INTO Bitacora_Usuario_log (
            id_usuario,
            tipo_movimiento,
			nombre_usuario,
			apellido_usuario,
			contraseña,
			direccion,
			email,
			sexo,
			celular,
            Usuario_registro,
			Fecha,
			Hora 
        )     
         VALUES (
			NEW.id_usuario,
            'Update',
			NEW.nombre_usuario,
			NEW.apellido_usuario,
			NEW.contraseña,
			NEW.direccion,
			NEW.email,
			NEW.sexo,
			NEW.celular,
            USER(),
            CURDATE(),
            CURTIME()
        );
	END;
    $$ ;
    
    -- Prueba para modificar un registro
    UPDATE usuarios
		SET Direccion='Cra 45 #35-5'
	WHERE id_usuario=2;
    -- Revisar datos
    SELECT * FROM Bitacora_Usuario_log;
    
-- TABLA USUARIOS
-- SEGUNDO TRIGGER INSERT AFTER
-- Este trigger inserta un registro nuevo en la tabla usuarios

	DROP TRIGGER IF EXISTS tr_insert_usuarios;
    
    DELIMITER $$
    CREATE TRIGGER tr_insert_usuarios
	AFTER INSERT ON usuarios
    FOR EACH ROW
    BEGIN
	INSERT INTO Bitacora_Usuario_log (
            id_usuario,
            tipo_movimiento,
			nombre_usuario,
			apellido_usuario,
			contraseña,
			direccion,
			email,
			sexo,
			celular,
            Usuario_registro,
			Fecha,
			Hora 
        )     
         VALUES (
			NEW.id_usuario,
            'Insert',
			NEW.nombre_usuario,
			NEW.apellido_usuario,
			NEW.contraseña,
			NEW.direccion,
			NEW.email,
			NEW.sexo,
			NEW.celular,
            USER(),
            CURDATE(),
            CURTIME()
        );
	END;
    $$ ;
    
    -- Prueba para insertar un registro en la tabla usuarios usando el SP ctrado anteriormente
    -- Ingresar datos de nuevo usuario
    
	CALL sp_usuario_nuevo(
            'Nelson'
            , 'Morales Mendoza'
            , '23dafges'
            , 'Calle 3r #2-24'
            , 'Morales@gmail.com'
			, 'Masculino'
            , '3124537829'
        );
	
    -- Revisar datos
    
    SELECT * FROM Bitacora_Usuario_log;
    
-- TABLA USUARIOS
-- TERCER TRIGGER DELETE AFTER
-- Este trigger inserta un registro de cada eliminación nueva en la tabla usuarios
	
    DROP TRIGGER IF EXISTS tr_delete_usuarios;
    
    DELIMITER $$
    CREATE TRIGGER tr_delete_usuarios
	BEFORE DELETE ON usuarios
    FOR EACH ROW
    BEGIN
			INSERT INTO Bitacora_Usuario_log (
            id_usuario,
            tipo_movimiento,
			nombre_usuario,
			apellido_usuario,
			contraseña,
			direccion,
			email,
			sexo,
			celular,
            Usuario_registro,
			Fecha,
			Hora 
        )     
         VALUES (
			OLD.id_usuario,
            'Delete',
			OLD.nombre_usuario,
			OLD.apellido_usuario,
			OLD.contraseña,
			OLD.direccion,
			OLD.email,
			OLD.sexo,
			OLD.celular,
            USER(),
            CURDATE(),
            CURTIME()
        );
	END;
    $$ ;
    
    -- Prueba para eliminar un registro
    
	SET FOREIGN_KEY_CHECKS=0; -- Funcion para no chequear llaves foraneas
    
    DELETE FROM usuarios
	WHERE id_usuario= 20;
    
    -- Revisar datos
    SELECT * FROM Bitacora_usuario_log;
         





