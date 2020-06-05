
/* 1. Consulta la facturación de un cliente en específico. */
SELECT numero_identificacion, SUM(total_a_pagar) AS total_facturacion
FROM facturacion
GROUP BY numero_identificacion
HAVING numero_identificacion = '20555629541';

/* 2. Consulta la facturación de un producto en específico. */
SELECT detalles.id_producto, SUM(detalles.productos_comprados) AS productos_vendidos,
productos.precio, (SUM(detalles.productos_comprados) * productos.precio) AS total_facturacion
FROM detalles INNER JOIN productos
ON detalles.id_producto = productos.id_producto
GROUP BY detalles.id_producto
HAVING detalles.id_producto = 'AR22';

/* 
  3. Consulta la facturación de un rango de fechas.
  (Monto total de ventas entre el 01 Abril 2018 y el 31 Mayo del 2018)
*/
SELECT SUM(total_a_pagar) AS monto_facturacion FROM facturacion WHERE fecha BETWEEN '2018-04-01' AND '2018-05-31';


/*
  4.	De la facturación, consulta los clientes únicos
  (es decir, se requiere el listado de los clientes que han comprado 
  por lo menos una vez, pero en el listado no se deben repetir los clientes)
*/
SELECT DISTINCTROW(clientes.numero_identificacion), clientes.nombre, clientes.pais
FROM clientes INNER JOIN facturacion
on clientes.numero_identificacion = facturacion.numero_identificacion;