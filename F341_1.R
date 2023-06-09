#----------------------
# LECTOR FORMATO 341
# NAME: Darwin Rincon
# DATE: 31/01/2023

#---------------------

# Librerías
library(dplyr)

options(scipen = 999)

# Leer base completa del Formato 341

setwd("Documents/Trabajo/F341") # Se establece la carpeta a trabajar (Opcional)

base = read.csv("C:/Users/darwi/Documents/Trabajo/F341/F341_1.txt", header = FALSE) # Colocar ruta del documento final F341

# Registro Separador
# 30000000000000000000000000000000000

# Separa los datos de clientes de los Valores
# Cambiar el número "353678" por la fila del registro separador

f341 = base[c((353678+1):nrow(base)),1]


# Ordena la informacion
f341_1 = data.frame(CONSEC=substr(f341[c(1:length(f341))],1,8), 
                    REG=substr(f341[c(1:length(f341))],9,9),
                  FORMATO=substr(f341[c(1:length(f341))],10,12), 
                  COL_CC=substr(f341[c(1:length(f341))],13,14),
                  UC_CIIU=substr(f341[c(1:length(f341))],15,16), 
                  RENG=substr(f341[c(1:length(f341))],17,19),
                  VLR=substr(f341[c(1:length(f341))],20,42))

rm(f341)

# Ordena los encabezados por cliente
f341_1$COL_CC = if_else(f341_1[["REG"]] == 4, paste(f341_1$COL, f341_1$UC, f341_1$RENG, substr(f341_1$VLR,1,3), sep = ""), f341_1$COL)
f341_1$UC_CIIU = if_else(f341_1[["REG"]] == 4, substr(f341_1$VLR,4,12), f341_1$UC_CIIU)
f341_1$RENG[f341_1[["REG"]] == 4] = ""
f341_1$VLR[f341_1[["REG"]] == 4] = ""
f341_1$VLR = as.numeric(substr(f341_1$VLR,2,21))

# Se asigna una nueva variable con solo cedulas para facilitar las consultas
f341_1$CEDULAS = if_else(f341_1$REG == 4, f341_1$COL_CC, '0')

CEDULAS_TEMP = f341_1$CEDULAS

for (i in (2:length(CEDULAS_TEMP))) {
  CEDULAS_TEMP[i] = if_else(CEDULAS_TEMP[i] == '0', CEDULAS_TEMP[i-1], CEDULAS_TEMP[i])
}

f341_1$CEDULAS = CEDULAS_TEMP

f341_1[is.na(f341_1)] = ""

#BUSCADOR POR CEDULAS 10 DIGITOS
f341_1[f341_1$CEDULAS == '1213677876',]

#BUSCADOR POR CONSECUTIVO
f341_1[f341_1$CONSEC == '01718031',]

f341_1[f341_1$AJUSTE != 0,]

#AJUSTADOR DE DATOS COL
f341_1[ 3053609 ,5] = '01'
f341_1[ 3053609 ,]

