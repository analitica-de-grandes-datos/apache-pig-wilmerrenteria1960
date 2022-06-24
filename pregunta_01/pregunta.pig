/* 
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra.
Almacene los resultados separados por comas. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' USING PigStorage('\t')
    AS (
            letras:chararray,
            fechas:chararray,
            numeros:int
    );

letras_agrupadas = GROUP data BY letras;
count_words = FOREACH letras_agrupadas GENERATE group, COUNT(data);
STORE count_words INTO 'output' USING PigStorage(',');