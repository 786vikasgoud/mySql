SELECT batting_team ,sum(extra_runs) AS extraruns
FROM deliveries
JOIN matches 
ON deliveries.match_id = matches.id
WHERE matches.season = 2016
GROUP BY batting_team