-----------------------------
Ambientes / Maquinas
-----------------------------

# Conexion (Development)

| Field                 |  Description                                      |
| --------------------- | ------------------------------------------------- |
| IP                    |192.168.0.17  	|
| PORT                  |3306  	|
| user 	        | root           |
| pass 	        | ****           |

----------------------------------------
Datasets con los cuales se trabaja
-----------------------------------------


# Countries
> Paises a analizar

| Field                 |  Description                                      |
| --------------------- | ------------------------------------------------- |
| country_id            | (identificador interno)  	|
| country_name 	        | nombre del pais           |
| region               	|                           | 


# Brand
> Modela la marca de determinado producto (tanto de unilever como de la competencia) y que pertenece a determinada categoria  

| Field                 |  Description                                      |
| --------------------- | ------------------------------------------------- |
| brand_id              | (identificador interno)                           |
| name                  | nombre de marca |
| local_name            | nombre que se asume cuando está en determinado pais |
| is_UL                 | modela si la marca es gobernada por UL |
| brand_status          | O:aplica para UL, S:?? |
| cat_id 	            | [join:catgoria] categoria a la que pertenece la marca |

# Categories
 > identificador de categoria

| Field                    |  Description                                      |
| ------------------------ | ------------------------------------------------- |
| cat_id                   | (identificador interno)                           |
| country_id               | por pais va la categoria (se replican entre paises)  |
| name                     | nombre de categoria                               |
| decay_rate:              |                                                   |
| ceiling_{L,C,S,O}:       |(tope) 											   |
| decay_speed              |                                                   |
| competitor_hit_{L,C,S,O} |												   |
| non_tv_effectiveness     |												   |

# Category_Data
 > datos por año de cada categoria

| Field                 |  Description                                      |
| --------------------- | ------------------------------------------------- |
| year					| año del reporte entregado							|
| cat_id				| [join:categoria]									|
| market_size			| valor estimado del presupuesto del mercado (al parecer tienen un presupuesto y hacen a proyeccion segun la participacion en el mercado)  [unidad:miles-de-euros]    				|
| market_share_UL		| participacion en el mercado de UL /porcentaje de la industria que es ganado por una empresa específica.se calcula teniendo en cuenta las ventas de la compañía sobre las ventas del mercado.El mercado especifico en este caso sería el territorio (Country)  [unidad:%]		|
| growth_2y	            | valor esperado de crecimiento a 2 años  [unidad:%]|
| growth_5y	            | valor esperado de crecimiento a 5 años  [unidad:%]|
| media_spending_all    | |
| incremental_usage     | |
| conviction_cat        | |



# Financial_Data
> datos financieros capturados; nótese que sólo se tienen los de UL

| Field                 |  Description                                     |
| --------------------- | ------------------------------------------------- |
| brand_id              | marca												|
| year                  | año reportado										|
| turnover              | ventas netas / volumen de ventas [unidad:miles-de-euros] 						|
| gross_margin          | [GP] Gross Profit o Gross Margin  ganancia (bruta), [volumen/margen de ganancias = (Ingresos - Costo de Articulo vendido)/ Ingresos] diferencia entre ingresos menos costos (de lo que vende) dividido ingresos (cuanto de las ventas es utilidad:profit). [Unidad:%] |

# Media Data
> Datos de medios y la inversion realizada para obtener beneficio

| Field                 |  Description                                     |
| --------------------- | ------------------------------------------------ |
| brand_id              | (join:brand)                                     |
| year                  | año reportado	                                   |      
| tv_.                  | del valor en medios, cuánto es para television [unidad:%] |
| spending              | inversion en medios (media-data-spend) [unidad:euro]      |
| grp_cost              | grp_cost: costo en general invertido para medios (si se quiere sacar el costo x ej para tv se multiplica tv_. * spending )     |
| share_of_value        | [unidad:%]                                                  |
| growth                |                                                  | 
| how_many              | [unidad:conteo]                                          |     

# Tracking Data
> Medidas del mercado

| Field                 |  Description                                     |
| --------------------- | ------------------------------------------------ |
| brand_id              | (join:brand)                                    |
| year                  | año reportado                                   |
| conviction            | convencimiento de la marca (estimacion de la credibilidad) [unidad:puntaje]                  |
| ai                    | brand awareness,interest,conviction, purchase/importance? importancia del conocimiento de marca         |
| ai2c                  |                                                  |

# Calcs
> Se usa para la parte de exploración, para poder crear la visualizacion
> Representa los N puntos en el eje x creados y se repite N veces por brand

| Field                 |  Description                                     |
| --------------------- | ------------------------------------------------ |
| brand_id              | (join:brand): se repite N veces                  |
| X                     | valor en x para la curva                         |

# Estimated Returns
> es una tabla calculada


| Field                    |  Description                                     |
| ------------------------ | ------------------------------------------------ |
| brand_id                 | (join:brand) toman la interseccion de financial,media,track            |
| year                     | año                                              |
| year                     | año                                              |
| to_return                |                                                  |
| gp_return                |                                                  |
| boost                    |                                                  |
| protected_fraction       |                                                  |
| gained_fraction          |                                                  |
| brand_value_share_change |                                                  |
| estimated_conviction     |                                                  |



| 
|  $ brand_id                : int  1 2 8 9 10 16 22 23 24 25 ...
|  $ year                    : int  2015 2015 2015 2015 2015 2015 2015 2015 2015 2015 ...
 $ to_return               : num  4.52e+07 3.44e+06 1.57e+07 0.00 2.56e+08 ...
 $ gp_return               : num  2.19e+07 1.53e+06 6.74e+06 0.00 1.15e+08 ...
 $ boost                   : num  1 1 1 1 1.2 1 1 1.15 1.15 1.2 ...
 $ protected_fraction      : num  0.020678 1 0.067114 NA 0.000104 ...
 $ gained_fraction         : num  0.979 0 0.933 NA 1 ...
 $ brand_value_share_change: num  7.64e-02 -1.34e-02 9.55e-03 -1.23e-02 3.66e-05 ...
 $ estimated_conviction    : num  60.94 4.31 54.76 4.07 1.06 ...





# Otras definiciones

| Término                |  Description                                     |
| ---------------------: | ------------------------------------------------ |
| TotalCutThrough        | [TCT] (calculo): hace referencia al ponderado de los gastos en medios.  |
|                        | Para calcularlo se necesitan ejecutar algunos calculos sobre la tabla marketing_data: |
|                        |  * tv_grps:  valor estimado de inversion en tv (spending*tv_./grp_cost)  |
|                        |  * tv_cut_trough:  ai*ai2c*tv_grps/100  |
|                        |  * total_cut_through: tv_cut_trough + indice de inversion en otros medios |
| Estimated_Conviction   |  Para estimarla se necesita el TCT |
|                        |  * usa los valores de ceiling      |
|                        |  * usa conviction del año anterior |
|                        |  * calcula conviction gain / lost  |	
| Estimate_Returns       |  Estimacion de retorno  |
|                        |  * boost: agrupamientos por categorias (segun share_of_value)      |
|                        |  * gp_return: calculado a partir de la inversion (turnover) y el margen de ganancia (gross_margin) |
|                        |  * calcula conviction gain / lost  |	
| Protected/Gain Result  |  Estimacion  |
|                        |  * gained_fraction: (conviction_gain+conviction_lost) / conviction_gain      |
| Chart                  |  Estimacion  |
|                        |  * crean una campana de gauss |
|                        |  * se evalua en los puntos de interes |






| Percentil              | |                   
                             
                             
                             