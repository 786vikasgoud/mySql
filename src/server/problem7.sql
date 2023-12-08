 SELECT season,batsman,
round(((sum(total_runs-extra_runs)/
 sum(case
		when wide_runs=0 AND noball_runs=0 then 1
        else 0
        end))*100),2)AS srikerate
from deliveries
join matches
on match_id=id
group by season,batsman;