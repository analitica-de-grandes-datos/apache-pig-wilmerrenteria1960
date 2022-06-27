/*
Pregunta
===========================================================================
Para responder la pregunta use el archivo `data.csv`.
Escriba el código equivalente a la siguiente consulta SQL.
   SELECT
       firstname,
       color
   FROM 
       u 
   WHERE 
       color REGEXP '^b';
Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:
$ pig -x local -f pregunta.pig
        /* >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.csv' USING PigStorage(',')
    AS (
            id: int,
            nombre:chararray,
            apellido:chararray,
            fecha:chararray,
            color:chararray,
            numero:chararray
    );

soloNombreColor= FOREACH data GENERATE nombre, color;
resultado= FILTER soloNombreColor BY (color MATCHES '.*^[bB].*');
STORE resultado INTO 'output' USING PigStorage(',');