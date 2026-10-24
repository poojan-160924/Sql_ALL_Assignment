/* 1.
Create a table called Playlist with columns: id (INT, primary key), song_name (VARCHAR), artist (VARCHAR), 
and duration (INT, seconds). Insert a single row for your current favorite song.*/

use musicplaylist;

CREATE TABLE Playlist (
    id INT PRIMARY KEY,
    song_name VARCHAR(100),
    artist VARCHAR(100),
    duration INT
);

INSERT INTO Playlist (id, song_name, artist, duration)
VALUES (1, 'Perfect', 'Ed Sheeran', 263);

SELECT * FROM Playlist;


/*2.
Insert 3 new rows into the Playlist table for songs you recently listened to on Spotify, 
including their song_name, artist, and duration */


INSERT INTO Playlist (id, song_name, artist, duration)
VALUES
(2, 'Shape of You', 'Ed Sheeran', 234),
(3, 'Blinding Lights', 'The Weeknd', 200),
(4, 'Believer', 'Imagine Dragons', 204);

SELECT * FROM Playlist;

/* 3.
Update the artist name for one of your Playlist entries to fix a typo 
(for example, change 'Arjit Singh' to 'Arijit Singh') using the UPDATE statement with a WHERE clause. */


update playlist
set artist = "ED SHEERAN"
WHERE id = 1;

select * from playlist;


/* 4.
Delete a song from the Playlist table where the duration is less than 120 seconds using the DELETE statement 
and a WHERE clause.<br><br><em><strong>Hint:</strong> 
Make sure your WHERE clause is specific so you don’t accidentally delete all rows.</em> */


DELETE FROM playlist
WHERE duration <= 230
AND id > 0;

select * from playlist;


/* 5.
Write an SQL statement that would update the song_name for all songs by 'AP Dhillon' 
in your Playlist to add '(Remix)' at the end of the name, but only if the duration 
is more than 180 seconds.<br><br><em><strong>Constraint:</strong> Combine UPDATE
 with WHERE to target only the correct rows.</em> */
 
 
 update  playlist
 set song_name  = "AP DILLON REMIX"
 where id ;
 
 select * from playlist;
 