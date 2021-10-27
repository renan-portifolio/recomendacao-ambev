##################################################################################################
#                 Venda Cruzada - Sistema de Recomendação Saideira                              ##
#                          Autores: Renan e Gustavo                                             ##
#                      Algoritmo de Recomendação direta                                         ##
##################################################################################################


################## Vendo o Diretorio atual #######################################################
setwd('C:/FCD/VendaCruzada/VendaCruzada/algoritmos-de-recomendacao')
getwd()
##################################################################################################


########### Adicionando Bibliotecas ##############################################################
install.packages("dplyr")
install.packages('ggplot2')
install.packages("arules")
install.packages("arulesSequences")
install.packages("RColorBrewer")
install.packages("readr")


######### Utilizando pacotes na sessao #########################################################
library(dplyr)
library(ggplot2)
library(arules)
library(arulesSequences)
library(RColorBrewer)
library(readr)
library(tidyverse)



##############################################################################################

####################### carregando dataSet Disponibilizado pela Ambev ########################
vendaCruzada <- read.csv("Data.csv", header = T, sep=';')
View(vendaCruzada)

###################### Gerando Um nova instância de objeto ##################################

limp_vendaCruzada <- vendaCruzada

#############################################################################################

##################### Limpando o dataSet ####################################################

limp_vendaCruzada$delivery_flag <- NULL
limp_vendaCruzada$lead_time_creation_vs_rdd_flag <- NULL
limp_vendaCruzada$Street <- NULL
limp_vendaCruzada$M2_Territory_ID <- NULL 
limp_vendaCruzada$M1_Territory_ID <-NULL
limp_vendaCruzada$Brand <- NULL
limp_vendaCruzada$Latitude <- NULL
limp_vendaCruzada$Longitude <- NULL
limp_vendaCruzada$Postal.Code <- NULL
limp_vendaCruzada$Sous.groupement <- NULL
limp_vendaCruzada$Container.Size <- NULL
limp_vendaCruzada$TTC <- NULL
limp_vendaCruzada$Brut...TE <- NULL
limp_vendaCruzada$Net...TE...Hors.majoration.de.rompu.de.palette <- NULL
limp_vendaCruzada$DA <- NULL
limp_vendaCruzada$SEGMENTS...Pils...SpÃ.cialitÃ.s...SuperspÃ.cialitÃ.s.Bouteille.Young.adult <- NULL
limp_vendaCruzada$Container.Type<- NULL
limp_vendaCruzada$Variétés<- NULL
limp_vendaCruzada$Segment.LE<- NULL
limp_vendaCruzada$VariÃ.tÃ.s<- NULL
limp_vendaCruzada$MACO.HL<-NULL
limp_vendaCruzada$delivery_days <-NULL
limp_vendaCruzada$Groupement <-NULL


######################################################################################################

################################# Revisualizando limpeza do DataSet #################################
View(limp_vendaCruzada)
glimpse(limp_vendaCruzada)
#####################################################################################################


############################ Transformando dataset limpo em um dataframe ###########################
dados_venda<- data.frame(limp_vendaCruzada)
View(dados_venda) 
remove(limp_vendaCruzada)
remove(vendaCruzada)
sapply(dados_venda,class)
glimpse(dados_venda)

########################### Convertendo os dados do dataSet #######################################
#                                                                                                 #
#                   Fazendo a conversão para os tipos de dados respectivos                        #
###################################################################################################

#transformando variaveis de data
dados_venda$Doc..Date<-as.Date(suppressWarnings(as.character(dados_venda$Doc..Date)))
class(dados_venda$Doc..Date)

#################################### Trabalhando com dataSet de Treino #############################
#aproximadamente 10% da base de dados para teste
dados_treino = subset(dados_venda,dados_venda$ï..linhas<7300)
View(dados_treino)

#################################### Agrupando o pedido em um dataSet ##############################
agrupa_por_pedido<- ddply(dados_treino,c("Ship.to.nu","Doc..Date"),
                          function(df1)paste(df1$Material,
                                             collapse = ","))

View(agrupa_por_pedido)

#Descartando as variáveis que não entrarão na proxima etapa
agrupa_por_pedido$Ship.to.nu<- NULL
agrupa_por_pedido$Doc..Date <- NULL

#renomeando a coluna de v1 para Pedidos
colnames(agrupa_por_pedido)[1]<- "Pedidos"

pedidos<-data.frame(agrupa_por_pedido)
View(pedidos)

#para não ficar com variaveis em memoria
remove(dados_venda)
remove(dados_treino)
remove(agrupa_por_pedido)

#########################################################################################################

##### Gravando o arquivo em uma nova planilha com extensao .csv com todos dados dos Pedidos ############
write.csv(pedidos,"C:/FCD/VendaCruzada/VendaCruzada/algoritmos-de-recomendacao/market_basket_transactions.csv",quote = FALSE, row.names = FALSE)

####### Criei uma planilha com menos dados, mil pedidos, chamei ela de teste para fazer a predição ######
tr <- read.transactions('C:/FCD/VendaCruzada/VendaCruzada/algoritmos-de-recomendacao/market_basket_transactions.csv', 
                        format = 'basket', sep=',')

tr
summary(tr)

############################################## Rotina 1 - Recomendação Direta ###########################
#               Descrição: esta rotina se baseia em itens individuais vendidos baseados na frequência,  #
#               se o cliente não adicionou nada na cesta a recomendação é feita baseada em itens mais   #
#               vendidos.                                                                               # 
#                                                                                                       # 
#########################################################################################################

#recomendações diretas baseadas em itens mais vendidos
frequentItems <- eclat (tr, parameter = list(supp = 0.07, maxlen = 4))
View(inspect(sort(frequentItems)))
itemFrequencyPlot(tr,topN=20,type="absolute",col=brewer.pal(8,'Pastel2'), main="Itens Frequentes Absolutos")

############################################# Rotina 2 - Recomendação Apriori ###########################
#               Descrição: esta rotina se baseia em criar regras gerais de associações, usando a logica #
#               proposicional, se comprei A implica comprar item B, baseado na cesta de carrinho de     #
#                compras.                                                                               #
#                                                                                                       #               
#########################################################################################################

#Algoritmo apriori
association.rules <- apriori(tr,
                             parameter = list(supp=0.001, 
                                              conf=0.8,
                                              maxlen=4)
)

summary(association.rules)
#as 10 primeiras recomendações apriori
View(inspect(sort(association.rules[1:10])))

#busca um item especifico, ex.: quero saber a recomendação que combina budwiser  
rules <- apriori (data=tr, parameter=list (supp=0.001,conf = 0.08,maxlen=4), appearance = list (default="lhs",rhs="10946"), control = list (verbose=F))
View(inspect(sort(head(rules[1:10]))))




