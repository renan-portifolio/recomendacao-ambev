##################################################################################################
##                                       KPI Medido                                             ##
##                                     Efeito Canibalização Vendas                              ##
#################################################################################################
setwd('C:/FCD/VendaCruzada/VendaCruzada/algoritmos-de-recomendacao')
getwd()

install.packages("dplyr")
install.packages("lubridate")

library(dplyr)
library(lubridate)


#Canibalização
vendaCruzada <- read.csv("Data.csv", header = T, sep=';')
View(vendaCruzada)

#Verificando se tem algum valor minssing value (NA) na base
any(is.na(vendaCruzada$HL.delivered))
any(is.na(substr(vendaCruzada$Doc..Date,7,10)))

colunaAno<-substr(vendaCruzada$Doc..Date,7,10)

vendaCruzada_atual <- mutate(vendaCruzada, ano=colunaAno)
View(vendaCruzada_atual)

#convertendo os dados
#trocando virgula por ponto para não perdemos os valores
cols <- sapply(vendaCruzada_atual$HL.delivered, function(x) any(grepl(",", x)))
vendaCruzada_atual$HL.delivered[cols] <- lapply(vendaCruzada_atual$HL.delivered[cols], function(x) as.numeric(sub(",", ".", x)))

vendaCruzada_atual$HL.delivered <- as.numeric(suppressWarnings(as.character(vendaCruzada_atual$HL.delivered)))

#criando subsets
BUD_subset_2020 = vendaCruzada_atual %>%
  select(Material,HL.delivered,ano)%>%
  filter(Material == 71316, ano==2020) 

Y<- sum(BUD_subset_2020$HL.delivered)
Y

View(BUD_subset_2020)


GINETTE_LAGER_2019 = vendaCruzada_atual %>%
  select(Material,HL.delivered,ano)%>%
  filter(Material == 74342, ano==2019) 

View(GINETTE_LAGER_2019)

#NAO TINHA EM 2019 ESTA CERVEJA DA GINETTE

GINETTE_LAGER_2020 = vendaCruzada_atual %>%
  select(Material,HL.delivered,ano)%>%
  filter(Material == 74342,ano==2020) 

W<- sum(GINETTE_LAGER_2020$HL.delivered)
W

View(GINETTE_LAGER_2020)

################ Fazendo calculo da Canibalização #############################
#Budweiser(2019) - Budweiser(2020) = 1000 hectolitros   
#Como nao tinhamos valores da budweiser de 2019 utilizamos valor simbolico 
#para efeito de simulação

anoAnterior<-3839.02
fatorCanibalizacao<-anoAnterior-Y
fatorCanibalizacao

#Somando as producoes
somaProducao<-Y+W
somaProducao
