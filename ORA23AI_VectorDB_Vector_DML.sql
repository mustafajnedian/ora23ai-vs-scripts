SELECT *
FROM TAB;

DESC VT1
DESC VT2
DESC VT3
DESC movie_quotes

DESC My_vect_tab

SELECT *
FROM MY_VECT_TAB;


SELECT VECTOR('[2.1,3.5,4.9]');

INSERT INTO MY_VECT_TAB (V1, V2, V3)
VALUES ('[5.52342342, 4.34423423, 6.94234234]',
        '[2.1242342342344,3.453453465456456645645645653]',
        '[5.432423]');
        
        
INSERT INTO MY_VECT_TAB (V6, V7, V8)
VALUES ('[3.3, 7.7, 8.8]', '[4.5,6.9,10.3, 11.7]','[2312312.3123123]');

CREATE TABLE VECTOR_COURSE (
    COURSE_ID NUMBER, 
    COURSE_NAME VARCHAR2(25)
);

DESC VECTOR_COURSE

ALTER TABLE VECTOR_COURSE
ADD COURSE_EMBEDDING_1 VECTOR(3, FLOAT32, DENSE);


alter table vector_course
modify course_name varchar2(200);

INSERT INTO VECTOR_COURSE
VALUES (1, 'Building an Enterprise RAG Application using MongoDB Aggregation Pipelines and Semantic Search Powered by Atlas Vector Search', '[3.3, 6.7, 7.9]');


select *
from vector_course;


SELECT model_name, mining_function, algorithm, algorithm_type, model_size
     FROM   user_mining_models;
     
SELECT model_name, attribute_name, attribute_type, data_type, vector_info
FROM   user_mining_model_attributes;


SELECT TO_VECTOR(VECTOR_EMBEDDING(ALL_MINILM_L12_V2 USING 'hello' as data)) AS embedding;



UPDATE VECTOR_COURSE
SET COURSE_EMBEDDING = SELECT TO_VECTOR(VECTOR_EMBEDDING(ALL_MINILM_L12_V2 USING 'Building an Enterprise RAG Application using MongoDB Aggregation Pipelines and Semantic Search Powered by Atlas Vector Search' as DATA))
WHERE COURSE_ID=1;

ALTER TABLE MY_VECT_TAB
ADD LONG_EMBEDDING VECTOR;

INSERT INTO MY_VECT_TAB (LONG_EMBEDDING)
VALUES (TO_VECTOR(VECTOR_EMBEDDING(ALL_MINILM_L12_V2 USING 'Building an Enterprise RAG Application using MongoDB Aggregation Pipelines and Semantic Search Powered by Atlas Vector Search' as DATA)));

SELECT LONG_EMBEDDING
FROM MY_VECT_TAB;

SELECT * FROM VECTOR_COURSE;

alter table vector_course
drop column course_embedding_1;

alter table vector_course
add vector_embeddings VECTOR(384, FLOAT32, DENSE);

desc vector_course

INSERT INTO VECTOR_COURSE
VALUES (1, 'Building an Enterprise RAG Application with Semantic Search Powered by using Oracle 23ai', TO_VECTOR(VECTOR_EMBEDDING(ALL_MINILM_L12_V2 USING 'Building an Enterprise RAG Application with Semantic Search Powered by using Oracle 23ai' as DATA)));
INSERT INTO VECTOR_COURSE
VALUES (2, 'Building an Enterprise RAG Application with Semantic Search Powered by MongoDB Atlas Vector Search', TO_VECTOR(VECTOR_EMBEDDING(ALL_MINILM_L12_V2 USING 'Building an Enterprise RAG Application with Semantic Search Powered by MongoDB Atlas Vector Search' as DATA)));
COMMIT;
SELECT *
FROM Vector_course;

DELETE from Vector_course
where vector_embeddings IS NULL;

INSERT INTO MY_VECT_TAB (LONG_EMBEDDING)
VALUES (TO_VECTOR(VECTOR_EMBEDDING(ALL_MINILM_L12_V2 USING 'Building an Enterprise RAG Application with Semantic Search Powered by using Oracle 23ai' as DATA)));

select to_number(vector_distance(vector(course_name, TO_VECTOR(VECTOR_EMBEDDING(ALL_MINILM_L12_V2 USING 'Building an Enterprise RAG Application using MongoDB Aggregation Pipelines and Semantic Search Powered by Atlas Vector Search' as DATA))))
from vector_course;
