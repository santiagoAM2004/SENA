create schema asesorias2250070;

use asesorias2250070;

/*programas de formación*/
create table programas
( codigo char(3) not null primary key,
  nombre char (50)
);
  
create table aprendices
(tipodoc char(2),  
  documento char(20) not null primary key,
  apellidos char(40),
  nombres char(40),
  jugadorvd char(1),	/*el campo indica si el aprendiz juega videojuegos S=SI N=NO*/
  sexo char(1),         /*M=Masculino   F=Femenino*/
  programa char(3),
  foreign key (programa) references programas(codigo)
  );
  

create table asesores
(codigo char(20) not null primary key,
nombres char(100)
);

create table instructores
(login char(20) not null primary key,
 nombre char(80)
 );


create table asesorias
(idasesoria int primary key not null auto_increment, /*consecutivo automático de la asesoria*/
 fecha date,
 hora char(5),
 aprendiz char(20),  /* codigo del aprendiz*/
 asesor char (20),    /*codigo del asesor*/
 instructor char(20), /*codigo del instructor*/ 
 estado char(20),	/* asignada o anulada. solo se tienen en cuenta esos dos valores*/
 foreign key (aprendiz) references aprendices(documento),
 foreign key(asesor) references asesores(codigo),
 foreign key(instructor) references instructores(login)
 );
 
/*insertar datos de los programas*/
insert into programas values
('001','ADSI'),
('002','Administración'),
('003','Contabilidad y Finanzas'),
('004','Multimedia'),
('005','Salud Pública'),
('006','Enfermería'),
('007','Regencia de Farmacia'),
('008','Tecnico en Sistemas');


/* insertar datos de aprendices*/

insert into aprendices values('TI','1007442734','ECHEVERRI PEREZ','DANIEL FERNANDO','S','M','001');
insert into aprendices values('CC','1005252929','GALINDO VARILLA','LUISA FERNANDA','S','F','001');
insert into aprendices values('CC','1097041400','GALLEGO VELASQUEZ','YONIER ESTIVEN','S','M','001');
insert into aprendices values('TI','1007686580','INFANTE HURTADO','STEVEN','N','M','003');
insert into aprendices values('TI','1007269246','PELAEZ MUÑOZ','GUSTAVO ADOLFO','N','M','003');
insert into aprendices values('TI','1002575944','PEREZ VALENCIA','JHON ALEXANDER',NULL,'M','004');
insert into aprendices values('TI','1005308685','RAMOS RODRIGUEZ','JUAN CAMILO',NULL,'M','005');
insert into aprendices values('TI','1007686779','RUEDA USUGA','ERICA PAOLA','S','F','006');
insert into aprendices values('TI','1007397651','RUIZ ECHEVERRY','EDGAR STIVEN','S','M','005');
insert into aprendices values('TI','1007385167','TORRES HIGUITA','JHON ALEXANDER','N','M','001');
insert into aprendices values('TI','1007269322','TRUJILLO QUINTERO','JUAN CAMILO','N','M','001');
insert into aprendices values('CC','1000316154','GARCIA VELEZ','OSCAR EDUARDO','N','M','001');
insert into aprendices values('CC','1014297806','AGUDELO URIBE','JULIAN ANDRES','S','M','001');
insert into aprendices values('CC','1075292586','ARIZA ZULUAGA','JUAN CAMILO','S','M','001');
insert into aprendices values('CC','1003102873','CAMPO CASTILLO','LEIDI YASMIN','S','F','001');
insert into aprendices values('CC','46371643','DELGADO TAQUEZ','BENITTA FLABIA','N','F','001');
insert into aprendices values('CC','52320923','DURAN BUSTAMANTE','PAULA ALEJANDRA',NULL,'F','001');
insert into aprendices values('CC','89006655','GARCIA DELGADO','JUAN DIEGO','S','M','001');
insert into aprendices values('CC','1004799735','GIRALDO CARDONA','GERALDIN',NULL,'F','001');
insert into aprendices values('CC','1005088482','MARIN ARTEAGA','BRANDON STIVEN','N','M','001');
insert into aprendices values('CC','1094956674','MENESES REYES','JHON FELIPE','S','M','001');
insert into aprendices values('TI','1005089543','MURILLO QUINAYAS','NELSON FELIPE','N','M','001');
insert into aprendices values('CC','1097727605','QUINTERO GONZALEZ','OMAR YESID',NULL,'M','001');
insert into aprendices values('CC','1094927995','RICO ECHEVERRI','JHONATAN DAVID','N','M','001');
insert into aprendices values('TI','1193127935','YATE MENDEZ','JUAN MANUEL','S','M','001');


/*insertar datos de asesores*/
insert into asesores values('001','LUIS CARLOS GONZALEZ');
insert into asesores values('002','JOSÉ JOAQUIN ROJAS GIRALDO');
insert into asesores values('003','LAURA VALENTINA ACOSTA GUTIERREZ');
insert into asesores values('004','JAIRO ALBERTO POVEDA VALENCIA');

