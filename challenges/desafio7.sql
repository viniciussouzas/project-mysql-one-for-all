SELECT 
  a.artist_name AS artista,
  al.album_name AS album,
  COUNT(fl.artist_id) AS pessoas_seguidoras
FROM 
  Artist a
  INNER JOIN Album al ON a.artist_id = al.artist_id
  INNER JOIN Following_Artists fl ON a.artist_id = fl.artist_id
GROUP BY al.album_id
ORDER BY pessoas_seguidoras DESC, artista, album;