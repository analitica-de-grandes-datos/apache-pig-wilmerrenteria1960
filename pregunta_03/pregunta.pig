/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

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

ordered_data = ORDER data BY numeros asc;
limit_data = LIMIT ordered_data 5;
STORE ordered_data INTO 'output' USING PigStorage(',');