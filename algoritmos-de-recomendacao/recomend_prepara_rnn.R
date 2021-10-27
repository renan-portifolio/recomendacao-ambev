##################################################################################################
##                                       Preparando Base                                        ##
##                              Para Fazer a Rede Neural em Python                              ##
#################################################################################################
setwd('C:/FCD/VendaCruzada/VendaCruzada/algoritmos-de-recomendacao')
getwd()

#Carregando pacotes
library(dplyr)
library(lubridate)

#carregando dataset
vendaCruzada <- read.csv("Data.csv", header = T, sep=';')
View(vendaCruzada)

#convertendo os dados
#trocando virgula por ponto para não perdemos os valores
cols <- sapply(vendaCruzada_atual$HL.delivered, function(x) any(grepl(",", x)))
vendaCruzada_atual$HL.delivered[cols] <- lapply(vendaCruzada_atual$HL.delivered[cols], function(x) as.numeric(sub(",", ".", x)))

vendaCruzada_atual$HL.delivered <- as.numeric(suppressWarnings(as.character(vendaCruzada_atual$HL.delivered)))

#Verificando se tem algum valor minssing value (NA) na base
any(is.na(vendaCruzada$HL.delivered))
any(is.na(substr(vendaCruzada$Doc..Date,4,10)))

#inserindo no dataset uma coluna com formato da data diferente (mes/ano)
colunaAno<-substr(vendaCruzada$Doc..Date,4,10)
colunaAno

vendaCruzada_atual <- mutate(vendaCruzada, ano=colunaAno)
View(vendaCruzada_atual)

#Limpando Dataset
vendaCruzada_atual$Order.qty <- NULL
vendaCruzada_atual$Ship.to.nu<- NULL
vendaCruzada_atual$PCS.delivered<- NULL
vendaCruzada_atual$delivery_days<- NULL
vendaCruzada_atual$delivery_flag<- NULL
vendaCruzada_atual$lead_time_creation_vs_rdd_flag<- NULL
vendaCruzada_atual$MACO.HL<- NULL
vendaCruzada_atual$Groupement<- NULL
vendaCruzada_atual$Postal.Code<- NULL
vendaCruzada_atual$Street<- NULL
vendaCruzada_atual$Sous.groupement<- NULL
vendaCruzada_atual$M2_Territory_ID<- NULL
vendaCruzada_atual$M1_Territory_ID<- NULL
vendaCruzada_atual$DÃ.pt<- NULL
vendaCruzada_atual$Brand<- NULL
vendaCruzada_atual$Subrand<- NULL
vendaCruzada_atual$SEGMENTS...Pils...SpÃ.cialitÃ.s...SuperspÃ.cialitÃ.s.Bouteille.Young.adult<- NULL
vendaCruzada_atual$Segment.LE<- NULL
vendaCruzada_atual$Latitude<- NULL
vendaCruzada_atual$Longitude<- NULL
vendaCruzada_atual$Degre.Alc<- NULL
vendaCruzada_atual$TTC<- NULL
vendaCruzada_atual$Brut...TE<- NULL
vendaCruzada_atual$Net...TE...Hors.majoration.de.rompu.de.palette<- NULL
vendaCruzada_atual$DA<- NULL

View(vendaCruzada_atual)

#mais variaveis para tirar do dataset
vendaCruzada_atual$ï..linhas<-NULL
vendaCruzada_atual$Container.Type<-NULL
vendaCruzada_atual$Container.Size<-NULL
vendaCruzada_atual$VariÃ.tÃ.s<-NULL
vendaCruzada_atual$Doc..Date<-NULL
View(vendaCruzada_atual)

glimpse(vendaCruzada_atual)

#Convertendo os dados
cols <- sapply(vendaCruzada_atual$HL.delivered, function(x) any(grepl(",", x)))
vendaCruzada_atual$HL.delivered[cols] <- lapply(vendaCruzada_atual$HL.delivered[cols], function(x) as.numeric(sub(",", ".", x)))

vendaCruzada_atual$HL.delivered <- as.numeric(suppressWarnings(as.character(vendaCruzada_atual$HL.delivered)))

#criando subset
BUD_subset_jan = vendaCruzada_atual %>%
  select(Material,HL.delivered,ano) %>%
  filter(Material == 71316, ano=="01/2020") 

jan<- sum(BUD_subset_jan$HL.delivered)
jan

