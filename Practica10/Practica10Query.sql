use PuntoDeVenta

GO

create procedure Empleados_SP @vNombre varchar(20)
as select vNombre, fSueldo from vista_Empleados where vNombre=@vNombre 

execute Empleados_SP 'Jose'

GO
create procedure Empresas_SP @vEmpresa varchar(20)
as select vNombre, vEmpresa from vista_Empresas where vEmpresa=@vEmpresa

execute Empresas_SP 'Nestlé'

GO
create procedure Detalle_SP @iCantidad int
as select Cantidad from vista_Detalle where Cantidad=@iCantidad

execute Detalle_SP '5'

GO
create procedure ProductoP_SP @fPrecio float
as select Precio from vista_ProductoP where Precio=@fPrecio

execute ProductoP_SP '30.00'

GO
create procedure EmpleadoSueldo_SP @fsueldo float 
as select Sueldo from vista_PuestoSueldo where Sueldo=@fsueldo

execute EmpleadoSueldo_SP '1200.25'

GO
create function Total (@iProductosId int)
returns float 
as begin
declare @Total float 
select @Total=(fPrecio * iCantidad) from Productos where iProductosId=@iProductosId 
return @Total
end

select vNombre as Nombre, dbo.Total(1) as total from Productos where iProductosId=1

GO
create function SueldoAnual (@iPuestosId int)
returns float 
as begin 
declare @Sueldo float
select @Sueldo=(fSueldo*12) from Puestos where iPuestosId=@iPuestosId
return @Sueldo
end 

select vDescripcion as Puesto, dbo.SueldoAnual(2) as sueldo from Puestos where iPuestosId=2

GO
create trigger aviso on Empleados instead of insert as print 'Nuevo cambio en la tabla'
insert into Empleados values(16,'Jorge', 'Vázquez', 'Aguirre', 'V', 25874163, '2000/11/27', 10)

GO
create trigger productoagotado on Inventario after update as if (select iCantidad from Inventario) < 10 
begin print 'Producto por agotar' 
end



