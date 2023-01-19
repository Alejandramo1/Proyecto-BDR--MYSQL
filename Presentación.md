# Segunda entrega Proyecto SQL para plataforma P2P

👋 **Hola, en el presente documento se describe el objetivo de cada una de las vistas, funciones, Stored Procedures creados para la interacción de la base de datos de una empresa dedicada al comercio electrónico a domicilio bajo el modelo P2P que conecta comercios y establecimientos con usuarios acercándole los productos que ellos desean sin la necesidad de dirigirse directamente, solo por medio de la aplicación o página web.**

**👀VISTAS:**

**1. Creacion vista de top de productos más vendidos
  Nombre:Vw_productos_vendidos** 

El objetivo de esta vista es organizar de mayor a menor las unidades según los ingresos totales generados por la venta del producto ofrecido en la plataforma.

Tablas que relacionan:

1.detalle_orden

2.Productos

**2. Creacion vista top de rappitenderos con mayores ordenes 
  Nombre:Vw_top_rappitenderos** 

Esta vista genera el top de los rappitenderos con mayores ordenes otorgadas, a traves de un Join.

Tablas que relacionan:

1.rappitenderos

2.orden

**3. Metodos de pago más usados
  Nombre:Vw_top_metodo_pago** 

Esta vista ordena de mayor a menor los metodos de pago con mayor uso en la plataforma a través de la unión de la tabla de pagos y orden ordenada por el número de veces usado.

Tablas que relacionan:

1.pagos

2.orden






 
**👀Herramientas BI:**
- Power BI
- Looker Studio
  
 **📫Contacto**   
-  Linkedin: www.linkedin.com/in/amorald
-  Correo : malejamo103@gmail.com

<!---
Alejandramo1/Alejandramo1 is a ✨ special ✨ repository because its `README.md` (this file) appears on your GitHub profile.
You can click the Preview link to take a look at your changes.
--->
