#Exercicio
#Limpeza e tratamento dos dados

dados = read.csv("Ex2/tempo.csv", sep = ";", na.strings = "", stringsAsFactors = T)
head(dados)
summary(dados)
dados
 #Explorar dados, colunas categoricas
#aparencia
countsAP = table(dados$Aparencia)
countsAP
barplot(countsAP, main="Aparencia", xlab="Aparencia")
#/////////////////////////////////////////////////////
#Temperatura
countsTE = table(dados$Temperatura)
countsTE
barplot(countsTE, main = "temperatura", xlab = "temperatura")
#Umidade
countsUM = table(dados$Umidade)
countsUM
barplot(countsUM, main = "Umidade", xlab = "Umidade")
#///////////////////////////////////////////////////
#Vento
countsVE = table(dados$Vento)
countsVE
barplot(countsVE, main="Vento", xlab="Vento")
#jogar
countsJO = table(dados$Jogar)
countsJO
barplot(countsJO, main="Jogar", xlab="Jogar")

#Explorar, colunas numericas

#Temperatura
summary(dados$Temperatura)
boxplot(dados$Temperatura, outline = FALSE)
hist(dados$Temperatura, main = "Temperatura", xlab="Temperatura")

#Umidade
summary(dados$Umidade)
boxplot(dados$Umidade, outline = FALSE)
hist(dados$Umidade, main = "Umidade", xlab="Umidade")


#valores faltantes - NAs
dados[!complete.cases(dados),]

#tratar dados
summary(dados$Umidade)
#ver mediana
median(dados$Umidade, na.rm = T)
#atribuir mediana a NAs
dados[is.na(dados$Umidade),]$Umidade = median(dados$Umidade, na.rm = T)
#buscar NAs em Temperatura para checar
dados[!complete.cases(dados$Umidade),]

#Falta de padronizacao
#ver vetores
unique(dados$Aparencia)
summary(dados$Aparencia)
summary(dados$Vento)
#transformar menos em moda
dados[dados$Aparencia == "menos", ]$Aparencia = "sol"
dados[is.na(dados$Vento), ]$Vento = "FALSO"
#ver resultado
summary(dados$Aparencia)
summary(dados$Vento)
#remover levels nao utilizados
dados$Aparencia = factor(dados$Aparencia)
dados$Vento = factor(dados$Vento)
#visualizar novamente
summary(dados$Aparencia)
summary(dados$Vento)


#Variaveis fora do dominio
summary(dados$Temperatura)
summary(dados$Umidade)
#fora do dominio, numerico - ver valores das variaveis anormais
dados[dados$Temperatura>130 | dados$Temperatura < -130, ]$Temperatura = median(dados$Temperatura, na.rm = T)
dados[dados$Umidade>100 | dados$Umidade < 0, ]$Umidade = median(dados$Umidade, na.rm = T)
#buscar novamente valores de variaveis anormais
dados[dados$Temperatura>130 | dados$Temperatura < -130, ]$Temperatura
dados[dados$Umidade>100 | dados$Umidade < 0, ]$Umidade
summary(dados$Temperatura)
summary(dados$Umidade)

#Dados duplicados
x = dados[duplicated(dados$Temperatura), ]
x

# Exportar dados tratados para CSV sem virgula
write.csv(dados, "Ex2/dados_tratados.csv", row.names = FALSE)

# Exportar dados tratados para CSV separado por virgula
write.csv2(dados, "Ex2/dados_tratados.csv", row.names = FALSE)