BUD_subset_fev = vendaCruzada_atual %>%
  select(Material,HL.delivered,ano) %>%
  filter(Material == 71316, ano=="02/2020") 

fev<- sum(BUD_subset_fev$HL.delivered)
fev

BUD_subset_mar = vendaCruzada_atual %>%
  select(Material,HL.delivered,ano) %>%
  filter(Material == 71316, ano=="03/2020") 

mar<- sum(BUD_subset_mar$HL.delivered)
mar

BUD_subset_abr = vendaCruzada_atual %>%
  select(Material,HL.delivered,ano) %>%
  filter(Material == 71316, ano=="04/2020") 

abr<- sum(BUD_subset_abr$HL.delivered)
abr

BUD_subset_mai = vendaCruzada_atual %>%
  select(Material,HL.delivered,ano) %>%
  filter(Material == 71316, ano=="05/2020") 

mai<- sum(BUD_subset_mai$HL.delivered)
mai

BUD_subset_jun = vendaCruzada_atual %>%
  select(Material,HL.delivered,ano) %>%
  filter(Material == 71316, ano=="06/2020") 

jun<- sum(BUD_subset_jun$HL.delivered)
jun

BUD_subset_jul = vendaCruzada_atual %>%
  select(Material,HL.delivered,ano) %>%
  filter(Material == 71316, ano=="07/2020") 

jul<- sum(BUD_subset_jul$HL.delivered)
jul

BUD_subset_ago = vendaCruzada_atual %>%
  select(Material,HL.delivered,ano) %>%
  filter(Material == 71316, ano=="08/2020") 

ago<- sum(BUD_subset_ago$HL.delivered)
ago

BUD_subset_setem = vendaCruzada_atual %>%
  select(Material,HL.delivered,ano) %>%
  filter(Material == 71316, ano=="09/2020") 

setem<- sum(BUD_subset_setem$HL.delivered)
setem 

BUD_subset_out = vendaCruzada_atual %>%
  select(Material,HL.delivered,ano) %>%
  filter(Material == 71316, ano=="10/2020") 

out<- sum(BUD_subset_out$HL.delivered)
out

BUD_subset_nov = vendaCruzada_atual %>%
  select(Material,HL.delivered,ano) %>%
  filter(Material == 71316, ano=="11/2020") 


nov<- sum(BUD_subset_nov$HL.delivered)
nov

BUD_subset_dez = vendaCruzada_atual %>%
  select(Material,HL.delivered,ano) %>%
  filter(Material == 71316, ano=="12/2020") 

dez<- sum(BUD_subset_dez$HL.delivered)
dez

BUD_subset_jan21 = vendaCruzada_atual %>%
  select(Material,HL.delivered,ano) %>%
  filter(Material == 71316, ano=="01/2021") 

jan21<- sum(BUD_subset_jan21$HL.delivered)
jan21

BUD_subset_out19 = vendaCruzada_atual %>%
  select(Material,HL.delivered,ano) %>%
  filter(Material == 71316, ano=="10/2019") 

out19<- sum(BUD_subset_out19$HL.delivered)
out19

BUD_subset_nov19 = vendaCruzada_atual %>%
  select(Material,HL.delivered,ano) %>%
  filter(Material == 71316, ano=="11/2019") 


nov19<- sum(BUD_subset_nov19$HL.delivered)
nov19

