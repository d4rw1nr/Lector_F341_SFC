#----------------------
# RECONSTRUIR FORMATO 341
# NAME: Darwin Rincon
# DATE: 31/01/2023

#---------------------

library(dplyr)

f341_1[is.na(f341_1)] = ""
f341_2 = f341_1[,c(1:7)]

f341_2$VLR = if_else(f341_2$REG == 5, 
                     paste("00000000000000000", f341_2$VLR, sep = ""), f341_2$VLR)

f341_2$VLR = if_else(f341_2$REG == 5,
                       substr(f341_2$VLR, nchar(f341_2$VLR)-16 , nchar(f341_2$VLR)), f341_2$VLR)

f341_2$VLR = if_else(f341_2$REG == 5,
                       paste("+", f341_2$VLR, sep = ""), f341_2$VLR)

F341_FINAL = c(paste(f341_2[,1], f341_2[,2], f341_2[,3], f341_2[,4], f341_2[,5], f341_2[,6], f341_2[,7],
                   sep = ""))

F341_FINAL = c(c(base$V1[c(1:353678)]), F341_FINAL) #Cambiar la fila "353678" por el numero de fila del separador en el script F341_1

write(F341_FINAL, "F0000104")  # Se exporta el documento final reconstruido con el formato aceptado por la SFC


