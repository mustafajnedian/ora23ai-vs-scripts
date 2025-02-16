--Lab 4: Attribute Filtering
-- function vector_distance() with the Euclidean Squared Vector distance function.

DROP TABLE IF EXISTS vt2;

CREATE TABLE vt2 AS SELECT * FROM vt1;

ALTER TABLE vt2 ADD (vsize varchar2(16),
                     shape varchar2(16),
                     color varchar2(16)
                    );

 DESC vt2;
 
UPDATE vt2
SET    vsize = 'Small'
WHERE  id IN (1, 4, 6, 8, 9, 21, 23, 26, 33, 44, 45, 52);

UPDATE vt2
SET    vsize = 'Medium'
WHERE  id IN (5, 22, 25, 32, 34, 42, 43, 53, 54, 55);

UPDATE vt2
SET    vsize = 'Large'
WHERE  id IN (2, 3, 7, 24, 31, 41, 51);

SELECT *
FROM VT2
ORDER BY VSIZE;

UPDATE vt2
SET    shape = 'Square'
WHERE  id IN (1, 3, 6, 42, 43, 54);

UPDATE vt2
SET    shape = 'Triangle'
WHERE  id IN (2, 4, 7, 22, 31, 41, 44, 55);

UPDATE vt2
SET    shape = 'Oval'
WHERE  id IN (5, 8, 9, 21, 23, 24, 25, 26, 32, 33, 34, 45, 51, 52, 53);

SELECT *
FROM VT2
ORDER BY SHAPE;

UPDATE vt2
SET    color = 'Red'
WHERE  id IN (5, 8, 24, 26, 33, 34, 42, 44, 45, 53, 54, 55);

UPDATE vt2
SET    color = 'Green'
WHERE  id IN (1, 4, 6, 21, 31, 52);

UPDATE vt2
SET    color = 'Blue'
WHERE id IN (2, 3, 7, 9, 22, 23, 25, 32, 41, 43, 51);

COMMIT;



SELECT *
FROM VT2
ORDER BY COLOR;


SELECT id, vsize, shape, color, v
FROM   vt2
ORDER  BY id;


SELECT vsize, count(vsize)
FROM   vt2
GROUP  BY vsize;

SELECT color, COUNT(color)
FROM   vt2
GROUP  BY color;

SELECT shape, COUNT(shape)
FROM   vt2
GROUP  BY shape;


SELECT id, vsize, shape, color, 
        to_number(vector_distance(vector('[16,3]'), v, EUCLIDEAN)) distance
FROM VT2
WHERE ID BETWEEN 30 AND 40
ORDER BY Vector_distance(vector('[16,3]'), v, EUCLIDEAN)
FETCH FIRST 3 ROWS ONLY;

SELECT id, vsize, shape, color,
       to_number(vector_distance(vector('[16, 3]'), v, EUCLIDEAN)) distance
FROM   vt2
WHERE  id > 30 AND id < 40
ORDER  BY vector_distance(vector('[16, 3]'), v, EUCLIDEAN)
FETCH FIRST 3 ROWS ONLY;

SELECT id, vsize, shape, color,
       to_number(vector_distance(vector('[16, 3]'), v, EUCLIDEAN)) distance
FROM   vt2
WHERE  id > 30 AND id < 40 AND shape = 'Oval'
ORDER  BY vector_distance(vector('[16, 3]'), v, EUCLIDEAN)
FETCH FIRST 3 ROWS ONLY;

SELECT id, vsize, shape, color,
       to_number(vector_distance(vector('[6, 8]'), v, EUCLIDEAN)) distance
FROM   vt2
WHERE color = 'Red' AND shape = 'Oval' AND vsize = 'Small' AND id > 10
ORDER  BY vector_distance(vector('[6, 8]'), v, EUCLIDEAN)
FETCH FIRST 10 ROWS ONLY;