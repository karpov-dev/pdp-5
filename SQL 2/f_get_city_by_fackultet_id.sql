CREATE DEFINER=`root`@`localhost` FUNCTION `f_get_city_by_fackultet_id`(fackultet_id INTEGER) RETURNS varchar(255) CHARSET utf8mb4
    READS SQL DATA
BEGIN
    DECLARE location_id INTEGER;
    DECLARE fackultet_city VARCHAR(255);
    SET location_id = (SELECT `LocationId` FROM `Facultet` WHERE `FackultetId` = fackultet_id);
    SET fackultet_city = (SELECT `City` FROM `Location` WHERE `LocationId` = location_id);
    return fackultet_city;
END