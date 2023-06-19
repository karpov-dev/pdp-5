DROP TRIGGER IF EXISTS tg_insert_teacher;
CREATE TRIGGER tg_insert_teacher AFTER INSERT ON Teacher FOR EACH ROW
BEGIN
    DECLARE teacher_fackultet_city VARCHAR(255);
    SELECT f_get_city_by_fackultet_id(NEW.FackultetId) INTO teacher_fackultet_city;

    UPDATE `Location` 
    SET `COUNT_TEACHERS_GRODNO` = (`COUNT_TEACHERS_GRODNO` + 1)
    WHERE City = teacher_fackultet_city
    AND `City` = 'Гродно';
END;