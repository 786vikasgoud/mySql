SELECT bowler,
ROUND((sum(total_runs) /
(sum(case when wide_runs=0 AND noball_runs=0 then 1
else 0
END)/6 )),2)AS economy
FROM deliveries
where is_super_over = 1
group by bowler
ORDER BY economy ASC
LIMIT 1;