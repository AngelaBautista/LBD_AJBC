use PuntoDeVenta

create view vista_Empleados as select Empleados.vNombre, Puestos.fSueldo from Empleados left join Puestos on Empleados.iEmpleadoId=Puestos.iPuestosId
select*from vista_Empleados

create view vista_Empresas as select Productos.vNombre, Proveedores.vEmpresa from Productos left join Proveedores on Productos.iProductosId=Proveedores.iProveedorId
select*from vista_Empresas

create view vista_Detalle as select AVG(iCantidad) Cantidad from PedidoDetalle group by vProdPedido having AVG(iCantidad)<10
select*from vista_Detalle

create view vista_ProductoP as select AVG(fPrecio) Precio from Productos group by fPrecio having AVG(fPrecio)>15.00
select*from vista_ProductoP

create view vista_PuestoSueldo as select AVG(fSueldo) Sueldo from Puestos group by fSueldo having AVG(fSueldo)<2000.00
select*from vista_PuestoSueldo