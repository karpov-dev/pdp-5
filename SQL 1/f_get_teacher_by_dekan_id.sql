CREATE DEFINER=`root`@`localhost` FUNCTION `f_get_teacher_by_dekan_id`(dekan_id INTEGER) RETURNS int
    READS SQL DATA
BEGIN
    DECLARE teacher_id INTEGER;

    SELECT `TeacherId` INTO teacher_id 
    FROM `Teacher` 
    WHERE `DekanId` = dekan_id 
    LIMIT 1;

    RETURN teacher_id;
END