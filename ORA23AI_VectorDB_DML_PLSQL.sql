SELECT *
FROM TAB;

DESC VECTOR_COURSE

SELECT *
FROM VECTOR_COURSE;



INSERT INTO VECTOR_COURSE
VALUES (3, 'Developing an AI/ML Powered Recipe Recommendation Engine', 
            TO_VECTOR(VECTOR_EMBEDDING(ALL_MINILM_L12_V2 USING 'Developing an AI/ML Powered Recipe Recommendation Engine' as DATA)));

INSERT INTO VECTOR_COURSE
VALUES (4, 'Building an Enterprise RAG Application with Semantic Search Powered by MongoDB Atlas Vector Search', TO_VECTOR(VECTOR_EMBEDDING(ALL_MINILM_L12_V2 USING 'Building an Enterprise RAG Application with Semantic Search Powered by MongoDB Atlas Vector Search' as DATA)));
COMMIT;
SELECT *
FROM Vector_course;


DECLARE
    v_id            NUMBER := 5;
    v_course_name   VARCHAR2(200) := 'Log Anomaly Detection with Natural Language Processing powered by AWS Bedrock Powered ';
    v_course_vector VARCHAR2(4000);
BEGIN
    -- Generating the vector embedding
    -- v_course_vector := TO_VECTOR(VECTOR_EMBEDDING(ALL_MINILM_L12_V2 USING v_course_name as DATA));

    -- Inserting the data into the VECTOR_COURSE table
    INSERT INTO VECTOR_COURSE (course_id, course_name, vector_embeddings)
    VALUES (v_id, v_course_name, (TO_VECTOR(VECTOR_EMBEDDING(ALL_MINILM_L12_V2 USING v_course_name as DATA))));
    

    COMMIT;
END;
/

select * from vector_course;

Update Vector_course
set course_id=3
where course_name like '%Engine%';

COMMIT;

ALTER TABLE Vector_course
ADD CONSTRAINT course_id_pk PRIMARY KEY (COURSE_ID);
