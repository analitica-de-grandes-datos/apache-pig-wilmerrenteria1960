/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' AS (letra:chararray, letras:bag{}, conjuntos:map[]);
separate_words = FOREACH data GENERATE FLATTEN(conjuntos) AS pares;
grouped = GROUP separate_words BY pares;
wordcount = FOREACH grouped GENERATE group, COUNT(separate_words);
STORE wordcount INTO 'output' USING PigStorage(',');
