=================
PARTE-PROC
=====================

----------------------
INSTALACION
----------------------


descargar git-scm
descargar R
descargar Rstudio
descargar rtools

abrir rstudio como admin pasarse al directorio de los scripts de Rstudio

install.packages('RServe')
install.packages('DBI')
install.packages('RMySQL')
#
install.packages('dplyr')
install.packages('tidyr')

configurar la variable de entorno path; adicionar el directorio que contieene R.dll
C:\Program Files\R\R-3.2.3\bin\x64

# probar que el servidor rserve sube

library("Rserve")
Rserve()

otra forma de subirlo es ejecutar rserve.exe.
rserve queda instalado en un dorectorio donde se guardan localmente las librerias de cran

ejecutar rserve.exe para dejarlo sirviendo contenidos
rserve abre un socket en 6311

# se prueba funcion en R a ejecutar
setwd('path_donde_se_va_a_colcar_el_source_de_prueba/')
ej: C:\UL\0001_Eg_Unilever\unlvr_proc

source('R/tconn_test.R')
echo('desde tableau')


# hacer una prueba de conectividad (desde tableau)
NOTA: en tableau 
- se realiza la conexion a rserve
- se crea campo calculado, con el siguiente contenido:

	SCRIPT_STR('
	  setwd("C:/UL/unlvr_proc/Ultimate_Level/UL")
	  source("R/tconn_test.R") 
	  echo (name=.arg1 )
	',
	 "pepito-tab"
	)


REFERENCIA
  instalacion de rmysql en windows
  http://stackoverflow.com/questions/4785933/adding-rmysql-package-to-r-fails-on-windows
