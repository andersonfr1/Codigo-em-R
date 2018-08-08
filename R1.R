###################################################################
#                     IN??CIO / A????ES B??SICAS
###################################################################
##Exibir pasta com os arquivos salvos
getwd()

##SET DEFAULT DIRECTORY
setwd("/Users/anderson/AnaliseDados/R")
getwd()

##Vari??veis
##N??o precisa declarar os tipos de vari??veis

minhavar = "P??s Big Data"
MINHAVAR = "Big Data"

n =2
m = 2.5

w = n*m
w = m%%n #Resto
w

q = m%/%n #quociente
q

class(n)
class(m)

###################################################################
#                     FUN????ES DO USU??RIO 
###################################################################
soma = function(a, b){
  a+b
}

x = soma(10,5)
x
#ou
print(x)
#ou
cat(x)

## IF ##

x <- c("Segredo", "Verdade", "Mentira")

if ("Verdade" %in% x){
  print("Termo Verdade foi encontrado")
} else {
  print("Termo Verdade nao foi encontrado")
}


## FOR ##
v = c("Segredo", "Verdade", "Mentira")
for (n in v) {
  print(n)
}


## REPEAT ##
n=1
repeat{
  print("Oi!")
  n = n+1
  if (n>=10) {
    break()
  }
}

## WHILE ##
while (n>=1) {
  print(n)
  n = n-1
}


###################################################################
#                     VETORES
###################################################################
v = c(1,2,3)
v

frutas = c("Laranja", "mac??", "Banana")
frutas

#Opera????es b??sicas com vetores
#criar um vetor

v = c(1:10) #cria o vetor v com os valores obtidos
v

v <- c(2,12,3,1,2,3,4,1,5,5,3,2,3)
v

#tamanho do vetor
length(v)

#retornar a lista de valores ??nicos
uniquev = unique(v)
uniquev

#retornar o menor valor do vetor
which.min(v)
v[which.min(v)]

#retornar o maior valor do vetor
which.max(v)
v[which.max(v)]

## Opera????es com vetores ##
i = c(2,5.5,6)
j = c(8,3,4)

#Operadores aritimeticos
cat("soma")
print(i+j)
cat("diferen??a")
print(j-i)
cat("produto")
print(i*j)
cat("divis??o")
print(i/j)
cat("Resto")
print(i%%j)
cat("Quociente")
print(i%/%j)

#Opera????es relacionais
print(i<j)
print(i==j)
print(i<-j)

##MATCH indica a posi????o no vetor na qual o elemento foi encontrado
v <- c(2,1,2,3,1,2,3,4,1,5,5,3,2,3)
x=c(1)
match(v,x)

x=c(1,3) #mascar?? as posi????es onde 1 e 3 forem econtradas
match(v,x) #a indica????o do match se da pela posi????o do valor no vetor x

#contar a frequencia de elementos dentro do vetor
uniquev = unique(v)
uniquev
tabulate(match(v, uniquev)) #cria um vetor com a contagem dos elementos (repeti????es)

vtabulate=tabulate(match(v, uniquev))
vtabulate
for (i in vtabulate) {
  cat("Key:", uniquev[i], "Valor:", vtabulate[i], "\n")
}

##retorna a posi????o do elementos com o maior n??mero de repeti????es
which.max(tabulate(match(v, uniquev)))
v[which.max(tabulate(match(v, uniquev)))] #retorna a moda


#medidas de concentra????o e dispers??o
v <- c(2,1,2,3,1,2,3,4,1,5,5,3,2,3,NA)
media = mean(v, na.rm = TRUE)
mediana = median(v)
desviopadrao = sd(v)
variancia = var(v)

media
mediana
desviopadrao
variancia

#Criar uma fun????o para encontrar a moda em um vetor qualquer
getmoda = function(v){
  uniquev = unique(v);
  v[which.max(tabulate(match(v, uniquev)))] 
}


##Pegando a moda de um vetor
vnome = c("Joao", "Maria", "Ana", "Joao", "Ana", "Joao")
getmoda(vnome)


###################################################################
#                     MATRIZ 
###################################################################
#criar matrizes de dados
dataml = matrix(1:9, byrow = TRUE, 3)
dataml

datamc = matrix(1:9, byrow = FALSE, 3)
datamc
class(datamc)
head(datamc)
ncol(datamc)

#Criar r??tulos para linhas e colunas
rownames = c("row1", "row2", "row3", "row4")
colnames = c("col1", "col2", "col3")

P = matrix(c(3:14), nrow = 4, byrow = TRUE, dimnames = list(rownames, colnames))
P

q = matrix(c(3:14), nrow = 4, byrow = TRUE)
colnames(q)= c("x1", "x2", "y")
q

s = matrix(c(3:14), nrow = 4, byrow = TRUE)
rownames(s)= c("l1", "l2", "l3","l4")
s

w = matrix(c(3:14), nrow = 4, byrow = TRUE)
rownames(w)= c("l1", "l2", "l3","l4")
colnames(w)= c("x1", "x2", "y")
w

###################################################################
#                     DATA FRAMES 
###################################################################
#Criar o data frame
emp.dados = data.frame(
  emp_id = c(1:5),
  emp_nome = c("Ricardo", "Daniele", "Michele", "Reinaldo", "Gabriela"),
  salario = c(6233,5152,6110,7290,8432),
  data_inicio = as.Date(c("2012-01-01", "2013-09-23", "2014-11-15", "2014-05-11", "2015-03-27")),
  stringsAsFactors = FALSE
)

#mostra o data Frame
print(emp.dados)

