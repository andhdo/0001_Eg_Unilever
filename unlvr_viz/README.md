=================
PARTE-VISUALIZACION
=====================

La carpeta "UL" de este directorio debe ser copiada al directorio de "Shapes" de Tableau 


=====================

.       Sobre las gráficas de pastel:
a.       Para la de Turnover pool, solamente hay que usar el market_share_UL como habíamos acordado. Para calcular los valores en dinero, sólo hay que multiplicar los porcentajes por market_size que está en la misma tabla.
b.      Para el GP pool, hay que utilizar los mismos datos que en Turnover pool  pero multiplicados por un factor. Ese factor es el promedio ponderado de los gross margin de las marcas de Unilever en esa categoría.  En ese promedio ponderaríamos por el tamaño de la marca. Creo que la manera más sencilla es agregar un campo que se llame mean_UL_gross_margin en la tabla Categories y así sólo multipliques por él para calcular el pie. ¿Qué opinas?
2.       Sobre el return rate:
a.       Ya definimos la fórmula para su cálculo. Lo que queremos representar ahí es la variable Estimated_returns.to_return (en la visualización el nivel de esa variable está representado por el triángulo negro). El otro elemento de esa visualización es el color. 
b.       El color dependerá de la región en donde se encuentre (como lo muestra la diapositiva en el Briefing). Los límites de esas regiones son diferentes para cada marca, y pueden ser calculados mediante campos calculados en Tableau. Estoy trabajando en las fórmulas exactas. En cuanto las tenga te las paso. Mientras podemos trabajar con datos dummies.
3.       Sobre las páginas correspondientes al análisis what if:
a.       Adjunto encontrarás el primer borrador de Tableau con el simulador por marca. Se conecta a la base de datos tableau_connect. Antes de correrlo porfa haz un pull de github y en R Studio haz lo siguiente:
1.       Una vez abierto el proyecto y hecho el pull dar ctrl+shift+l para cargar el paquete al environment.  
2.       Ejecutar drop_tables()
3.       Ejecutar create_tables()
4.       Ejecutar update_tables()
b.      Una vez hecho eso ya tendrás todas las tablas actualizadas que te permitirán trabajar. Update_tables calcula y crea las tablas estimated_returns y calculated_returns. Verás que en la base de datos hay una nueva base de datos llamada Calc. Esta tabla sólo tiene los números del 1 al 40 para cada marca. Y hacemos un right join de Brands con ella. Es necesaria para poder graficar las curvas en Tableau.
c.       Para usar el dashboard de whatif en Tableau no ocuparás R. Como habíamos platicado, encontramos que es mejor usar Tableau de manera independiente.
d.      Si tienes algún problema en correrlo dinos y te echamos la mano.

