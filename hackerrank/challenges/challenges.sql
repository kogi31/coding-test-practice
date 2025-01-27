WITH ChallengeCounts AS (
    SELECT
        C.hacker_id,
        H.name,
        COUNT(C.challenge_id) AS challenges_created
    FROM
        Hackers AS H
    JOIN
        Challenges AS C
        ON H.hacker_id = C.hacker_id
    GROUP BY
        C.hacker_id, H.name
),
MaxChallenges AS (
    SELECT MAX(challenges_created) AS max_created
    FROM ChallengeCounts
)
SELECT
    hacker_id,
    name,
    challenges_created
FROM
    ChallengeCounts
WHERE
    challenges_created = (SELECT max_created FROM MaxChallenges)
   OR challenges_created < (SELECT max_created FROM MaxChallenges)
   AND challenges_created NOT IN (
       SELECT challenges_created
       FROM ChallengeCounts
       WHERE challenges_created < (SELECT max_created FROM MaxChallenges)
       GROUP BY challenges_created
       HAVING COUNT(*) > 1
   )
ORDER BY
    challenges_created DESC,
    hacker_id ASC;