#mostra a estrutura do data frame
str(emp.dados)

#mostra a estrutura do data frame
summary(emp.dados)

#desvio padr??o
print(sd(emp.dados$salario))

#salario m??dio
emp.salariomedio = mean(emp.dados$salario)
emp.salariomedio

#Extrair colunas espec??ficas do data Frame
result = data.frame(emp.dados$emp_nome, emp.dados$salario)
print(result)

#Extrair as duas primeiras linhas do data frame
result = emp.dados[1:2,]
print(result)

#Extrair determinadas primeiras linhas do data frame
result = emp.dados[c(3,5),]
print(result)

#Adicionar coluna ao data frame (Reshaping)
#basta atribuir valores a uma coluna inexistente
emp.dados$depto = c("TI", "Comercial","TI","RH","Financeiro")
emp.dados

#Adicionar as linhas
#Aten????o: as linhas devem ter a mesma estrutura do data frame
#Cria o segundo data frame
emp.novosdados = data.frame(
  emp_id = c(6:8),
  emp_nome = c("Roberta", "Tatiana", "Carlos"),
  salario = c(5780,7225,6328),
  data_inicio = as.Date(c("2013-05-21", "2013-07-30", "2014-06-10")),
  depto = c("TI","Marketing","Financeiro"),
  stringsAsFactors = FALSE
)

#Conecta os dois data frames
emp.finaldados = rbind(emp.dados, emp.novosdados)
print(emp.finaldados)

#Criar tr??s vetores
cidade = c("Salvador", "Fortaleza", "Ceres", "Campo Grande")
state = c("BA", "CE", "GO", "MT")
cep = c("336002-200","98104-223","66161-300", "80294-340")

#Combinar os tr??s vetores em um data frame
enderecos = cbind(cidade,state,cep)
enderecos

###################################################################
#                     MANIPULANDO ARQUIVOS 
###################################################################
dados = read.csv("/Users/anderson/PosBigData/AnaliseDados/R/passageiros.csv", TRUE, ";")
class(dados) #Imprime o tipo da vari??vel dados
ncol(dados) #imprime o n??mero de colunas do data.frame
head(dados) #exibe as primeiras linhas do data.frame
names(dados) #imprime os r??tulos das colunas do data frame

yt_dados = dados["yt"] #copia a coluna com r??tulo "yt" para 
names(yt_dados) #imprime o r??tulo do novo data frame

dados_2 = dados[1:2]
names(dados_2)
dados_2

#M??dia
yt.media = mean(yt_dados$yt, na.rm = TRUE)
yt.media

#Mediana
yt.mediana = median(yt_dados$yt, na.rm = TRUE)
yt.mediana

#Quartis
quantile(yt_dados$yt, na.rm = TRUE)

###################################################################
#                     GR??FICOS 
###################################################################
#setores (Pizza)
#dados para gr??fico

x = c(21,62,10,53)
labels = c("London", "New York", "Singapore", "Mumbai")

#Nome do arquivo para gravar no disco
#png(file = "city.png")

#Platar o gr??fico
dev.off(dev.cur())
pie(x,labels)

#Plotar o gr??fico com t??tulo, r??tulos de dados
pie(x, labels, main = "Cidades", col = rainbow(length(x)))


###################################################################
#                     S??RIES TEMPORAIS 
###################################################################
rainfall = c(799,1174.8,865.1,1334.6,635.4,918.5,685.5,998.6,784.2,985,882.8,1071)

# Converter para um objeto time series
rainfall.timeseries=ts(rainfall, start = c(2012,1), frequency = 4)
#start determina a data da primeira observa????o
#frequency determina o tipo do per??odo
#frequency =12 coloca os pontos de dados a cada m??s do ano
#frequency = 4 coloca os pontos de dados a cada trimestre do ano
#frequency = 6 coloca os pontos de dados a cada 10 min, hora a hora
#frequency = 4 coloca os pontos de dados a cada 

#imprime a s??rie
print(rainfall.timeseries)
plot(rainfall.timeseries)

###################################################################
#                     HOLT WINTERS 
###################################################################
x = 1:24
x
y=5*x+rnorm(24,2,8) #simulacao de dados
plot(y)
dados.serie = ts(y, frequency = 4, start = c(2010,1))
dados.serie
plot(dados.serie)
mod1=HoltWinters(dados.serie, seasonal = "additive")
plot(mod1)
plot(fitted(mod1))
pred=predict(mod1,4,prediction.interval = TRUE)
pred
plot(mod1,pred)


#Com os dados de incidentes
incidentes = c(739,742,738,747,751,752,756,768,766)
plot.ts(incidentes)
incidentes.serie = ts(incidentes, start = c(2018,1), frequency = 4)
incidentes.serie
plot(incidentes.serie)

mod2 = HoltWinters(incidentes.serie, alpha = 0.2, beta = 0.5, gamma = 0.3, seasonal = "additive", start.periods = 2)
fitted(mod2)
plot(mod2)


###################################################################
#                     CORRELA????O
###################################################################
x = c(1,2,3)
y = c(4,5,6)
cor(x,y)


###################################################################
#                     REGRESS??O
###################################################################

altura = c(151,174,138,186,128,136,179,163,152,131)
peso = c(63,81,56,91,47,57,76,72,62,48)

#utiizar lm()
regression.model = lm(peso~altura)
print(regression.model)
print(summary(regression.model))

#Prever o valor do peso, dado a altura da pessoa
a = data.frame(altura = 170)
resultado = predict(regression.model,a)
print(resultado)



