create schema personalproject;
use personalproject;

CREATE TABLE csv (
    title VARCHAR(255),
    days VARCHAR(255), -- Like 'MWF', 'TR', etc.
    beg_time Varchar(255),     -- '10:00:00'
    end_time Varchar(255),     -- '11:15:00'
    building Varchar(100),      -- Assuming numeric building codes
    room VARCHAR(100),  -- Can be VARCHAR if rooms have weird labels like "1204A"
    crn varchar(100)
);