DROP TRIGGER IF EXISTS tg_update_teacher;
CREATE TRIGGER tg_update_teacher AFTER UPDATE ON Teacher FOR EACH ROW
BEGIN
    DECLARE old_teacher_fackultet_city VARCHAR(255);
    DECLARE new_teacher_fackultet_city VARCHAR(255);

    SELECT f_get_city_by_fackultet_id(OLD.FackultetId) INTO old_teacher_fackultet_city;
    SELECT f_get_city_by_fackultet_id(NEW.FackultetId) INTO new_teacher_fackultet_city;

    UPDATE `Location` 
    SET `COUNT_TEACHERS_GRODNO` = (`COUNT_TEACHERS_GRODNO` + 1)
    WHERE `City` = 'Гродно'
    AND `City` = new_teacher_fackultet_city 
    AND `City` != old_teacher_fackultet_city;

    UPDATE `Location` 
    SET `COUNT_TEACHERS_GRODNO` = (`COUNT_TEACHERS_GRODNO` - 1)
    WHERE `City` = 'Гродно'
    AND `City` = old_teacher_fackultet_city 
    AND `City` != new_teacher_fackultet_city;
END;