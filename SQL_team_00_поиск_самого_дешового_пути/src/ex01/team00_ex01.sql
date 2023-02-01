WITH RECURSIVE a_traces AS (
    SELECT
           point1::varchar as tour,
           point1,
           point2,
           cost
    FROM cities
    WHERE point1 = 'a'
    UNION ALL
    SELECT parrent.tour || ',' || child.point1 as trace,
           child.point1,
           child.point2,
           parrent.cost + child.cost
    FROM cities AS child
             INNER JOIN a_traces AS parrent ON child.point1 = parrent.point2
    WHERE tour not like '%' || child.point1 || '%'
)
SELECT cost total_cost, format('{%s,%s}', tour, point2) as tour
FROM a_traces
WHERE point2 = 'a' and length(tour) = 7 and (cost = (SELECT min(cost)
													 FROM a_traces
													 WHERE point2 = 'a' AND length(tour) = 7) or
											 cost = (SELECT max(cost)
													 FROM a_traces
													 WHERE point2 = 'a' AND length(tour) = 7))
ORDER by total_cost, tour;