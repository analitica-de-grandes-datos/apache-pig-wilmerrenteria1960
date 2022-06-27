/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' AS (letra:chararray, letras:bag{});
separate_words = FOREACH data GENERATE FLATTEN(letras) AS word;
groupbywords = GROUP separate_words BY word;
total_words = FOREACH groupbywords GENERATE group, COUNT(separate_words);
STORE total_words INTO 'output' USING PigStorage(',');
