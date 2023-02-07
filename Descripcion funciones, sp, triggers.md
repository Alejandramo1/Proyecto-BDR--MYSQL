# Segunda entrega Proyecto SQL para plataforma P2P

👋 **Hola, en el presente documento se describe el objetivo de cada una de las vistas, funciones, Stored Procedures y triggers creados para la interacción de la base de datos de una empresa dedicada al comercio electrónico a domicilio bajo el modelo P2P que conecta comercios y establecimientos con usuarios acercándole los productos que ellos desean sin la necesidad de dirigirse directamente, solo por medio de la aplicación o página web.**

**👀VISTAS:**

**1. Creacion vista de top de productos más vendidos
  Nombre:Vw_productos_vendidos** 

El objetivo de esta vista es organizar de mayor a menor las unidades según los ingresos totales generados por la venta del producto ofrecido en la plataforma.

Tablas que relacionan:

1.Detalle_orden

2.Productos

**2. Creacion vista top de rappitenderos con mayores ordenes 
  Nombre:Vw_top_rappitenderos** 

Esta vista genera el top de los rappitenderos con mayores ordenes otorgadas, a traves de un Join.

Tablas que relacionan:

1.Rappitenderos

2.Orden

**3. Metodos de pago más usados
Nombre:Vw_top_metodo_pago** 

Esta vista ordena de mayor a menor los metodos de pago con mayor uso en la plataforma a través de la unión de la tabla de pagos y orden según el número de veces usado de forma descendiente.

Tablas que relacionan:

1.Pagos

2.Orden

**4. Top de vendedores con mayor número de ordenes
Nombre:Vw_top_vendedores** 

Esta vista genera un listado de los vendedores con mayor número de ordenes en la plataforma a través de la unión de la tabla de vendedor y orden.

Tablas que relacionan:

1.Vendedor

2.Orden

**5. Top de Usuarios con más numero de ordenes en rappi
Nombre:Vw_top_usuarios** 

Esta vista genera un listado de los usuarios ordenados de mayor a menor según el numero de ordenes realizadas en la plataforma a través de la unión de la tabla de usuarios y orden.

Tablas que relacionan:

1.Usuarios

2.Orden


**👀FUNCIONES:**

**1. Nombre:fnnum_compras** 

Esta función calcula el numero de compras que ha realizado un usuario ingresando el id.

Tablas que relacionan:

1.Usuarios

2.Orden

**2. Nombre:fncat_prod_vendidos** 

Esta función ingresando el id del producto regresa la categoría a la cual pertenece dicho producto.

Tabla que relaciona:

1.Productos

**3. Nombre:fnund_vendidas_cat** 

Esta función ingresando la categoría a evaluar devuelve el numero de productos vendidos que pertenecen a dicha categoría.

Tablas que relacionan:

1.Productos

2.Detalle orden


**👀STORED PROCEDURES:**

**1. Nombre:sp_nueva_orden**

Crea un procedimiento almacenado para ingresar datos de usuarios nuevos en la tabla de usuarios según los valores de entrada. Lo que permite agilizar la inserción de nuevos datos a la tabla.

Tablas que relaciona:

1.Orden.

**2. Nombre:sp_detalle_orden**

Diligencia la tabla detalle de orden especificando los productos y la cantidad de cada uno de ellos, ademas de asociarlo con el precio establecido en la tabla productos, realiza el calculo del valor de la orden, multiplicando la cantidad por el precio y actualizandolo en el campo "total" de la tabla orden.
	
Tablas que relaciona:

1.Orden.
2.Detalle orden

**3. Nombre:sp_vendedores** 

Crea un procedimiento almacenado para consultar todas las filas de la tabla de vendedores según un campo de ordenación ingresado ya sea de manera ascendente o descendente.

Tablas que relacionan:

1.Vendedor

**4. Nombre:sp_usuario_nuevo** 

Crea un procedimiento almacenado para ingresar datos de usuarios nuevos en la tabla de usuarios según los valores de entrada. Lo que permite agilizar la inserción de nuevos datos a la tabla.

Tablas que relacionan:

1.Usuarios

**👀TRIGGERS:**

**1. Triggers en tabla vendedor** 

Se crearon 3 triggers para la tabla vendedor con el fin de almacenar en una tabla denominada Bitacora_vendedor_log el tipo de movimiento realizado, el usuario, fecha y hora en la cual se registro la novedad.

Listado de triggers Vendedor:

-tr_insert_vendedor

-tr_update_vendedor

-tr_delete_vendedor

**2. Triggers en tabla usuarios** 

Se crearon 3 triggers para la tabla usuarios la cual almacena en una tabla denominada Bitacora_Usuario_log el tipo de movimiento realizado, el usuario, fecha y hora en la cual se registro la novedad.

Listado de triggers usuarios:

-tr_insert_usuarios

-tr_update_usuarios

-tr_delete_usuarios


<!---
Alejandramo1/Alejandramo1 is a ✨ special ✨ repository because its `README.md` (this file) appears on your GitHub profile.
You can click the Preview link to take a look at your changes.
--->
