# recomendacao-ambev
sistema de recomendacao para venda cruzada
#  recomendação saideira
# Visão Geral
Este é um modelo de documentos para os projetos do Academy Hack.
Aqui você deve definir uma visão geral do seu projeto.
A ideia consiste em criar um algoritmo de recomendação para o ecossistema do aplicativo Bees, sugerindo recomendações baseadas no carrinho de compras, produtos mais vendidos no aplicativo e na sazonalidade de venda de um determinado produto. Com isso, podemos recomendar produtos que atendam a demanda do consumidor do aplicativo e indicar o produto sob demanda.
# Problema 
O publico alvo para a recomendação do algoritmo são os usuários do aplicativo Bees (Plataforma B2B). Pretendemos utilizar o aplicativo Bees do ecossistema Ambev para fazer sugestões com o aplicativo de recomendação, para potencializar as vendas, e consequentemente, aumentar o ticket médio do aplicativo Bees. 
# Proposta de solução
A proposta foi segmentada em três partes distintas, a primeira parte pensamos em uma recomendação direta, ou seja, baseado nos produtos mais vendidos na plataforma Bees. Em um segundo momento, pensamos em analisar o que o consumidor está comprando em seu carrinho de compras e recomendar por lógica proposicional (quem comprou x, levou y). E na terceira etapa, pensamos em analisar um produto específico e ver de forma sazonal, qual a melhor época para indicar o produto.
# Informações Técnicas
# Fluxograma do Sistema de Recomendação
Como o sistema de recomendação irá funcionar:

# Pré requisitos
•	Máquina que foi desenvolvida a solução:
Intel(R) Core(TM) i7-8565U CPU @ 1.80GHz   1.99 GHz
•	Sistema Operacional
Windows 10 Home Single Language
•	Linguagem Utilizada
Foi utilizado como linguagem principal o R e em um segundo momento Python
•	Bibliotecas
No R: dplyr, lubridate, ggplot2, arules, arulesSequences, RColorBrewer, readr, tidyverse
No Python: numpy, pandas, matplotlib, keras, tensorflow

# Processo de instalação e execução
Primeiro passo necessário é a instalação do RStudio. Com as instalações feitas o primeiro algoritmo a ser executado é o recomendação direta e apriori, depois pode ser executado o algoritmo canibalização e depois recomendação prepara rnn, para podermos trabalhar com o arquivo gerado em Python. Após isso, fazer instalação do jupyter notebook para executar o código de recomendação sazonal feito com rede neural.
É necessário lembrar que deve ser criado um diretório no C: com nome da pasta FCD, VendaCruzada e dentro dela VendaCruzada e outra pasta sistemaRecomendacao ou mudar o diretório no script
Como instalar o Rstudio:
https://www.youtube.com/watch?v=aeK6-kPhofk
Como instalar o Jupyter Notebook:
https://www.youtube.com/watch?v=_eK0z5QbpKA

# LinkedIn
Renan Craveiro de Oliveira:
https://www.linkedin.com/in/renan-craveiro-de-oliveira-942558212/
Gustavo Gomes:
https://www.linkedin.com/in/gomes-gustavo

# Github
Gustavo Gomes:
https://github.com/GustavGomes

Renan Craveiro não possui
