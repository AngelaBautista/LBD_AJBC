use PuntoDeVenta

select*from Domicilio
insert into Domicilio values(1, '´Mayas', '4', 'Lagos de Zirándaro', 'Juárez', '67277')
insert into Domicilio values(2, 'Reynosa', '5', 'Revolucion', 'Guadaulpe', '78596')
insert into Domicilio values(3, 'Leal', '6', 'Arcos', 'Juarez', '74125')
insert into Domicilio values(4, 'Cruz', '7', 'Portal', 'Juarez', '25896')
insert into Domicilio values(5, 'Azteca','8', 'Enredadera', 'San Nicolas', '58963')
insert into Domicilio values(6, 'San Franciso', '9', 'Hector Caballero', 'Escobedo', '48978')
insert into Domicilio values(7, 'Rendon', '10', 'Privadas del Rey', 'China', '28964')
insert into Domicilio values(8, 'Primavera', '11', 'Tres Caminos', 'Guadalupe', '15893')
insert into Domicilio values(9, 'Eloy Cavazos', '12', 'Olmos', 'Guadalupe', '54782')
insert into Domicilio values(10, 'Asia', '13', 'Azteca', 'Apodaca', '123456')

select*from Empleados
select*from Puestos



insert into Empleados values(2,'Alberto', 'Becerra', 'Ramírez', 'M', 45796423, '1994/07/27', 1)
insert into Puestos values(2, 'Cajera',1400.50)
insert into Empleados values(3,'Cesar','Leal', 'Ramírez', 'T', 27598645, '1997/10/8',1)
update Empleados set cTurno='V' where cTurno='T'
insert into Empleados values(4, 'Valeria','Bautista','Acosta', 'V',58963214, '2002/12/12',3)
insert into Puestos values(3, 'Vendedor', 1200.25)
insert into Empleados values(5, 'Ana Laura', 'Cruz', 'Montero', 'M', 27416389, '1974/04/29', 3)
insert into Empleados values(6, 'Ruben','Bautista','Rodriguez','N',29684572,'1977/03/15',3)
insert into Empleados values(7, 'Kaleb', 'Pérez', 'Villareal', 'M', 45961287,'1998/06/13',4)
insert into Empleados values(8, 'Alejandra','Buentello','López','N',12345678,'2000/02/27',6)
insert into Empleados values(9, 'Vanesa', 'Caballero', 'Zapata','N',78945612,'1996/01/31',10)
insert into Empleados values(10, 'Zurisadai', 'Vielma', 'Reyna', 'M', 45789632, '2000/09/30',5)
insert into Puestos values(2, 'Limpieza', '1100.68')
insert into Puestos values(4, 'Distribuidor', '1500.23')
insert into Puestos values(5, 'Gerente', '2100.58')
insert into Puestos values(6, 'Chofer', '1400.49')
insert into Puestos values(7, 'Supervisor', '6000.74')
insert into Puestos values(8, 'Sub-gerente', '1500.78')
insert into Puestos values(9, 'Soporte Tecnico','3000.25')
insert into Puestos values(10, 'Asistente telefónico',2000.00)

use PuntoDeVenta
select*from Productos
insert into Productos values (1, 'Refreso de cola', 'Coca-Cola', '25.00', 50)
insert into Productos values (2, 'Leche entera', 'Lala', '15.00', 50)
insert into Productos values (3, 'Harina', 'Selecta', '20.00', 30)
insert into Productos values (4, 'Chips fuego', 'Barcel', '13.00',80)
insert into Productos values (5, 'Sopa de trigo', 'Moderna', '10.00', 100)
insert into Productos values (6, 'Pan blanco', 'Bimbo', '30.00', 50)
insert into Productos values (7, 'Café', 'Nescafe', '15.00', 50)
insert into Productos values (8, 'Galletas', 'Gamesa', '14.00', 50)
insert into Productos values (9, 'Condimento alimenticio', 'Knor', '5.00', 50)
insert into Productos values (10, 'Pan', 'Marinela', '15.00', 45)

select*from Proveedores

