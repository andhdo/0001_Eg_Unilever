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
 
adicionar el directorio bin de mysql al PATH
  C:\Program Files\MySQL\MySQL Server 5.7\bin
 
 
# permitir conexiones remotas a mysql con el root

GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'meconio3' WITH GRANT OPTION; 
 
# creacion de base de datos y dimensiones

----------------
INSTALACION HERRAMIENTAS BASE
----------------

descargar git-scm
descargar R      (3.2.5)
descargar rtools (3.2, al instalar seleccinoar tambien modificar el PATH)
descargar Rstudio

hacer un clone del proyecto (descargar el repositorio)
mkdir C:\UL\unlvr_proc
cd C:\UL\unlvr_proc
git clone https://github.com/Duhart/Ultimate_Level.git

abrir una consola r como administrador. 
ejecutar
setwd('C:/UL/unlvr_proc/Ultimate_Level')



----------------
INSTALACION LBRERIAS R
----------------

# cargar librerias prerrequisito
# en la consola dar las siguientes instrucciones

install.packages('Rook')
install.packages('urltools')
install.packages('purrr')
install.packages('knitr')
install.packages('UL',repos=NULL,type="source")




----------------------
REALIZAR ETL Y CALCULOS 	
----------------------

library(UL)

NOTA: tiene implicitas las siguientes librerias
	RServe
	DBI
	RMySQL
	dplyr
	tidyr
	rshape2
	
# ajustar segun los datos de conexion
	
user<-"root"
password<-"meconio3"

drop_database()    # solo si ya esta creada: tener en cuenta que se deben crear otros objetos de la db
create_database()
update_calcs()
refresh_scenario()


----------------------
EJECUTAR ACTUALIZACIONES DB
----------------------
se ejecutan los scripts de db

cd C:\UL\unlvr_proc\Ultimate_Level\Tableau\scripts

mysql --user=root --password=meconio3 tableauconnect 
  \. 10_indexes.sql
  \. 11_new_column_mean_UL_gross_margin.sql
  \. 12_participation_categories.sql
  exit

----------------------
INICIAR WEBSERVER R
----------------------

# iniciar webserver para la parte de optimizacion

ejecutar
setwd('C:/UL/unlvr_proc/Ultimate_Level')

library(UL)
user<-"root"
password<-"meconio3"
start_server()


----------------------
CONFIGRAR ARCHIVO TABLEAU
----------------------

copiar shapes
  de C:\UL\unlvr_proc\Ultimate_Level\Tableau\ShapesUL
  a  C:\Users\User\Documents\Mi Repositorio de Tableau\Formas\UL
  
  
  
