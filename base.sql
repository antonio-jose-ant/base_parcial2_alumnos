create table alumnos_tesoem_T (
    id_alu number(10) PRIMARY key,
    matricula_alu number(10) unique,
    nombre varchar2 (30),
    apellido_paterno varchar2(30),
    apellido_materno varchar2(30),
    carrera varchar2 (60),
    CONSTRAINT chk_carrera CHECK(carrera in ('Ing. Sistemas C','Ing. Sistemas A','Lic. Gastronomia','Contador Publico','Ing. Administracion','Ing. en ER','Ing. Indrustrial','Ing. Tics')),
    grupo nvarchar2(6),
    semestre number (3),
    edificio varchar(2),
    promedio_pasado varchar(5)
);

create table ISC_T (
    ISC nvarchar2(60),
    id_alu_S number(10),
    CONSTRAINT fk_id_alu_S FOREIGN key(id_alu_S) references alumnos_tesoem_T(id_alu), 
    matricula_alu number(10),
    nombre varchar2 (100),
    grupo nvarchar2(6),
    semestre number (3),
    edificio varchar(2),
    promedio_pasado varchar(5)
);

create table Admin_T (
    Admi nvarchar2(60),
    id_alu_A number(10),
    CONSTRAINT fk_id_alu_A FOREIGN key(id_alu_A) references alumnos_tesoem_T(id_alu), 
    matricula_alu number(10),
    nombre varchar2 (100),
    grupo nvarchar2(6),
    semestre number (3),
    edificio varchar(2),
    promedio_pasado varchar(5)
);

create table Gas_T (
    Gas nvarchar2(60),
    id_alu_G number(10),
    CONSTRAINT fk_id_alu_G FOREIGN key(id_alu_G) references alumnos_tesoem_T(id_alu), 
    matricula_alu number(10),
    nombre varchar2 (100),
    grupo nvarchar2(6),
    semestre number (3),
    edificio varchar(2),
    promedio_pasado varchar(5)
);
create table Ind_T (
    Ind nvarchar2(60),
    id_alu_I number(10),
    CONSTRAINT fk_id_alu_I FOREIGN key(id_alu_I) references alumnos_tesoem_T(id_alu), 
    matricula_alu number(10),
    nombre varchar2 (100),
    grupo nvarchar2(6),
    semestre number (3),
    edificio varchar(2),
    promedio_pasado varchar(5)
);
create table Ener_T (
    Ener nvarchar2(60),
    id_alu_E number(10),
    CONSTRAINT fk_id_alu_E FOREIGN key(id_alu_E) references alumnos_tesoem_T(id_alu), 
    matricula_alu number(10),
    nombre varchar2 (100),
    grupo nvarchar2(6),
    semestre number (3),
    edificio varchar(2),
    promedio_pasado varchar(5)
);

create table Con_T (
    Cont nvarchar2(60),
    id_alu_C number(10),
    CONSTRAINT fk_id_alu_C FOREIGN key(id_alu_C) references alumnos_tesoem_T(id_alu), 
    matricula_alu number(10),
    nombre varchar2 (100),
    grupo nvarchar2(6),
    semestre number (3),
    edificio varchar(2),
    promedio_pasado varchar(5)
);
create table Auto_T (
    Aut nvarchar2(60),
    id_alu_Au number(10),
    CONSTRAINT fk_id_alu_Au FOREIGN key(id_alu_Au) references alumnos_tesoem_T(id_alu), 
    matricula_alu number(10),
    nombre varchar2 (100),
    grupo nvarchar2(6),
    semestre number (3),
    edificio varchar(2),
    promedio_pasado varchar(5)
);

create table Tic_T (
    Tic nvarchar2(60),
    id_alu_T number(10),
    CONSTRAINT fk_id_alu_T FOREIGN key(id_alu_T) references alumnos_tesoem_T(id_alu), 
    matricula_alu number(10),
    nombre varchar2 (100),
    grupo nvarchar2(6),
    semestre number (3),
    edificio varchar(2),
    promedio_pasado varchar(5)
);


