SELECT
    name
FROM
    v$database 
    
show pdbs;

 alter session set container=FREEPDB1;
 
 SELECT USERNAME, CREATED
 FROM DBA_USERS
 ORDER BY 2 DESC;
 
 exec DBMS_VECTOR.DROP_ONNX_MODEL(model_name => 'ALL_MINILM_L12_V2', force => true);
 
 select model_name, algorithm, mining_function 
 from user_mining_models 
 where  model_name='ALL_MINILM_L12_V2';
 
 BEGIN
   DBMS_VECTOR.LOAD_ONNX_MODEL(
        directory => 'DM_DUMP',
                file_name => 'all_MiniLM_L12_v2.onnx',
        model_name => 'ALL_MINILM_L12_V2',
        metadata => JSON('{"function" : "embedding", "embeddingOutput" : "embedding", "input": {"input": ["DATA"]}}'));
END;
/

SELECT VECTOR_EMBEDDING(ALL_MINILM_L12_V2 USING 'The quick brown fox jumped' as DATA) AS embedding;

select vector_embedding(all_minilm_l12_v2 using 'Quick test' as data) AS my_vector;


create table movie_quotes as
select movie_quote, movie, movie_type, movie_year
from   external (
         (
           movie_quote  varchar2(400),
           movie        varchar2(200),
           movie_type   varchar2(50),
           movie_year   number(4)
         )
         type oracle_loader
    DEFAULT DIRECTORY dm_dump
    ACCESS PARAMETERS (
        RECORDS DELIMITED BY NEWLINE
            SKIP 1
            BADFILE dm_dump
            LOGFILE dm_dump : 'moview_quotes_ext_tab_%a_%p.log'
            DISCARDFILE dm_dump
        FIELDS CSV WITH EMBEDDED TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' MISSING FIELD VALUES ARE NULL (
            movie_quote CHAR ( 400 ),
            movie,
            movie_type,
            movie_year
        )
    )
    LOCATION ( 'movie_quotes.csv' )
REJECT LIMIT UNLIMITED );

SELECT *
FROM TAB;

SELECT count(*)
FROM MOVIE_QUOTES;

SELECT *
FROM MOVIE_QUOTES;

desc MOVIE_QUOTES

ALTER TABLE movie_quotes ADD (
    movie_quote_vector vector
);

UPDATE movie_quotes
SET
    movie_quote_vector = VECTOR_EMBEDDING(all_minilm_l12_v2
        USING movie_quote AS data
    );

variable search_text varchar2(100);
exec :search_text := 'Sporty movies';

set linesize 200
column movie format a50
column movie_quote format a100

SELECT vector_distance(movie_quote_vector, (vector_embedding(all_minilm_l12_v2 using :search_text as data))) as distance,
       movie,
       movie_quote
FROM   movie_quotes
order by 1
fetch approximate first 5 rows only;



variable search_text varchar2(100);
exec :search_text := 'Films about war';

set linesize 200
column movie format a50
column movie_quote format a100

SELECT vector_distance(movie_quote_vector, (vector_embedding(all_minilm_l12_v2 using :search_text as data))) as distance,
       movie,
       movie_quote
FROM   movie_quotes
order by 1
fetch approximate first 5 rows only;











CREATE TABLE my_vect_tab (
     v1  VECTOR(3, FLOAT32),
     v2  VECTOR(2, FLOAT64),
     v3  VECTOR(1, INT8),
     v4  VECTOR(1024, BINARY),
     v5  VECTOR(1, *),
     v6  VECTOR(*, FLOAT32),
     v7  VECTOR(*, *),
     v8  VECTOR,
     v9  VECTOR(10),
     v10 VECTOR(*, *, DENSE),
     v11 VECTOR(1024, FLOAT32, DENSE),
     v12 VECTOR(1000, INT8, SPARSE),
     v13 VECTOR(*, INT8, SPARSE),
     v14 VECTOR(*, *, SPARSE),
     v15 VECTOR(2048, FLOAT32, *)
   );

desc my_vect_tab