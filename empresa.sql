-- Creación de tablas
CREATE TABLE CLIENTES (
    CODIGO NUMBER PRIMARY KEY,
    NOMBRE VARCHAR2(100),
    TELEFONO VARCHAR2(15)
);

CREATE TABLE PROVEEDORES (
    CODIGO NUMBER PRIMARY KEY,
    NOMBRE VARCHAR2(100),
    TELEFONO VARCHAR2(15)
);

CREATE TABLE PRODUCTOS (
    CODIGO NUMBER PRIMARY KEY,
    NOMBRE VARCHAR2(100),
    PRECIO NUMBER(10,2),
    COD_PROVEEDOR NUMBER,
    FOREIGN KEY (COD_PROVEEDOR) REFERENCES PROVEEDORES(CODIGO)
);

CREATE TABLE STOCK (
    CODIGO NUMBER PRIMARY KEY,
    CANTIDAD NUMBER,
    FOREIGN KEY (CODIGO) REFERENCES PRODUCTOS(CODIGO)
);

CREATE TABLE COMPRAS (
    COD_CLIENTE NUMBER,
    COD_PRODUCTO NUMBER,
    FECHA DATE,
    CANTIDAD NUMBER,
    PAGADO VARCHAR2(2),
    FOREIGN KEY (COD_CLIENTE) REFERENCES CLIENTES(CODIGO),
    FOREIGN KEY (COD_PRODUCTO) REFERENCES PRODUCTOS(CODIGO)
);

-- Inserción de datos
INSERT INTO CLIENTES VALUES (1, 'Ramón Torres', '111111111');
INSERT INTO CLIENTES VALUES (2, 'María López', '222222222');
INSERT INTO CLIENTES VALUES (3, 'Paloma Ruiz', '333333333');
INSERT INTO CLIENTES VALUES (4, 'Isabel Perea', '444444444');
INSERT INTO CLIENTES VALUES (5, 'Luisa Marín', '555555555');
INSERT INTO CLIENTES VALUES (6, 'Pedro Macias', '666666666');
INSERT INTO CLIENTES VALUES (7, 'Teresa Vilchez', '777777777');
INSERT INTO CLIENTES VALUES (8, 'Ricardo Muñoz', '888888888');
INSERT INTO CLIENTES VALUES (9, 'Muriel Mina', '999999999');

INSERT INTO PROVEEDORES VALUES (1, 'Putis SA', '101010101');
INSERT INTO PROVEEDORES VALUES (2, 'Distribuciones SL', '202020202');
INSERT INTO PROVEEDORES VALUES (3, 'Frutas SA', '303030303');
INSERT INTO PROVEEDORES VALUES (4, 'Frutas Rocio SL', '404040404');

INSERT INTO PRODUCTOS VALUES (1, 'melon', 0.6, 4);
INSERT INTO PRODUCTOS VALUES (2, 'sandia', 0.7, 3);
INSERT INTO PRODUCTOS VALUES (3, 'manzana', 1.2, 3);
INSERT INTO PRODUCTOS VALUES (4, 'tomate', 1.5, 2);
INSERT INTO PRODUCTOS VALUES (5, 'papaya', 0.3, 2);
INSERT INTO PRODUCTOS VALUES (6, 'patata', 0.1, 2);

INSERT INTO STOCK VALUES (1, 100);
INSERT INTO STOCK VALUES (2, 150);
INSERT INTO STOCK VALUES (3, 75);
INSERT INTO STOCK VALUES (4, 89);
INSERT INTO STOCK VALUES (5, 128);
INSERT INTO STOCK VALUES (6, 35);

