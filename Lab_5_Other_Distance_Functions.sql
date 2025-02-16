--vector_distance(v1, v2, EUCLIDEAN);
--vector_distance(v1, v2, COSINE);
--vector_distance(v1, v2, DOT);
--vector_distance(v1, v2, MANHATTAN);
--vector_distance(v1, v2, HAMMING);

--Vector embedding model will determine the number of dimensions 
--and sometimes the distance function:

--Cohere embed-english-v2.0 = 4096 Dimensions
--Cohere embed-english-light-v2.0 = 1024 Dimensions
--Cohere embed-multilingual-v2.0 = 768 Dimensions
--OpenAI text-embedding-ada-002 = 1536 Dimensions and recommends Cosine Similarity for the distance function

--The vector_distance(v1, v2, distance_function) is the most general purpose syntax for Vector distances.



DROP TABLE IF EXISTS vt3 ;

CREATE TABLE vt3 AS SELECT * FROM vt2;

SELECT * FROM vt3 ORDER BY 1;

SELECT id, vsize, shape, color
FROM   vt3
ORDER  BY vector_distance( vector('[16, 4]'), v, EUCLIDEAN)
FETCH FIRST 4 ROWS ONLY;

SELECT id, vsize, shape, color
FROM   vt3
ORDER  BY vector_distance( vector('[16, 4]'), v, COSINE)
FETCH FIRST 4 ROWS ONLY;

SELECT id, vsize, shape, color
FROM   vt3
ORDER  BY vector_distance( vector('[16, 4]'), v, DOT)
FETCH FIRST 4 ROWS ONLY;

SELECT id, vsize, shape, color
FROM   vt3
ORDER  BY vector_distance( vector('[16, 4]'), v, MANHATTAN)
FETCH FIRST 4 ROWS ONLY;

SELECT id, vsize, shape, color
FROM   vt3
ORDER  BY vector_distance( vector('[16, 4]'), v, HAMMING)
FETCH FIRST 4 ROWS ONLY;



SELECT id, vsize, shape, color
FROM   vt3
ORDER  BY L1_distance( vector('[16, 4]'), v)
FETCH FIRST 4 ROWS ONLY;


    SELECT id, vsize, shape, color
    FROM   vt3
    ORDER  BY L2_distance( vector('[16, 4]'), v)
    FETCH FIRST 4 ROWS ONLY;
    
    
    
SELECT id, vsize, shape, color
FROM   vt3
ORDER  BY cosine_distance( vector('[16, 4]'), v)
FETCH FIRST 4 ROWS ONLY;


SELECT id, vsize, shape, color
FROM   vt3
ORDER  BY vector_distance( vector('[16, 4]'), v, COSINE)
FETCH FIRST 4 ROWS ONLY;




SELECT id, vsize, shape, color
FROM   vt3
ORDER  BY INNER_PRODUCT ( vector('[16, 4]'), v)
FETCH FIRST 4 ROWS ONLY;



SELECT id, vsize, shape, color
FROM   vt3
ORDER  BY vector('[16, 4]') <-> v
FETCH FIRST 4 ROWS ONLY;

SELECT id, vsize, shape, color
FROM   vt3
ORDER  BY vector('[16, 4]') <=> v
FETCH FIRST 4 ROWS ONLY;

SELECT id, vsize, shape, color
FROM   vt3
ORDER  BY vector('[16, 4]') <#> v
FETCH FIRST 4 ROWS ONLY;