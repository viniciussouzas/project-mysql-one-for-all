SELECT 
  user_name AS pessoa_usuaria,
  IF (YEAR(MAX(h.played_date)) >= '2021', 'Ativa', 'Inativa') AS status_pessoa_usuaria
FROM
  User u
  INNER JOIN History h ON u.user_id = h.user_id
GROUP BY pessoa_usuaria
ORDER BY pessoa_usuaria;