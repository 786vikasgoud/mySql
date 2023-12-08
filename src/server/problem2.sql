SELECT season,winner,(count(winner))AS count
FROM matches
GROUP BY season,winner;