-- by saving each step as a separate file, and asking the developer to run each step of the command, 
-- we are making sure that the database setup exactly matches our own process,
--  and any errors in the setup process can be easily rolled back.
ALTER TABLE bookmarks ADD COLUMN title VARCHAR(60);