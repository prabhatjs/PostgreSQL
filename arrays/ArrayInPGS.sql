CREATE TABLE IF NOT EXISTS COUNTRY_COLOR(
    ID SERIAL PRIMARY KEY,
    COUNTRY_CODE VARCHAR(4),
    COLORS TEXT[]
)

INSERT INTO COUNTRY_COLOR(COUNTRY_CODE,COLORS)
VALUES
('IND',ARRAY['ORANGE','WHITE','GREEN']);

SELECT * FROM country_color;

INSERT INTO COUNTRY_COLOR(COUNTRY_CODE,COLORS)
VALUES
('PAK','{"GREEN","WHITE"}')


--GIVE FIRST ARRAY INDEX FROM ALL DATA ITEMS
SELECT COLORS[1] FROM COUNTRY_COLOR;

--give lenght of array in table
select COUNTRY_CODE,array_length(COLORS,1) from country_color