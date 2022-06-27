/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' AS (letra:chararray, letras:bag{}, conjuntos:map[]);

separate_words = FOREACH data GENERATE letra, COUNT_STAR(letras) as totalLetras, SIZE(conjuntos) as totalConjuntos;

datosOrdenados = ORDER separate_words BY letra, totalLetras ,totalConjuntos ;

STORE datosOrdenados INTO 'output' USING PigStorage(',');