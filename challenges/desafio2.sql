SELECT
  (SELECT COUNT(*) FROM Songs) AS cancoes,
  (SELECT COUNT(*) FROM Artist) AS artistas,
  (SELECT COUNT(*) FROM Album) AS albuns;