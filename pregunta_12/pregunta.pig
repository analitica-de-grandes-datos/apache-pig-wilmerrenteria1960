/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Obtenga los apellidos que empiecen por las letras entre la 'd' y la 'k'. La 
salida esperada es la siguiente:

  (Hamilton)
  (Holcomb)
  (Garrett)
  (Fry)
  (Kinney)
  (Klein)
  (Diaz)
  (Guy)
  (Estes)
  (Jarvis)
  (Knight)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.csv' USING PigStorage(',') AS (id:int, nombre:chararray, apellido:chararray , fecha:chararray , color:chararray, numero:int);

soloApellidos= FOREACH data GENERATE apellido;

obtencionApellidos =FILTER soloApellidos BY (apellido MATCHES '.*^[d-kD-K].*');

STORE obtencionApellidos INTO 'output' USING PigStorage(',');

                  
                