CREATE DEFINER=`root`@`localhost` FUNCTION `f_get_dekan_by_full_name`(first_name VARCHAR(255), last_name VARCHAR(255)) RETURNS int
    READS SQL DATA
BEGIN
    DECLARE dekan_id INTEGER;

    SELECT `TeacherId` INTO dekan_id 
    FROM `Teacher` 
    WHERE `FirstName` = first_name 
    AND `LastName` = last_name;
    
    RETURN dekan_id;
END