create or replace procedure alamcena_alu_p
    (id_alu_p in number, matricula_alu_p in number,nombre_p in varchar2,apellido_paterno_p in varchar2,apellido_materno_p in varchar2,carrera_p in varchar2,grupo_p in varchar,semestre_p in number,edificio_p in varchar,promedio_pasado_p in varchar default '0')
as 
begin
    insert into alumnos_tesoem_T values (id_alu_p, matricula_alu_p, nombre_p, apellido_paterno_p, apellido_materno_p, carrera_p, grupo_p,semestre_p,edificio_p,promedio_pasado_p);
    if carrera_p = 'Ing. Sistemas C' then 
        insert into ISC_T values (carrera_p,id_alu_p,matricula_alu_p,nombre_p || ' ' || apellido_paterno_p || ' ' || apellido_materno_p, grupo_p,semestre_p,edificio_p,promedio_pasado_p);
    end if; 
    if carrera_p = 'Ing. Sistemas A' then 
        insert into Auto_T values (carrera_p,id_alu_p,matricula_alu_p,nombre_p || ' ' || apellido_paterno_p || ' ' || apellido_materno_p, grupo_p,semestre_p,edificio_p,promedio_pasado_p);
    end if; 
    if carrera_p = 'Lic. Gastronomia' then 
        insert into Gas_T values (carrera_p,id_alu_p,matricula_alu_p,nombre_p || ' ' || apellido_paterno_p || ' ' || apellido_materno_p, grupo_p,semestre_p,edificio_p,promedio_pasado_p);
    end if; 
    if carrera_p = 'Contador Publico' then 
        insert into Con_T values (carrera_p,id_alu_p,matricula_alu_p,nombre_p || ' ' || apellido_paterno_p || ' ' || apellido_materno_p, grupo_p,semestre_p,edificio_p,promedio_pasado_p);
    end if; 
    if carrera_p = 'Ing. Administracion' then 
        insert into Admin_T values (carrera_p,id_alu_p,matricula_alu_p,nombre_p || ' ' || apellido_paterno_p || ' ' || apellido_materno_p, grupo_p,semestre_p,edificio_p,promedio_pasado_p);
    end if; 
    if carrera_p = 'Ing. en ER' then 
        insert into Ener_T values (carrera_p,id_alu_p,matricula_alu_p,nombre_p || ' ' || apellido_paterno_p || ' ' || apellido_materno_p, grupo_p,semestre_p,edificio_p,promedio_pasado_p);
    end if; 
    if carrera_p = 'Ing. Indrustrial' then 
        insert into Ind_T values (carrera_p,id_alu_p,matricula_alu_p,nombre_p || ' ' || apellido_paterno_p || ' ' || apellido_materno_p, grupo_p,semestre_p,edificio_p,promedio_pasado_p);
    end if; 
    if carrera_p = 'Ing. Tics' then 
        insert into Tic_T values (carrera_p,id_alu_p,matricula_alu_p,nombre_p || ' ' || apellido_paterno_p || ' ' || apellido_materno_p, grupo_p,semestre_p,edificio_p,promedio_pasado_p);
    end if; 
end;

drop PROCEDURE alamcena_alu_p;
delete from alumnos_tesoem_T where  carrera='Ing. Sistemas A';

select * from  alumnos_tesoem_T;

select * from  ISC_T;
drop table  ISC_T;
select * from  Gas_T;
drop table  Gas_T;
select * from  Con_T;
drop table  Con_T;
select * from  Ener_T;
drop table  Ener_T;
select * from  Ind_T;
drop table  Ind_T;
select * from  Tic_T;
drop table  Tic_T;
select * from  admin_T;
drop table  admin_T;
select * from  Auto_T;
drop table  Auto_T;
delete from Auto_T where matricula_alu= 229020101;
delete from alumnos_tesoem_T  where matricula_alu= 229020101;