INSERT INTO COMPRAS VALUES (1, 1, '21/05/2025', 2, 'SI');
INSERT INTO COMPRAS VALUES (1, 3, '15/05/2025', 3, 'SI');
INSERT INTO COMPRAS VALUES (1, 4, '10/05/2025', 1, 'NO');
INSERT INTO COMPRAS VALUES (2, 3, '12/05/2025', 5, 'NO');
INSERT INTO COMPRAS VALUES (2, 5, '13/05/2025', 8, 'SI');
INSERT INTO COMPRAS VALUES (3, 1, '22/05/2025', 5, 'NO');
INSERT INTO COMPRAS VALUES (3, 4, '05/05/2025', 3, 'NO');
INSERT INTO COMPRAS VALUES (4, 4, '13/05/2025', 5, 'SI');
INSERT INTO COMPRAS VALUES (5, 3, '10/05/2025', 3, 'NO');
INSERT INTO COMPRAS VALUES (5, 6, '10/05/2025', 6, 'NO');
INSERT INTO COMPRAS VALUES (5, 1, '13/05/2025', 2, 'SI');
INSERT INTO COMPRAS VALUES (4, 3, '11/05/2025', 5, 'NO');
INSERT INTO COMPRAS VALUES (9, 6, '12/05/2025', 4, 'SI');
INSERT INTO COMPRAS VALUES (3, 6, '15/05/2025', 6, 'NO');
INSERT INTO COMPRAS VALUES (4, 4, '20/05/2025', 2, 'SI');
INSERT INTO COMPRAS VALUES (3, 4, '21/05/2025', 1, 'NO');
INSERT INTO COMPRAS VALUES (4, 4, '22/05/2025', 4, 'SI');
INSERT INTO COMPRAS VALUES (9, 1, '15/05/2025', 5, 'NO');
INSERT INTO COMPRAS VALUES (9, 1, '13/05/2025', 1, 'SI');
INSERT INTO COMPRAS VALUES (7, 3, '12/05/2025', 2, 'NO');
INSERT INTO COMPRAS VALUES (2, 5, '11/05/2025', 1, 'NO');
INSERT INTO COMPRAS VALUES (6, 4, '22/05/2025', 9, 'SI');

//Disparadores II//

1. Crear un disparador que controle la inserción de productos. Si se inserta un
producto con un precio inferior a 0.5€/kilo dar un aviso de que el precio es muy
bajo. Además, independientemente del precio se deberá dar un aviso de que es
necesario introducir también el stock.

CREATE OR REPLACE TRIGGER avisoProducto
AFTER INSERT ON productos 
FOR EACH ROW
DECLARE
BEGIN
    IF (:new.precio < 0.5) THEN
    dbms_output.put_line('Precio demasiado bajo');
    END IF;
    dbms_output.put_line('Es necesario incluir el stock');
END;    

2. Crear un disparador que cada vez que se inserte una compra actualice el stock del
producto comprado. Además si el stock del producto baja de 15 kilos el disparador
dará un aviso de que hay poco stock y hay que avisar al proveedor. Para ello
deberá mostrar los datos del proveedor al que hay que llamar

CREATE OR REPLACE TRIGGER actuStock
AFTER INSERT ON compras 
FOR EACH ROW
DECLARE
    proveedor proveedores%ROWTYPE;
BEGIN
    UPDATE stock SET cantidad = cantidad - :new.cantidad WHERE codigo = :new.cod_producto;
    IF (SELECT cantidad FROM stock WHERE codigo = :new.cod_producto) < 15) THEN
    SELECT * INTO proveedor FROM proveedores JOIN productos ON :new.cod_producto = productos.codigo WHERE :new.cod_producto = 
    dbms_output.put_line('Este producto tiene poco Stock');
    END IF;
END;

3. Crear un procedimiento almacenado que reciba el nombre de un cliente y muestre
por pantalla una factura con los pedidos que aún no ha pagado. Se le mostrará el
precio total de cada compra. Los resultados deben mostrarse ordenados por fecha
de compra.



4. Crear un procedimiento almacenado que reciba una fecha y muestre las compras
que se hicieron en esa fecha. El procedimiento mostrará las compras agrupadas
por clientes. De esta forma para cada cliente mostrará todas las compras con el
precio total de dicha compra y al final el dinero que el cliente debe, es decir sólo de
las compras que no haya pagado.