insert into Proveedores values (1, 1, 'Coca Cola', 'Coca Cola Company', '15.25')
insert into Proveedores values (2, 2, 'Lala', 'Grupo Lala', '10.68')
insert into Proveedores values (3, 3, 'Selecta', 'Molinera de México', '10.50')
insert into Proveedores values (4, 4, 'Barcel', 'Barcel', '8.69')
insert into Proveedores values (5, 5, 'Moderna', 'La Moderna', '5.25')
insert into Proveedores values (6, 6, 'Bimbo', 'Grupo Bimbo', '15.45')
insert into Proveedores values (7, 7, 'Nescafe', 'Nestlé', '7.29')
insert into Proveedores values (8, 8, 'Gamesa', 'Grupo Gamesa', '8.69')
insert into Proveedores values (9, 9, 'Knor', 'Knorr', '3.25')
insert into Proveedores values (10, 10, 'Marinela', 'Marinela Mexico', '7.45')

select*from Puestos
select*from Domicilio
select*from Empleados

update Empleados set iPuesto='5' where iPuesto='3'
insert into Empleados values (11, 'Iker', 'Mendoza', 'Puentes', 'V', 59273641, '2001/08/06', 5) 
insert into Empleados values (12, 'Kira', 'Barrientos', 'Padilla', 'M', 12789645, '1989/05/10',5)
insert into Empleados values (13, 'Nala', 'Castillo', 'Villafuerte', 'N', 45782319, '1999/06/12',5)
insert into Empleados values (14, 'Oscar', 'Ríos', 'Villanueva', 'M', 12457836, '1991/12/24', 5)
insert into Empleados values (15, 'Edson', 'Martínez', 'Leija', 'V', 69584712, '1992/10/10', 5)
insert into Empleados values (16, 'Astrid', 'Peña', 'Flor', 'V', 14253689, '1994/09/07',5)
insert into Empleados values (17, 'Karen', 'Ortiz', 'De Lira', 'M', 412457812, '1993/04/20',5)

select*from Sucursales
select*from Domicilio
select*from Empleados

insert into Sucursales values (1, 4, 1)
insert into Sucursales values (2, 5, 2)
insert into Sucursales values (3, 6, 3)
insert into Sucursales values (4, 10, 4)
insert into Sucursales values (5, 11, 5)
insert into Sucursales values (6, 12, 6)
insert into Sucursales values (7, 13, 7)
insert into Sucursales values (8, 14, 8)
insert into Sucursales values (9, 15, 9)
insert into Sucursales values (10, 16, 10)

select*from Domicilio
select*from Empleados
select*from Inventario
select*from Negocio
select*from Pedido
select*from PedidoDetalle
select*from Productos
select*from Proveedores
select*from Puestos
select*from Sucursales
select*from Ticket
select*from TicketDetalle
select*from tipoPago

insert into tipoPago values (1, 'Efectivo')
insert into tipoPago values (2, 'Efectivo')
insert into tipoPago values (3, 'Tarjeta')
insert into tipoPago values (4, 'Vales de despensa')
insert into tipoPago values (5, 'Mixto')
insert into tipoPago values (6, 'Mixto')
insert into tipoPago values (7, 'Tarjeta')
insert into tipoPago values (8, 'Vales de despensa')
insert into tipoPago values (9, 'Efectivo')
insert into tipoPago values (10, 'Mixto')

select*from Negocio
select*from Empleados
select*from Domicilio

insert into Negocio values (1, 4, 89562314, 1)
insert into Negocio values (2, 5, 12457836, 2)
insert into Negocio values (3, 6, 35781429, 3)
insert into Negocio values (4, 10, 15987530, 4)
insert into Negocio values (5, 11, 56782143, 5)
insert into Negocio values (6, 12, 37681942, 6)
insert into Negocio values (7, 13, 12985437, 7)
insert into Negocio values (8, 14, 13467790, 8)
insert into Negocio values (9, 17, 37681204, 9)
insert into Negocio values (10, 16, 03142730, 10)

select*from Inventario
select*from Sucursales
select*from Productos

insert into Inventario values (1, 1, 1, 50)
insert into Inventario values (2, 2, 2, 45)
insert into Inventario values (3, 3, 3, 40)
insert into Inventario values (4, 4, 4, 35)
insert into Inventario values (5, 5, 5, 30)
insert into Inventario values (6, 6, 6, 30)
insert into Inventario values (7, 7, 7, 35)
insert into Inventario values (8, 8, 8, 40)
insert into Inventario values (9, 9, 9, 45)
insert into Inventario values (10, 10, 10, 50)