#valores simbolicos para podermos realizar predição, pois nao temos dados suficientes
dez19<-81
jan19<- 70
fev19<-110
mar19<-55
abri19<-105
mai19<-290
jun19<-580
jul19<-480
ago19<- 598
set19<- 232
dez18<-dez19-(dez19*0.03)
jan18<-jan19-(jan19*0.03) 
fev18<-fev19-(fev19*0.03)
mar18<-mar19-(mar19*0.03)
abri18<-abri19-(abri19*0.03)
mai18<-mai19-(mai19*0.03)
jun18<-jun19-(jun19*0.03)
jul18<-jul19-(jul19*0.03)
ago18<-ago19-(ago19*0.03)  
set18<-set19-(set19*0.03) 
out18<-out19-(out19*0.03)
nov18<-nov19-(nov19*0.03)
dez17<-dez19-(dez19*0.03)
jan17<- jan18-(jan18*0.05)
fev17<- fev18-(fev18*0.05)
mar17<- mar18-(mar18*0.05)
abri17<-abri18-(abri18*0.05)
mai17<- mai18-(mai18*0.05)
jun17<- jun18-(jun18*0.05)
jul17<- jul18-(jul18*0.05)
ago17<- ago18-(ago18*0.05)
set17<- set18-(set18*0.05)
out17<- out18-(out18*0.05)
nov17<- nov18-(nov18*0.05)
dez16<- dez17-(dez17*0.05)
jan16<- jan17-(jan17*0.02)
fev16<- fev17-(fev17*0.02)
mar16<- mar17-(mar17*0.02)
abri16<-abri17-(abri17*0.02)
mai16<-mai17-(mai17*0.02)
jun16<-jun17-(jun17*0.02)
jul16<-jul17-(jul17*0.02)
ago16<-ago17-(ago17*0.02) 
set16<-set17-(set17*0.02) 
out16<-out17-(out17*0.02)
nov16<-nov17-(nov17*0.02)
dez15<-dez16-(dez16*0.03)
jan15<-jan16-(jan16*0.03) 
fev15<-fev16-(fev16*0.03)
mar15<-mar16-(mar16*0.03)
abri15<-abri16-(abri16*0.03)
mai15<- mai16-(mai16*0.03)
jun15<- jun16-(jun16*0.03)
jul15<- jul16-(jul16*0.03)
ago15<- ago16-(ago16*0.03) 
set15<- set16-(set16*0.03) 
out15<- out16-(out16*0.03)
nov15<-nov16-(nov16*0.03)
dez14<- dez15-(dez15*0.03)
jan14<- jan15-(jan15*0.03)
fev14<- fev15-(fev15*0.03)
mar14<- mar15-(mar15*0.03)
abri14<- abri15-(abri15*0.03)
mai14<-  mar15-(mar15*0.03)
jun14<- abri15-(abri15*0.03)
jul14<- jul15-(jul15*0.03)
ago14<- ago15-(ago15*0.03)
set14<- set15-(set15*0.03) 
out14<- out15-(out15*0.03)
nov14<- nov16-(nov15*0.03) 


df_final<- data.frame(Date=c( "01/2014","02/2014","03/2014","04/2014","05/2014","06/2014",
                              "07/2014","08/2014", "09/2014","10/2014","11/2014","12/2014",
                              "01/2015","02/2015","03/2015","04/2015","05/2015","06/2015",
                              "07/2015","08/2015", "09/2015","10/2015","11/2015","12/2015",
                              "01/2016","02/2016","03/2016","04/2016","05/2016","06/2016",
                              "07/2016","08/2016", "09/2016","10/2016","11/2016","12/2016",
                              "01/2017","02/2017","03/2017","04/2017","05/2017","06/2017",
                              "07/2017","08/2017", "09/2017","10/2017","11/2017","12/2017",
                              "01/2018","02/2018","03/2018","04/2018","05/2018","06/2018",
                             "07/2018","08/2018", "09/2018","10/2018","11/2018","12/2018",
                          "01/2019","02/2019","03/2019","04/2019","05/2019","06/2019",
                             "07/2019","08/2019", "09/2019","10/2019","11/2019","12/2019",
                             "01/2020","02/2020","03/2020","04/2020","05/2020","06/2020",
                             "07/2020","08/2020","09/2020","10/2020","11/2020","12/2020",
                             "01/2021"),
                      Production=c(jan14,fev14,mar14,abri14,mai14,jun14,jul14,ago14,set14,out14,nov14,dez14,
                        jan15,fev15,mar15,abri15,mai15,jun15,jul15,ago15,set15,out15,nov15,dez15,
                        jan16,fev16,mar16,abri16,mai16,jun16,jul16,ago16,set16,out16,nov16,dez16,
                        jan17,fev17,mar17,abri17,mai17,jun17,jul17,ago17,set17,out17,nov17,dez17,
                        jan18,fev18,mar18,abri18,mai18,jun18,jul18,ago18,set18,out18,nov18,dez18,
                        jan19,fev19,mar19,abri19,mai19,jun19,jul19,ago19,set19,out19,nov19,dez19,
                        jan,fev,mar,abr,mai,jun,jul,ago,setem,out,nov,dez,jan21))

View(df_final)
glimpse(df_final)


##### Gravando o arquivo em uma nova planilha com extensao .csv com todos dados dos Pedidos ############
write.csv(df_final,"C:/FCD/VendaCruzada/VendaCruzada/algoritmos-de-recomendacao/rnn.csv",quote = FALSE, row.names = FALSE)





