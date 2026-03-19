// Fixture list for a given time range
/*
//What are the games, venues, and kick-off times for the last EPL round in the season 2021/22?
*/
SELECT COUNTRY, COMPETITION, SEASON, DATE_TIME, HOME, AWAY, VENUE, status
FROM soccer.fixtures
WHERE season_uuid='8l3o9v8n8tva0bb2cds2dhatw'
    and DATE_TIME between '2022-05-22 00:00' and '2022-05-22 23:59';

// Team with most wins
/*
Which team won the most games in the EPL season 2021/22?
*/
SELECT CASE
        WHEN f.HOME_SCORE>f.AWAY_SCORE THEN f.home
        WHEN f.AWAY_SCORE>f.HOME_SCORE THEN f.away
    END RESULT,
    count(*) wins
FROM soccer.fixtures f
WHERE f.season_uuid='8l3o9v8n8tva0bb2cds2dhatw'
    AND f.status='Played'
GROUP BY RESULT
HAVING RESULT is not NULL
ORDER BY wins desc;

// Top scoring team
/*
Which team scored the most goals in the EPL season 2021/22?
*/
SELECT stats.team, sum(stats.goals) goals_scored
FROM 
    (SELECT f.home team, f.home_score goals
     FROM soccer.fixtures f
     WHERE f.season_uuid='8l3o9v8n8tva0bb2cds2dhatw'
        AND status='Played'
     
     UNION ALL
     
     SELECT f.away, f.away_score
     FROM soccer.fixtures f
     WHERE f.season_uuid='8l3o9v8n8tva0bb2cds2dhatw'
        AND status='Played') stats
GROUP BY stats.team
ORDER BY 2 desc;