/*insertar datos de instructores*/
insert into instructores values('willyrinconh','WILLINGTON RINCON HOYOS');
insert into instructores values('crishenao','CRISTIAN HENAO');
insert into instructores values('gangarita','GERMAN ANGARITA');
insert into instructores values('arlemorales','ARLE MORALES');
insert into instructores values('edwinrozo','EDWIN ROZO');

/*insertar datos de asesorias*/
insert into asesorias (fecha,hora,aprendiz,asesor,instructor,estado) values('2021-09-15','10:00','1002575944',null,'willyrinconh','Asignada');
insert into asesorias (fecha,hora,aprendiz,asesor,instructor,estado) values('2021-09-14','08:00','1007269322',null,'crishenao','Asignada');
insert into asesorias (fecha,hora,aprendiz,asesor,instructor,estado) values('2021-09-14','09:00','1007269322','002','crishenao','Asignada');
insert into asesorias (fecha,hora,aprendiz,asesor,instructor,estado) values('2021-09-15','11:00',null,'003',null,'Anulada');
insert into asesorias (fecha,hora,aprendiz,asesor,instructor,estado) values('2021-09-15','12:00','1007442734','004','crishenao','Asignada');
insert into asesorias (fecha,hora,aprendiz,asesor,instructor,estado) values('2021-09-15','14:00',null,'004',null,'Anulada');
insert into asesorias (fecha,hora,aprendiz,asesor,instructor,estado) values('2021-09-14','07:00',null,'001','gangarita','Anulada');
insert into asesorias (fecha,hora,aprendiz,asesor,instructor,estado) values('2021-09-18','07:00','1007397651','001','crishenao','Anulada');
insert into asesorias (fecha,hora,aprendiz,asesor,instructor,estado) values('2021-09-19','07:00','1097041400',null,'crishenao','Asignada');
insert into asesorias (fecha,hora,aprendiz,asesor,instructor,estado) values('2021-09-20','07:00',null,'001','gangarita','Anulada');
insert into asesorias (fecha,hora,aprendiz,asesor,instructor,estado) values('2021-09-21','07:00','1007385167','001','willyrinconh','Asignada');
insert into asesorias (fecha,hora,aprendiz,asesor,instructor,estado) values('2021-09-18','07:00','1000316154','002','gangarita','Asignada');
insert into asesorias (fecha,hora,aprendiz,asesor,instructor,estado) values('2021-09-17','07:00','1007269246','003','willyrinconh','Asignada');
insert into asesorias (fecha,hora,aprendiz,asesor,instructor,estado) values('2021-09-16','07:00','1007397651','003','arlemorales','Asignada');
insert into asesorias (fecha,hora,aprendiz,asesor,instructor,estado) values('2021-09-19','07:00','1007269246','002','edwinrozo','Asignada');
insert into asesorias (fecha,hora,aprendiz,asesor,instructor,estado) values('2021-09-20','07:00','1005308685','001','willyrinconh','Anulada');
insert into asesorias (fecha,hora,aprendiz,asesor,instructor,estado) values('2021-09-20','07:00','1193127935','003',NULL,'Asignada');
insert into asesorias (fecha,hora,aprendiz,asesor,instructor,estado) values('2021-09-20','07:00','1094927995',NULL,'willyrinconh','Anulada');
insert into asesorias (fecha,hora,aprendiz,asesor,instructor,estado) values('2021-09-20','07:00',NULL,'001','edwinrozo','Asignada');
insert into asesorias (fecha,hora,aprendiz,asesor,instructor,estado) values('2021-09-20','07:00','1005089543','002','arlemorales','Asignada');
insert into asesorias (fecha,hora,aprendiz,asesor,instructor,estado) values('2021-09-20','07:00','1094956674','002','willyrinconh','Asignada');
insert into asesorias (fecha,hora,aprendiz,asesor,instructor,estado) values('2021-09-20','07:00',NULL,'001','crishenao','Asignada');
insert into asesorias (fecha,hora,aprendiz,asesor,instructor,estado) values('2021-09-20','07:00','1005088482','003','gangarita','Anulada');
insert into asesorias (fecha,hora,aprendiz,asesor,instructor,estado) values('2021-09-20','07:00','1004799735','004',NULL,'Asignada');
insert into asesorias (fecha,hora,aprendiz,asesor,instructor,estado) values('2021-09-20','07:00','89006655',NULL,'edwinrozo','Asignada');
insert into asesorias (fecha,hora,aprendiz,asesor,instructor,estado) values('2021-09-20','07:00','46371643',NULL,'gangarita','Asignada');
insert into asesorias (fecha,hora,aprendiz,asesor,instructor,estado) values('2021-09-20','07:00','52320923','004','arlemorales','Asignada');
insert into asesorias (fecha,hora,aprendiz,asesor,instructor,estado) values('2021-09-20','07:00','1075292586','004',NULL,'Anulada');
insert into asesorias (fecha,hora,aprendiz,asesor,instructor,estado) values('2021-09-20','07:00',NULL,'002','edwinrozo','Asignada');
insert into asesorias (fecha,hora,aprendiz,asesor,instructor,estado) values('2021-09-20','07:00','1014297806',NULL,'arlemorales','Asignada');



