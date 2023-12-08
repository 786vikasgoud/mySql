SELECT bowler,
round((sum(total_runs) /
(sum(CASE 
WHEN wide_runs =0 AND noball_runs=0 then 1
else 0
end )/6)),2) AS economy
FROM deliveries
JOIN matches
ON deliveries.match_id=matches.id
where season = 2015
group by bowler
ORDER BY economy
limit 10;