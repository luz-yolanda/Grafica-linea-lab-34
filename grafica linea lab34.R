########################################################################
#Hecho con gusto por Luz Yolanda Rivera Álvarez (UAEH)

#Laboratorio Gráficos en R Studio con ggplot2 para ciencia de datos
#Gráficas de líneas en R
#######################################################################

#instalar paquete con los datos
#install.packages("gapminder")
#install.packages("ggplot2")


#Cargar en librería ggplot2 y gapminder

library(ggplot2)
library(gapminder)

#cargando datos a entorno
data("gapminder")

#Filtrando España
gapminderES= gapminder [gapminder$country == "Spain",]

#como hacer gráfica de puntos con ggplot2
ggplot( data = gapminderES,
        mapping = aes(x = year,
                      y = lifeExp)) +
  geom_line()

#modificar el tipo de línea y color
ggplot( data = gapminderES,
        mapping = aes(x = year,
                      y = lifeExp)) +
  geom_line(linetype = "dashed" ,
            color = "red")

#modificar tamaño y hacer flecha

ggplot( data = gapminderES,
        mapping = aes(x = year,
                      y = lifeExp)) +
  geom_point( size=3) +
  geom_line(linetype = "dashed" ,
            color = "red",
            size = 2 ,
            arrow = arrow())
  
# De mi base de datos, solo quiero ver a los paises latinoamericanos

hispam_vec = c( 
  "Argentina", "Brazil", "Bolivia", "Chile", "Colombia",
  "Costa Rica", "Cuba", "Dominican Republic",
  "Ecuador", "El Salvador", "Guatemala", "Honduras",
  "Mexico", "Nicaragua", "Panama", "Paraguay",
  "Peru", "Uruguay", 
  "Spain", "Puerto Rico",
  "Venezuela")

#crear y un objeto data frame
gapminder_hisp = gapminder[ gapminder$country %in% hispam_vec,]

#gráfica con la nueva base de datos

ggplot( data = gapminder_hisp,
        mapping = aes(x = year,
                      y = lifeExp, 
                      color = country)) +
  geom_line()

#exportar el dataframe de los países hispanoparlantes

write.csv(gapminder_hisp, file = "gapminder_hisp.csv")


