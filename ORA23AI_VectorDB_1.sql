SET ECHO ON
SET FEEDBACK 1
SET NUMWIDTH 10
SET LINESIZE 80
SET TRIMSPOOL ON
SET TAB OFF
SET PAGESIZE 100

SELECT VECTOR('[0,0]');
SELECT VECTOR('[10,0]');

SELECT VECTOR('[12,5]', 2, float32);

SELECT VECTOR('[12,5]', 2, int8);

SELECT VECTOR('[4,3]');
SELECT VECTOR('[5,-2]');
SELECT VECTOR('[-3,-4]');
SELECT VECTOR('[3.14,2.718]');
SELECT VECTOR('[-5.3,4.2]');
SELECT VECTOR('[-7,-9]');



SELECT VECTOR_DISTANCE(
      VECTOR('[0, 0]'),
      VECTOR('[10, 0]'),
      EUCLIDEAN) DISTANCE;
      
SELECT TO_NUMBER(VECTOR_DISTANCE(
    VECTOR('[0, 0]'),
    VECTOR('[10, 0]'),
    EUCLIDEAN)) DISTANCE;
    
    
SELECT TO_NUMBER(VECTOR_DISTANCE(
    VECTOR('[0, 0]', 2, FLOAT32),
    VECTOR('[0, 5]',2, FLOAT32),
    EUCLIDEAN)) DISTANCE;
    
    
SELECT TO_NUMBER(VECTOR_DISTANCE(
      VECTOR('[3, 6]', 2, FLOAT32),
      VECTOR('[3, 4]', 2, FLOAT32),
      EUCLIDEAN)) DISTANCE;
      
SELECT VECTOR_DISTANCE(
      VECTOR('[0, 0]'),
      VECTOR('[10, 0]'),
      EUCLIDEAN) DISTANCE;
      
SELECT VECTOR_DISTANCE(
        VECTOR('[5,-2]', 2, FLOAT32),
        VECTOR('[-3,-4]', 2, FLOAT32),
        EUCLIDEAN) DISTANCE;
        
        
SELECT vector('[3,4]')

SELECT vector_distance(vector('[1,2]'), vector('[3,4]'), EUCLIDEAN)
        
      
SELECT vector_distance(vector('[1,2]'), vector('[3,4]'), EUCLIDEAN)

SELECT vector_distance(vector('[5,-2]'), vector('[-3,-4]'), EUCLIDEAN)

SELECT TO_NUMBER(VECTOR_DISTANCE(
      VECTOR('[3.14, 2.718]'),
      VECTOR('[-5.3, 4.2]'),
      EUCLIDEAN)) DISTANCE;
      
CREATE TABLE IF NOT EXISTS vt1
         (id   NUMBER NOT NULL,
          v    VECTOR(2, FLOAT32),
               PRIMARY KEY (id)
         );

INSERT INTO vt1 VALUES (1, '[3, 3]'),  (2, '[5, 3]'),  (3, '[7, 3]'),
                       (4, '[3, 5]'),  (5, '[5, 5]'),  (6, '[7, 5]'),
                       (7, '[3, 7]'),  (8, '[5, 7]'),  (9, '[7, 7]');

COMMIT;

SELECT * FROM vt1
ORDER BY id;


SELECT id
FROM   vt1
ORDER  BY  vector_distance(vector('[5, 0]'), v, EUCLIDEAN)
FETCH FIRST 3 ROWS ONLY;

select *
from vt1
order by vector_distance(vector('[10,7]'), v, euclidean)
fetch first 3 rows only;

select *
from vt1
order by vector_distance(vector('[5,5]'), v, euclidean)
fetch first 5 rows only;

select *
from vt1
order by vector_distance(vector('[3.1,6.9]'), v, euclidean)
fetch first 4 rows only;


select *
from vt1
order by vector_distance(vector('[20,1]'), v, euclidean)
fetch first 10 rows only;


INSERT INTO vt1 VALUES (21, '[9, -1]'),
                       (22, '[10, -1]'),
                       (23, '[11, -1]'),
                       (24, '[9, -3]'),
                       (25, '[10, -4]'),
                       (26, '[12, -3]') ;

INSERT INTO vt1 VALUES (31, '[13, 6]'),
                       (32, '[14, 7]'),
                       (33, '[14, 4]'),
                       (34, '[16, 6]') ;

INSERT INTO vt1 VALUES (41, '[0, 7]'),
                       (42, '[1, 7]'),
                       (43, '[1, 6]'),
                       (44, '[0, 5]'),
                       (45, '[1, 5]') ;

INSERT INTO vt1 VALUES (51, '[5, 9]'),
                       (52, '[7, 9]'),
                       (53, '[6, 10]'),
                       (54, '[5, 11]'),
                       (55, '[7, 11]') ;

COMMIT ;

SELECT * FROM vt1;


select id
from vt1
order by vector_distance(vector('[16,4]'), v, euclidean)
fetch first 3 rows only;

select id
from vt1
order by vector_distance(vector('[7,-5]'), v, euclidean)
fetch first 5 rows only;

select id
from vt1
order by vector_distance(vector('[6,10]'), v, euclidean)
fetch first 5 rows only;

select id
from vt1
order by vector_distance(vector('[-1,6]'), v, euclidean)
fetch first 5 rows only;

select id
from vt1
order by vector_distance(vector('[6,8]'), v, euclidean)
fetch first 5 rows only;