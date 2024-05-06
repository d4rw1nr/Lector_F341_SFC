# Lector_F341_SFC

Scripts de R, con los cuales se puede crear una tabla de datos estructurados a partir del formato final 341 que se transmite trimestralmente a la SFC por parte de las entidades financieras.

Con el script **F341_1** se puede leer el documento original para transmitir a la SFC y transformar en una tabla estructurada con el fin de que se puedan realizar ajustes o validaciones de manera sencilla, teniendo en cuenta que la base de datos estructurada cuenta con la siguiente estructura:

|NOMBRE COLUMNA|DESCRIPCIÓN|
|---|---|
|CONSEC|Consecutivo de 8 digitos|
|REG|Tipo de registro: 4 para encabezado de cliente; 5 para informacion financiera|
|FORMATO|Formato 341|
|COL_CC|Cédula para registros 4 y Num de columna para registros 5|
|UC_CIIU|Codigo CIIU+digitos finales para registros 4 y Unidad de Captura para registros 5|
|RENG|Num de renglón (NA para registros 4)|
|VLR|Valor del dato reportado (NA para registros 4)|
|CEDULAS|Cédula del cliente (Facilita la ubicación de todos los registros de una cédula al repetir el valor para todas las variables pertenecientes a dicha cédula)|

Luego de realizadas las validaciones o ajustes, la tabla ajustada se puede restaurar al formato original que es aceptado por la SFC con el script **F341_2**.

La descripcion de los elementos en los script se relaciona a continuación:

|ELEMENTO|DESCRIPCIÓN|
|---|---|
|base|Documento original importado|
|f341_1|Base de datos estructurada segun la tabla anterior (En esta se pueden realizar todos los ajustes necesarios)|
|f341_2|Base de datos transformada en el formato original para la información financiera de clientes|
|f341_FINAL|Elemento completo con el formato final que es exportado y puede ser remitido a la SFC|

***WARNING:*** A la hora de realizar ajustes, se debe tener en cuenta que se respeten los consecutivos y las sumatorias por columnas y renglones que son validadas de forma automática al ser transmitidas a la SFC.
