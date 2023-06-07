SELECT 
  s.songs_name AS cancao,
  COUNT(h.songs_id) AS reproducoes
FROM
  History h
  INNER JOIN Songs s ON h.songs_id = s.songs_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2;