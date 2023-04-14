-- ¿Cuántos empleados tenemos en total?
SELECT count(idEmpleado) as Cantidad_Empleados 
FROM empleados;

-- ¿Cuál es el empleado con el salario más alto?
SELECT nombreEmpleado, apellidoEmpleado, max(salarioEmpleado) as MejorPagado
FROM empleados;

-- ¿Cuál es el cliente que ha hecho más pedidos?
SELECT  p.idCliente, c.nombreCliente, c.apellidoCliente, SUM(dp.cantidadPedidos) AS total
FROM clientes AS c
INNER JOIN pedidos AS p ON c.idCliente = p.idCliente
INNER JOIN detalle_pedidos AS dp ON p.idPedido = dp.idPedido
GROUP BY c.nombreCliente
ORDER BY total desc
LIMIT 1;

-- ¿Cuál es el producto con el precio más alto?
SELECT idMercaderia, nombreMercaderia, MAX(precioMercaderia) AS total
FROM mercaderia
GROUP BY idMercaderia
ORDER BY total desc
LIMIT 1;

-- ¿Cuántas unidades de un producto específico tenemos en stock?
SELECT m.idMercaderia ,m.nombreMercaderia, m.cantidadStock, dp.cantidadPedidos
FROM mercaderia AS m
INNER JOIN detalle_pedidos AS dp ON m.idMercaderia = dp.idMercaderia
GROUP BY m.idMercaderia
ORDER BY m.cantidadStock DESC;


-- ¿Cuántos pedidos se hicieron en un mes específico?
SELECT month(p.fechaPedido) as mes, count(dp.cantidadPedidos) as totalPedidos
FROM pedidos AS p
INNER JOIN detalle_pedidos AS dp ON p.idPedido = dp.idPedido
GROUP BY mes
ORDER BY totalPedidos desc;

-- ¿Cuál es el empleado que ha vendido más en términos de dinero?
SELECT p.idEmpleado, e.nombreEmpleado, e.apellidoEmpleado, sum(m.precioMercaderia * dp.cantidadPedidos) as DineroVendido
FROM empleados AS e
INNER JOIN pedidos AS p ON e.idEmpleado = p.idEmpleado
INNER JOIN detalle_pedidos AS dp ON p.idPedido = dp.idPedido
INNER JOIN mercaderia AS m ON dp.idMercaderia = m.idMercaderia
GROUP BY p.idEmpleado
ORDER BY DineroVendido desc
LIMIT 1;

