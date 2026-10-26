-- Session 13: Window Functions - Part 1

-- Task 1: Create a Playlists table and add sample records.

CREATE TABLE Playlists (
    id INT PRIMARY KEY,
    user_id INT,
    playlist_name VARCHAR(100),
    total_likes INT
);

INSERT INTO Playlists (id, user_id, playlist_name, total_likes) VALUES
(1, 101, 'Workout Mix', 450),
(2, 101, 'Chill Songs', 320),
(3, 101, 'Top Hits', 450),
(4, 102, 'Study Music', 280),
(5, 102, 'Party Songs', 500),
(6, 103, 'Love Songs', 390),
(7, 103, 'Old Favorites', 250),
(8, 104, 'Daily Mix', 500),
(9, 104, 'Relaxing Music', 350);


-- Task 2: Give every playlist a unique row number, from most likes to least likes.

SELECT
    playlist_name,
    user_id,
    total_likes,
    ROW_NUMBER() OVER (ORDER BY total_likes DESC) AS row_num
FROM Playlists;


-- Task 3: Rank all playlists by total likes.
-- Playlists with the same number of likes receive the same rank.

SELECT
    playlist_name,
    user_id,
    total_likes,
    RANK() OVER (ORDER BY total_likes DESC) AS playlist_rank
FROM Playlists;


-- Task 4: Rank each user's playlists by likes, starting again for each user.

SELECT
    playlist_name,
    user_id,
    total_likes,
    DENSE_RANK() OVER (
        PARTITION BY user_id
        ORDER BY total_likes DESC
    ) AS dense_rank
FROM Playlists;


-- Task 5: Show the top 2 playlists for each user based on total likes.
-- ROW_NUMBER ensures that only two playlists are selected for each user.

WITH RankedPlaylists AS (
    SELECT
        playlist_name,
        user_id,
        total_likes,
        ROW_NUMBER() OVER (
            PARTITION BY user_id
            ORDER BY total_likes DESC
        ) AS row_num
    FROM Playlists
)
SELECT playlist_name, user_id, total_likes, row_num
FROM RankedPlaylists
WHERE row_num <= 2
ORDER BY user_id, row_num;
