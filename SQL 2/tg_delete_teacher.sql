DROP TRIGGER IF EXISTS tg_delete_teacher;
CREATE TRIGGER tg_delete_teacher BEFORE DELETE ON Teacher FOR EACH ROW
BEGIN
    DECLARE teacher_fackultet_city VARCHAR(255);
    SELECT f_get_city_by_fackultet_id(OLD.FackultetId) INTO teacher_fackultet_city;

    UPDATE `Location` 
    SET `COUNT_TEACHERS_GRODNO` = (`COUNT_TEACHERS_GRODNO` - 1)
    WHERE City = teacher_fackultet_city
    AND `City` = 'Гродно';
END;