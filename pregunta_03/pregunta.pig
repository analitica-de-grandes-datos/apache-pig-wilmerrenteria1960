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
            letter:chararray,
            fecha:chararray,
            number:int
    );

data = FOREACH data GENERATE number;
order_Data = ORDER data BY  number ASC;
limit_data = LIMIT order_Data 5;
STORE limit_data INTO 'output' USING PigStorage(',');