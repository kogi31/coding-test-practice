SELECT
    T.HACKER_ID,
    H.NAME,
    T.TOTAL_SCORE
  FROM
    (
        SELECT  M.HACKER_ID,
                SUM(M.MAX_SCORE) AS TOTAL_SCORE
          FROM
            (
                SELECT  HACKER_ID,
                        CHALLENGE_ID,
                        MAX(SCORE) AS MAX_SCORE
                  FROM  SUBMISSIONS
                 GROUP
                    BY  HACKER_ID, CHALLENGE_ID
            ) AS M
         GROUP
            BY  M.HACKER_ID
    ) AS T
  JOIN  HACKERS AS H
    ON  T.HACKER_ID = H.HACKER_ID
 WHERE  T.TOTAL_SCORE > 0
 ORDER
    BY  T.TOTAL_SCORE DESC, T.HACKER_ID ASC;