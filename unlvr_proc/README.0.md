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

configurar la variable de entorno path; adicionar el directorio que contieene R.dll
C:\Program Files\R\R-3.2.3\bin\x64

# probar que el servidor rserve sube

library("Rserve")
Rserve()

otra forma de subirlo es ejecutar rserve.exe.
rserve queda instalado en un dorectorio donde se guardan localmente las librerias de cran

ej: C:\Users\User\Documents\R\win-library\3.2\Rserve\libs\x64

ejecutar rserve.exe para dejarlo sirviendo contenidos
rserve abre un socket en 6311


# desde tableau se deben invocar la funcion

setwd('path_donde_se_va_a_colcar_el_source_con_shash/')
source('R/main.R')
update_calcs()


REFERENCIA
  instalacion de rmysql en windows
  http://stackoverflow.com/questions/4785933/adding-rmysql-package-to-r-fails-on-windows
