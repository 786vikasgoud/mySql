WITH matches AS (
SELECT season,player_of_match,
COUNT(player_of_match) AS matches_won,
ROW_NUMBER() OVER (PARTITION BY season ORDER BY COUNT(player_of_match) DESC) AS top
FROM matches
GROUP BY season,player_of_match
)
SELECT season, player_of_match, matches_won
FROM matches
WHERE top = 1;