use PuntoDeVenta

select*from Puestos

select Empleados.vNombre, Puestos.fSueldo from Empleados left join Puestos on Empleados.iEmpleadoId=Puestos.iPuestosId 
select Productos.vNombre, Proveedores.vEmpresa from Productos left join Proveedores on Productos.iProductosId=Proveedores.iProveedorId

select Domicilio.vCiudad, Sucursales.iDomiciolio from Domicilio right join Sucursales on Domicilio.iDomicilioId=Sucursales.iSucursalId
select Ticket.iEmpleado, TicketDetalle.fTotal from Ticket right join TicketDetalle on Ticket.iTicketId=TicketDetalle.iTickDetalleId

select Empleados.vNomCompleto, Puestos.vDescripcion from Empleados inner join Puestos on Empleados.iEmpleadoId=Puestos.iPuestosId
select Inventario.iSucursal, Sucursales.iSucursalId from Inventario inner join Sucursales on Inventario.iInventarioId=Sucursales.iSucursalId

select vMarca from Productos cross join Proveedores
select vNomCompleto from Empleados cross join Negocio

select*from Productos

select vNombre, fPrecio from Productos where fPrecio=(select max(fPrecio) from Productos)

select vNombre as Nombre into Informacion from Productos 