CREATE DEFINER=`root`@`localhost` FUNCTION `f_get_more_loaded_dekan_id`() RETURNS int
    READS SQL DATA
BEGIN
    DECLARE loadedDekanId INTEGER;
    
    SELECT `TeacherId` INTO loadedDekanId
    FROM `Teacher` as T
    WHERE `DekanId` IS NULL
    AND (
        SELECT COUNT(*) 
        FROM `Teacher` 
        WHERE `DekanId` = T.`TeacherId`
        ) = (
            SELECT COUNT(*) as teachers 
            FROM `Teacher` 
            WHERE `DekanId` IS NOT NULL 
            GROUP BY `DekanId` 
            ORDER BY teachers DESC 
            LIMIT 1);
            
    RETURN loadedDekanId;
END