select*from Pedido
delete from Pedido
insert into Pedido values (1, 1, '2010/07/22')
insert into Pedido values (2, 2, '2011/11/18')
insert into Pedido values (3, 3, '2012/11/12')
insert into Pedido values (4, 4, '2013/11/25')
insert into Pedido values (5, 5, '2014/11/17')
insert into Pedido values (6, 6, '2015/11/13')
insert into Pedido values (7, 7, '2014/07/27')
insert into Pedido values (8, 8, '2015/10/23')
insert into Pedido values (9, 9, '2018/06/23')
insert into Pedido values (10, 10, '2020/03/27')

select*from Ticket
select*from Negocio
select*from Empleados

insert into Ticket values (1, '2015/12/24', 1, 1)
insert into Ticket values (2, '2016/01/12', 2, 2)
insert into Ticket values (3, '2017/08/29', 3, 3)
insert into Ticket values (4, '2017/09/13', 4, 4)
insert into Ticket values (5, '2018/02/01', 5, 5)
insert into Ticket values (6, '2019/10/22', 6, 6)
insert into Ticket values (7, '2020/11/20', 7, 7)
insert into Ticket values (8, '2020/01/25', 8, 8)
insert into Ticket values (9, '2020/07/07', 9, 9)
insert into Ticket values (10, '2020/07/16', 10, 10)

select*from TicketDetalle
select*from Productos

insert into TicketDetalle values (1, 1, 1, 2, 50.00, 50.00)
insert into TicketDetalle values (2, 2, 2, 1, 15.00, 15.00)
insert into TicketDetalle values (3, 3, 3, 1, 20.00, 20.00)
insert into TicketDetalle values (4, 4, 4, 4, 52.00, 52.00)
insert into TicketDetalle values (5, 5, 5, 10, 100.00, 100.00)
insert into TicketDetalle values (7, 7, 7, 1, 15.00, 15.00)
insert into TicketDetalle values (8, 8, 8, 3, 42.00, 42.00)
insert into TicketDetalle values (9, 9, 9, 5, 25.00, 25.00)
insert into TicketDetalle values (10, 10, 10, 2, 30.00, 30.00)

select*from PedidoDetalle
select*from Pedido
select*from Productos

insert into PedidoDetalle values (1, 1, 'Refesco de cola', 1)
insert into PedidoDetalle values (2, 2, 'Leche Entera', 3)
insert into PedidoDetalle values (3, 3, 'Harina', 2)
insert into PedidoDetalle values (4, 4, 'Chips Fuego', 5)
insert into PedidoDetalle values (5, 5, 'Sopa de trigo', 10)
insert into PedidoDetalle values (6, 6, 'Pan Blanco', 2)
insert into PedidoDetalle values (7, 7, 'Cafe', 4)
insert into PedidoDetalle values (8, 8, 'Galletas', 6)
insert into PedidoDetalle values (9, 9, 'Condimento alimenticio', 9)
insert into PedidoDetalle values (10, 10, 'Pan', 3)

select*from Domicilio
update Domicilio set vCalle='Callejon Rendon' where vCalle='Leal' 
update Domicilio set vCalle='San Francisco' where vCalle='San Franciso'
update Domicilio set vCalle='Olmeca' where vCalle='Eloy Cavazos'
update Domicilio set vCalle='Verano' where vCalle='Primavera'
update Domicilio set vCalle='Balcones' where vCalle='Cruz'

select*from Empleados
update Empleados set vNombre='Adalberto' where vNombre='Cesar'
update Empleados set vNombre='Kaleb' where vNombre='Iker'
update Empleados set vNombre='Vanessa' where vNombre='Vanesa'
update Empleados set vNombre='Laura' where vNombre='Ana Laura'
update Empleados set vNombre='Karina' where vNombre='Alejandra'

select*from tipoPago

delete from tipoPago where iTipoPagoId='5'
delete from tipoPago where iTipoPagoId='10'
delete from tipoPago where iTipoPagoId='2'
delete from tipoPago where vDescripcion='Mixto'