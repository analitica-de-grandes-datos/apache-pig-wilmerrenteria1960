/*
Pregunta
===========================================================================
Para responder la pregunta use el archivo `data.csv`.
Escriba el código equivalente a la siguiente consulta SQL.
   SELECT 
       firstname 
   FROM 
       u 
   WHERE 
       SUBSTRING(firstname, 0, 1) >= 'm';
Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:
$ pig -x local -f pregunta.pig
        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.csv' USING PigStorage(',') AS (id:int, nombre:chararray, apellido:chararray , fecha:chararray , color:chararray, numero:int);

sub_data= FOREACH data GENERATE nombre;
substring_data = FOREACH sub_data GENERATE SUBSTRING(nombre, 0, 1) >= 'M';
STORE substring_data INTO 'output' USING PigStorage(',');
