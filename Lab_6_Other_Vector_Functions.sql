--Lab 6: Other Vector Functions

SELECT to_vector('[34.6, 77.8]', 2, float32) 
FROM dual;

SELECT to_vector('[34.6, 77.8, -89.34]', 3, float32);

--It is the distance from the origin to the vector
SELECT vector_norm(vector('[4, 3]', 2, float32) );

SELECT vector_norm(vector('[4, 3]', 2, float64) );

SELECT vector_norm(vector('[4, 3]', 2, int8) );

--Determine the number of dimensions in a Vector.
--vector_dimension_count() returns the number of dimensions in a vector.

SELECT vector_dimension_count(vector('[34.6, 77.8]', 2, float64));

SELECT vector_dimension_count(vector('[34.6, 77.8, 9]', 3, float32));

SELECT vector_dimension_count(vector('[34.6, 77.8, 9, 10]', 3, int8));

SELECT vector_dimension_count(vector('[34.6, 77.8]', 2, float64));

SELECT vector_dimension_count(vector('[34.6, 77.8, 9]', 3, float32));


SELECT vector_dimension_count(vector('[34.6, 77.8]', 2, float64));

SELECT vector_dimension_count(vector('[34.6, 77.8, 9]', 3, float32));

SELECT vector_dimension_count(vector('[34.6, 77.8, 9, 10]', 4, int8));

--vector_dimension_format() returns the format of the vector numbers

SELECT vector_dimension_format(vector('[34.6, 77.8]', 2, float64));

SELECT vector_dimension_format(vector('[34.6, 77.8, 9]', 3, float32));

SELECT vector_dimension_format(vector('[34.6, 77.8, 9, 10]', 3, int8));

SELECT vector_dimension_format(vector('[34.6, 77.8]'));

SELECT vector_dimension_format(vector('[34.6, 77.8, 9]'));

SELECT vector_dimension_format(vector('[34.6, 77.8, 9, 10]'));


--Serialization & Casting; 
--convert a Vectors for consumption by a wide variety of applications.
SELECT vector_serialize(vector('[1.1, 2.2, 3.3]', 3, float32));

SELECT vector_serialize(vector('[1.1, 2.2, 3.3]', 3, float32)
       returning varchar2(1000));

SELECT vector_serialize(vector('[1.1, 2.2, 3.3]', 3, float32)
       returning clob);