/************fin consulta semesetres iguales*********/
    SELECT a.matricula_alu, a.nombre, a.promedio_pasado, a.semestre
    FROM alumnos_tesoem_T a
    LEFT JOIN ISC_T isc ON a.id_alu = isc.id_alu_S
    LEFT JOIN Admin_T ad ON a.id_alu = ad.id_alu_A
    LEFT JOIN Gas_T gas ON a.id_alu = gas.id_alu_G
    LEFT JOIN Ind_T ind ON a.id_alu = ind.id_alu_I
    LEFT JOIN Ener_T ener ON a.id_alu = ener.id_alu_E
    LEFT JOIN Con_T con ON a.id_alu = con.id_alu_C
    LEFT JOIN Auto_T auto ON a.id_alu = auto.id_alu_Au
    LEFT JOIN Tic_T tic ON a.id_alu = tic.id_alu_T
    WHERE a.semestre = '2';
/************fin consulta semesetres iguales*********/

/********becas alumnos*******/
create table beca_alu_T (
    matricula_alu number(10) unique,
    nombre varchar2 (100),
    promedio_pasado varchar(5),
    beca varchar2 (60),
    CONSTRAINT chk_beca CHECK(beca in ('no apto','10%','30%','50%','100%'))
);
select * from beca_alu_T;
delete from beca_alu_T where beca!='no apto';

CREATE OR REPLACE PROCEDURE determinar_apto_beca_all IS
    CURSOR c_alumnos IS
        SELECT matricula_alu, nombre,apellido_paterno,apellido_materno , promedio_pasado
        FROM alumnos_tesoem_T;
    v_matricula_alu beca_alu_T.matricula_alu%TYPE;
    v_nombre beca_alu_T.nombre%TYPE;
    v_apellido_p beca_alu_T.nombre%TYPE;
    v_apellido_m beca_alu_T.nombre%TYPE;
    v_promedio alumnos_tesoem_T.promedio_pasado%TYPE;
    v_beca beca_alu_T.beca%TYPE;
BEGIN
    -- Abrir el cursor y recorrer los registros
    OPEN c_alumnos;
    LOOP
        FETCH c_alumnos INTO v_matricula_alu, v_nombre,v_apellido_p,v_apellido_m, v_promedio;
        EXIT WHEN c_alumnos%NOTFOUND;
        
        -- Determinar la beca
        IF v_promedio > 90 THEN
            v_beca := '100%';
        ELSIF v_promedio > 80 THEN
            v_beca := '50%';
        ELSIF v_promedio > 70 THEN
            v_beca := '30%';
        ELSIF v_promedio > 60 THEN
            v_beca := '10%';
        ELSE
            v_beca := 'no apto';
        END IF;
        
        -- Insertar en la tabla beca_alu_T
        INSERT INTO beca_alu_T (matricula_alu, nombre, promedio_pasado, beca)
        VALUES (v_matricula_alu, v_nombre || ' ' || v_apellido_p || ' ' || v_apellido_m, v_promedio, v_beca);
    END LOOP;
    -- Cerrar el cursor
    CLOSE c_alumnos;
END;
execute determinar_apto_beca_all; -- Ejemplo con id_alu = 1
/********fin becas alumnos*******/

/*ejercicio 2 maestros*/


/*********tablas profesores ********/
create table ISC_profes_T (
    ISC nvarchar2(60),
    id_alu_p number(10),
    nombre varchar2 (100),
    grupo nvarchar2(6)
);

create table Admin_profes_T (
    ISC nvarchar2(60),
    id_alu_p number(10),
    nombre varchar2 (100),
    grupo nvarchar2(6)
);

