-- Primer paso: Creamos la base de datos

CREATE DATABASE proyectofinal;

-- Segundo Paso: La ponemos en uso

USE proyectofinal;

-- Tercer Paso: Comenzamos con la creación de las tablas detalladas en el diagrama de entidad relación

CREATE TABLE clientes (
	dni INT NOT NULL,
    nombre TEXT(50),
    apellido TEXT(50),
    fechadenacimiento DATE,
    edad INT,
    domicilio_calle TEXT(30),
    domicilio_altura INT,
    domicilio_piso INT,
    domicilio_depto VARCHAR(3),
    domicilio_localidad TEXT(20),
    domicilio_provincia TEXT(19),
	PRIMARY KEY (dni)
    );
    
CREATE TABLE plazosfijos (
	idplazofijo INT NOT NULL AUTO_INCREMENT,
    dni INT NOT NULL,
    capital DOUBLE NOT NULL,
    intereses DOUBLE NOT NULL,
    tasa DOUBLE NOT NULL,
    vigencia_desde DATE NOT NULL,
    vigencia_hasta DATE NOT NULL,
    idcajaahorro INT NOT NULL,
	PRIMARY KEY (idplazofijo)
    );

CREATE TABLE cajasdeahorro (
	idcajaahorro INT NOT NULL AUTO_INCREMENT,
    alias VARCHAR(20) NOT NULL,
    cbu INT NOT NULL,
    dni INT NOT NULL,
    saldo DOUBLE NOT NULL,
    id_moneda INT NOT NULL,
    PRIMARY KEY (idcajaahorro)
    );
    
CREATE TABLE monedas (
	id_moneda INT AUTO_INCREMENT NOT NULL,
    descripcion VARCHAR(10),
    PRIMARY KEY (id_moneda)
    );
    
CREATE TABLE tarjetasdecredito (
	idtarjetacredito INT NOT NULL AUTO_INCREMENT,
    dni INT NOT NULL,
    saldotc DOUBLE NOT NULL,
    cuentacorriente INT NOT NULL,
    PRIMARY KEY (idtarjetacredito)
    );
    
CREATE TABLE cuentascorrientes (
	idcuentacorriente INT NOT NULL AUTO_INCREMENT,
    alias VARCHAR(20) NOT NULL,
    cbu INT NOT NULL,
    dni INT NOT NULL,
    saldo DOUBLE NOT NULL,
    id_moneda INT NOT NULL,
    PRIMARY KEY (idcuentacorriente)
    );
    
-- Cuarto Paso: Una vez creadas las tablas, definimos las relaciones entre ellas


ALTER TABLE plazosfijos
ADD FOREIGN KEY (dni) REFERENCES clientes(dni),
ADD FOREIGN KEY (idcajaahorro) REFERENCES cajasdeahorro(idcajaahorro) ;

ALTER TABLE cajasdeahorro
ADD FOREIGN KEY (dni) REFERENCES clientes(dni),
ADD FOREIGN KEY (id_moneda) REFERENCES monedas(id_moneda) ;

ALTER TABLE tarjetasdecredito
ADD FOREIGN KEY (dni) REFERENCES clientes(dni),
ADD FOREIGN KEY (cuentacorriente) REFERENCES cuentascorrientes(idcuentacorriente);

ALTER TABLE cuentascorrientes
ADD FOREIGN KEY (dni) REFERENCES clientes(dni),
ADD FOREIGN KEY (id_moneda) REFERENCES monedas(id_moneda) ;