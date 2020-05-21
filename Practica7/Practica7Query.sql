use PuntoDeVenta

select*from Empleados
select*from tipoPago
select*from Proveedores
select*from Ticket
select*from Domicilio
select*from Puestos
select*from Productos 

select vNombre from Empleados where vNombre='Jose'
select iPuesto from Empleados where iPuesto='5'
select vNombre from Empleados where iPuesto='10'
select iTipoPagoId from tipoPago where vDescripcion='Efectivo'
select vNombre from Proveedores where fCosto>10.00

select cTurno, count(*) as Empleados from Empleados group by cTurno
select Edad, count(*) as Empleados from Empleados group by Edad
select vCiudad, count(*) as Domicilio from Domicilio group by vCiudad
select iDomiciolio, count(*) as Sucursales from Sucursales group by iDomiciolio
select fCosto, count(*) as Proveedores from Proveedores group by fCosto

select AVG(fPrecio) As Promedio from Productos 
select max(fPrecio) As 'Precio Mayor' from Productos
select min(fPrecio) As 'Precio Menor' from Productos
select count(*) As 'Cantidad de productos' from Productos
select Sum(fPrecio*iCantidad) As 'Total' from Productos

select*from TicketDetalle

select iTickDetalleId, sum(fPrecio) from TicketDetalle group by iTickDetalleId having sum(fPrecio)>10
select Edad, count(*) from Empleados group by Edad having count(*)>2
select vCiudad, count(*) from Domicilio group by vCiudad having count(*)=1
select fCosto, count(*) from Proveedores group by fCosto having count(*)<2
select AVG(fPrecio) from Productos group by fPrecio having AVG(fPrecio)>15.00

select top 5 * from Domicilio
select top 3 vNombre,Edad from Empleados order by vNombre
select top 2 vMarca from Productos order by fPrecio
select top 10 vEmpresa from Proveedores
select top 7 fPrecio from TicketDetalle order by fPrecio