select batsman,bowler,
count(case
when dismissal_kind not like ("run out") AND dismissal_kind not like "" then 1
else 0
end) AS dissmissed
from deliveries
where dismissal_kind not like ("run out") AND dismissal_kind not like ""
group by batsman,bowler
order by dissmissed desc
LIMIT 1;