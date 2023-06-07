SELECT 
  a.artist_name AS artista,
  al.album_name AS album
FROM 
  Artist a
  INNER JOIN Album al ON a.artist_id = al.artist_id
WHERE a.artist_id = 3
GROUP BY album_id
ORDER BY album;