create table Gas_profes_T (
    ISC nvarchar2(60),
    id_alu_p number(10),
    nombre varchar2 (100),
    grupo nvarchar2(6)
);
create table Ind_profes_T (
    ISC nvarchar2(60),
    id_alu_p number(10),
    nombre varchar2 (100),
    grupo nvarchar2(6)
);
create table Ener_profes_T (
    ISC nvarchar2(60),
    id_alu_p number(10),
    nombre varchar2 (100),
    grupo nvarchar2(6)
);

create table Con_profes_T (
    ISC nvarchar2(60),
    id_alu_p number(10),
    nombre varchar2 (100),
    grupo nvarchar2(6)
);
create table Auto_profes_T (
    ISC nvarchar2(60),
    id_alu_p number(10),
    nombre varchar2 (100),
    grupo nvarchar2(6)
);

create table Tic_profes_T (
    ISC nvarchar2(60),
    id_alu_p number(10),
    nombre varchar2 (100),
    grupo nvarchar2(6)
);
/***************/
create table profesores_tesoem_t(
    id_prof number(10) primary key,
    numero_empleado number(6),
    nombre nvarchar2(60),
    apellido_p nvarchar2(60),
    apellido_m nvarchar2(60),
    carrera_imparte nvarchar2(50),
    CONSTRAINT chk_carrera_imparte CHECK(carrera_imparte in ('Ing. Sistemas C','Ing. Sistemas A','Lic. Gastronomia','Contador Publico','Ing. Administracion','Ing. en ER','Ing. Indrustrial','Ing. Tics')),
    nombre_classe nvarchar2(50),
    grupo varchar(9)
);
SELECT * FROM Tic_profes_T; 
drop table profesores_tesoem_t;

create or replace procedure maestro_insert_p 
    (id_prof in number, numero_empleado in number,nombre in nvarchar2,apellido_p in nvarchar2,apellido_m in  nvarchar2,carrera_imparte in nvarchar2,nombre_classe in nvarchar2,grupo in nvarchar2) 
as
begin
    insert into profesores_tesoem_t values (id_prof, numero_empleado,nombre,apellido_p,apellido_m,carrera_imparte,nombre_classe,grupo);
    if carrera_imparte = 'Ing. Sistemas C' then 
        insert into ISC_profes_T values (carrera_imparte,id_prof,nombre || ' ' || apellido_p || ' ' || apellido_m, grupo);
    end if; 
    if carrera_imparte = 'Ing. Sistemas A' then 
        insert into Auto_profes_T values (carrera_imparte,id_prof,nombre || ' ' || apellido_p || ' ' || apellido_m, grupo);
    end if; 
    if carrera_imparte = 'Lic. Gastronomia' then 
        insert into Gas_profes_T values (carrera_imparte,id_prof,nombre || ' ' || apellido_p || ' ' || apellido_m, grupo);
    end if; 
    if carrera_imparte = 'Contador Publico' then 
        insert into Con_profes_T values (carrera_imparte,id_prof,nombre || ' ' || apellido_p || ' ' || apellido_m, grupo);
    end if; 
    if carrera_imparte = 'Ing. Administracion' then 
        insert into Admin_profes_T values (carrera_imparte,id_prof,nombre || ' ' || apellido_p || ' ' || apellido_m, grupo);
    end if; 
    if carrera_imparte = 'Ing. en ER' then 
        insert into Ener_profes_T values (carrera_imparte,id_prof,nombre || ' ' || apellido_p || ' ' || apellido_m, grupo);
    end if; 
    if carrera_imparte = 'Ing. Indrustrial' then 
        insert into Ind_profes_T values (carrera_imparte,id_prof,nombre || ' ' || apellido_p || ' ' || apellido_m, grupo);
    end if; 
    if carrera_imparte = 'Ing. Tics' then 
        insert into Tic_profes_T values (carrera_imparte,id_prof,nombre || ' ' || apellido_p || ' ' || apellido_m, grupo);
    end if; 
end;
