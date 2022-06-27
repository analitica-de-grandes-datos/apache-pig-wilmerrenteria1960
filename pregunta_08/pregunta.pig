/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' USING PigStorage('\t')
    AS (
            letra:chararray,
            conjunto:chararray,
            lista:chararray
    );

valores= FOREACH data GENERATE FLATTEN(TOKENIZE(conjunto, ',')) AS conjunto_separados, FLATTEN(TOKENIZE(lista, ',')) AS lista_desagregada;
valores = FOREACH valores GENERATE REPLACE(conjunto_separados, '([^a-zA-Z\\s]+)','') AS letra, REPLACE(lista_desagregada,'([^a-zA-Z\\s]+)','') AS clave;
valores = FOREACH valores GENERATE TOTUPLE(letra,clave) as tupla;
agrupacion = GROUP valores BY tupla;
contador = FOREACH agrupacion GENERATE group, COUNT(valores);
STORE contador INTO 'output' USING PigStorage(',');
