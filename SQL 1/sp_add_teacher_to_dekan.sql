CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add_teacher_to_dekan`(IN first_name VARCHAR(255), IN last_name VARCHAR(255))
BEGIN
    DECLARE loaded_dekan_id INTEGER;
    DECLARE transfer_dekan_id INTEGER;
    DECLARE teacher_to_transfer_id INTEGER;

    SELECT f_get_more_loaded_dekan_id() INTO loaded_dekan_id;
    SELECT f_get_dekan_by_full_name(first_name, last_name) INTO transfer_dekan_id;
    SELECT f_get_teacher_by_dekan_id(loaded_dekan_id) INTO teacher_to_transfer_id;
    
    UPDATE `Teacher`
    SET `DekanId` = transfer_dekan_id
    WHERE `TeacherId` = teacher_to_transfer_id;
END