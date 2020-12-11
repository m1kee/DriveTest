if exists (select name from sys.tables where name = 'alternativa')
begin
	print 'Eliminando tabla: alternativa...'; 
	drop table alternativa;
	print 'Tabla alternativa eliminada...';
end

if exists (select name from sys.tables where name = 'imagen')
begin
	print 'Eliminando tabla: imagen...'
	drop table imagen;
	print 'Tabla imagen eliminada...'
end

if exists (select name from sys.tables where name = 'pregunta')
begin
	print 'Eliminando tabla: pregunta...'; 
	drop table pregunta;
	print 'Tabla pregunta eliminada...';
end

if exists (select name from sys.tables where name = 'tipo_pregunta')
begin
	print 'Eliminando tabla: tipo_pregunta...'; 
	drop table tipo_pregunta;
	print 'Tabla tipo_pregunta eliminada...';
end

if exists (select name from sys.tables where name = 'usuario')
begin
	print 'Eliminando tabla: usuario...'; 
	drop table usuario;
	print 'Tabla usuario eliminada...';
end

if exists (select name from sys.tables where name = 'tipo_usuario')
begin
	print 'Eliminando tabla: tipo_usuario...'; 
	drop table tipo_usuario;
	print 'Tabla tipo_usuario eliminada...';
end



print 'Creando tabla tipo_pregunta...';
create table tipo_pregunta
(
	id int identity primary key,
	descripcion_tipo_pregunta varchar(50) not null,
);
print 'Tabla tipo_pregunta creada...';

print 'Creando tabla pregunta...';
create table pregunta
(
	id int identity primary key,
	id_tipo_pregunta int foreign key references tipo_pregunta(id),
	descripcion_pregunta varchar(1000) not null,
	comentario varchar(500) null,
	alternativas_aleatorias bit not null
);
print 'Tabla pregunta creada...';

print 'Creando tabla alternativa...';
create table alternativa
(
	id int identity primary key,
	id_pregunta int foreign key references pregunta(id),
	descripcion_alternativa varchar(1000) not null,
	es_correcta bit not null
);
print 'Tabla alternativa creada...';

print 'Creando tabla imagen...';
create table imagen
(
	id int identity primary key,
	id_pregunta int foreign key references pregunta(id),
	nombre_imagen varchar(100) not null,
	formato varchar(10) not null
);
print 'Tabla imagen creada...';

print 'Creando tabla tipo_usuario...';
create table tipo_usuario 
(
	id int identity primary key,
	descripcion varchar(50)
)
print 'Tabla tipo_usuario creada...';

print 'Creando tabla usuario...';
create table usuario
(
	id int identity primary key,
	rut varchar(15) unique not null,
	password varchar(32) not null,
	primer_nombre varchar(25) not null,
	segundo_nombre varchar(25) null,
	primer_apellido varchar(25) not null,
	segundo_apellido varchar(25) null,
	correo varchar(500) null,
	telefono varchar(15) null,
	tipo_usuario int foreign key references tipo_usuario(id)
);
print 'Tabla usuario creada...';
