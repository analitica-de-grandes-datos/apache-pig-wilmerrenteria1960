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
separate_words = FOREACH data GENERATE FLATTEN(TOKENIZE(letras)) AS word;
grouped = GROUP separate_words BY word;
wordcount = FOREACH grouped GENERATE group, COUNT(words);
STORE wordcount INTO 'output' USING PigStorage(',');
