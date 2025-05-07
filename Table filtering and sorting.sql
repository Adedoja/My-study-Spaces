DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE Find_Available_Rooms(
    IN in_start VARCHAR(10),
    IN in_end VARCHAR(10),
    IN in_day VARCHAR(10)
)
BEGIN
    -- Convert input start and end time to MySQL TIME format
    SET @start_time = STR_TO_DATE(in_start, '%h:%i%p');
    SET @end_time = STR_TO_DATE(in_end, '%h:%i%p');

    -- Select rooms that are NOT occupied at the given time on the given day
    SELECT DISTINCT building, room
    FROM csv
    WHERE CONCAT(building, '-', room) NOT IN (
        SELECT DISTINCT CONCAT(building, '-', room)
        FROM csv
        WHERE days LIKE CONCAT('%', in_day, '%')
          AND (
                STR_TO_DATE(beg_time, '%h:%i%p') < @end_time
            AND STR_TO_DATE(end_time, '%h:%i%p') > @start_time
          )
    );
END //

DELIMITER ;

    