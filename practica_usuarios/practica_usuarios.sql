-- Tarea 1

-- Parte 1

-- Creación del usuario gestor_tienda (local)
CREATE USER 'gestor_tienda'@'localhost' IDENTIFIED BY 'G3st0r_T13nd@2026!';

-- Creación del usuario auditor_externo (Cualquier IP)
CREATE USER 'auditor_externo'@'%' IDENTIFIED BY 'Aud1t0r_Ext3rn0_26*'

-- Jstificación de la contraseña: Tiene minimo 12 caracteres, Combina numeros, 
-- letras mayusculas y minusculas, caracteres especiales. 

-- Parte 2

ALTER USER 'auditor_externo'@'%' PASSWORD EXPIRE INTERVAL 30 DAY;

-- Parte 3

SET GLOBAL wait_timeout = 3600;

-- Tarea 2

-- Parte 1
-- Me he dado cuenta tarde que en vez de rol_consultor lo he llamado rol_analista, 
-- le seguiré llamando rol_analista porque ya lo he ejecutado
CREATE ROLE 'rol_consultor';

-- Parte 2

GRANT SELECT ON tienda_informatica.* TO 'rol_consultor';

-- Parte 3

GRANT 'rol_consultor' TO 'auditor_externo'

-- Tarea 3

-- Parte 1

CREATE VIEW v_tecnicos_activos AS
SELECT id, nombre, especialidad FROM tecnicos;

-- Parte 2

GRANT SELECT ON tienda_informatica.v_tecnicos_activos TO gestor_tienda;

-- Parte 3

-- He intentado con el usuario gestor_tienda hacer una consulta ha la tabla tecnicos 
-- pero me da error como si no existiera porque no tiene permisos el usuario.

-- Tarea 4

-- Parte 1

CREATE VIEW v_articulos_gamma_baja AS
SELECT * FROM articulos
WHERE precio <= 50.00
WITH CHECK OPTION;

-- Parte 2

-- Me da error aunque sea el administrador porque la vista solo permite articulos con menos o igual a 50.00€

-- Tarea 5

-- Parte 1