CREATE OR REPLACE TRIGGER modificPrecio
AFTER UPDATE ON productos.precio FOR EACH ROW
DECLARE 
    diferencia NUMBER := :new - sold;
BEGIN
    IF(diferencia > 0) THEN
    dbms_output.put_line('Este PRODUCTO HA AUMENTADO SU PRECIO EN ' || diferencia || $);
    IF(diferencia < 0) THEN
    dbms_output.put_line('Este PRODUCTO HA disminuido SU PRECIO EN '  || diferencia || $);
    ELSE
    dbms_output.put_line('Este producto no ha cambiado de precio');
    END IF;
END;

5. Crear un disparador que no permita borrar una compra si ya está pagada. Por
ahora es suficiente con dar un aviso de que no se pueden borrar compras que ya
estén pagadas.

CREATE OR REPLACE TRIGGER borrarCompraPagada
BEFORE DELETE ON compras 
FOR EACH ROW WHEN old.pagado = 'SI'
DECLARE
BEGIN
dbms_output.put_line('Cuenta pagada, no se puede borrar el registro');
ROLLBACK
END;

6. Crear un disparador que controle los precios de los productos. De esta forma,
cuando se quiera modificar el precio de un producto, el disparador controlará el
cambio y dará un aviso del precio que se ha subido o bajado. Si la subida es de más
del 10% deberá avisar de que no es bueno subir tanto de una vez.

7. Crear un disparador que controle el stock de los productos. Cuando se modifique el
stock de un producto, este disparador controlará si se ha subido o se ha bajado. Si
se ha subido deberá avisar de que hay que revisar el precio del producto si se ha
bajado mostrará es stock actual.

8. Crear un procedimiento almacenado que reciba un nombre. El nombre puede ser
de un producto o de un cliente. El procedimiento controlará qué se ha introducido.
Si se ha introducido un producto el procedimiento deberá mostrar por pantalla los
datos de dicho producto, el stock disponible y el número total de kilos que se han
vendido. Si lo que se ha introducido es el nombre de un cliente el procedimiento
mostrará los datos del cliente junto con el total que debe en género. Si el cliente no
debe nada se dará el aviso "cliente al día en pagos"

9. Crear un disparador que se ejecute cuando se trate de modificar el estado de una
compra. Si el cambio es de "no" a "si" se mostrará por pantalla el precio total que
ha pagado y los datos del cliente. Si el cambio es de "si" a "no" se mostrará un
mensaje que indique que dicho cambio no se puede realizar.

CREATE OR REPLACE TRIGGER cambiarEstadoCompra
AFTER UPDATE OF pagado ON compras FOR EACH ROW
DECLARE
cliente clientes%ROWTYPE;
BEGIN
IF(:new.pagado = 'SI') THEN
SELECT * INTO cliente FROM clientes WHERE codigo = :new.cod_cliente;
dbms_output.put_line();
ELSE IF (:new.pagado = 'NO') THEN
END IF
END;

10. Crear un procedimiento almacenado que reciba el nombre de un proveedor y
muestre por pantalla: los datos de todos los productos que distribuye dicho
proveedor y para cada uno de los producto deberá mostrar el stock disponible y
todas las ventas realizadas (incluyendo precio total de cada venta)

11. Crear un procedimiento almacenado que reciba el nombre de un cliente y una
cadena con un SI o un NO. El procedimiento devolverá el precio total de las
compras que dicho cliente tenga o no tenga pagadas (depende de la cadena
introducida).

12. Crear un disparador que controle la introducción de nuevas compras. El
disparador deberá controlar que no se introduzcan compras realizadas ni dentro
de más de 3 días ni hace más de 4 días.

13. Crear un procedimiento almacenado que reciba una fecha y devuelva el total de
ingresos en esa fecha y el nombre del cliente que hizo el mayor gasto. 
