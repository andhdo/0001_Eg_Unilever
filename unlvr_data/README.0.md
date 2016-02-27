=========================
PARTE-DATA
=========================

----------------
INSTALACION MYSQL
----------------
descargar
 mysql-installer-community-5.7.11.0.msi
 
instalar en windows 
 instalacion de mysql windows (community)
 
configurar acorde a los siguietnes datos: 
 localhost:3306
 user: root/meconio3 
 windows service name: MySQL57
 
 
# permitir conexiones remotas a mysql con el root

GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'meconio3' WITH GRANT OPTION; 
 
# creacion de base de datos y dimensiones

----------------
INSTALACION HERRAMIENTAS BASE
----------------

descargar git-scm
descargar R
descargar Rstudio
descargar rtools

abrir rstudio como admin pasarse al directorio de los scripts de Rstudio

----------------
INSTALACION LBRERIAS R
----------------

# cargar librerias prerrequisito
# en la consola dar las siguientes instrucciones

install.packages('RServe')
install.packages('DBI')
install.packages('RMySQL')
#
install.packages('dplyr')
install.packages('tidyr')
install.packages('rshape2')

descargar el repositorio
git clone https://github.com/Duhart/Ultimate_Level.git

# realizar etl y calculos 
pasarse al directorio donde esta el codigo

setwd( 'C:/.apps/e.edwin/0001_Unilever/Ultimate_Level/UL')

----------------------
CARGUE DE DATOS R
----------------------

# cambiar los datos de conexion ('R/init.R')
# luego ...

source("R/init.R")

# drop_database() # solo si ya esta creada: tener en cuenta que se deben crear otros objetos de la db
create_database()

source("R/main.R")
update_calcs()

 