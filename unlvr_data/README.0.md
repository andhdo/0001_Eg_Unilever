=========================
PARTE-DATA
=========================

----------------
INSTALACION
----------------
descargar
 mysql-installer-community-5.7.11.0.msi
 
instalar en windows 
 instalacion de mysql windows (community)
 
configurar acorde a los siguietnes datos: 
 localhost:3306
 user: root/meconio3 
 windows service name: MySQL57
 
# creacion de base de datos y dimensiones

prerrequisitos:
	se recomienda instalar las herrameintas de r previamente.
	las indicaciones estan en el proyecto unlvr_proc

cambiar los datos de conexion
descargar el repositorio
git clone https://github.com/Duhart/Ultimate_Level.git

# realizar etl y calculos 
pasarse al directorio donde esta el codigo

setwd( 'C:/.apps/e.edwin/0001_Unilever/Ultimate_Level/UL')

source("R/init.R")
create_database()

source("R/main.R")
update_calcs()

 