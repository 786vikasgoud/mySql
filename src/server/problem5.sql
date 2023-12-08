SELECT (toss_winner)AS winners,(count(toss_winner)) AS count
FROM matches
WHERE toss_winner like winner
GROUP BY toss_winner;
