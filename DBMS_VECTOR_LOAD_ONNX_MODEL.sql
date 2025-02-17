select name
from v$database

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
         default directory DM_DUMP
         access parameters (
           records delimited by newline
           skip 1
           badfile DM_DUMP
           logfile DM_DUMP:'moview_quotes_ext_tab_%a_%p.log'
           discardfile DM_DUMP
           fields csv with embedded terminated by ',' optionally enclosed by '"'
           missing field values are null
           (
             movie_quote char(400),
             movie,
             movie_type,
             movie_year
           )
        )
        location ('movie_quotes.csv')
        reject limit unlimited
      );

SELECT *
FROM TAB;

SELECT *
FROM MOVIE_QUOTES;

