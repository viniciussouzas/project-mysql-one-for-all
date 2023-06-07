SELECT 
  u.user_name AS pessoa_usuaria,
  COUNT(h.songs_id) AS musicas_ouvidas,
  ROUND(SUM(s.songs_length)/60, 2) AS total_minutos
FROM 
  User u 
  INNER JOIN History h ON u.user_id = h.user_id
  INNER JOIN Songs s ON s.songs_id = h.songs_id
GROUP BY pessoa_usuaria
ORDER BY pessoa_usuaria ASC;