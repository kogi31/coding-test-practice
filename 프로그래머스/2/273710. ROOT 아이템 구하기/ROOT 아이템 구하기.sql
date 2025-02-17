-- 코드를 작성해주세요

SELECT
    C.ITEM_ID,
    C.ITEM_NAME
FROM
    ITEM_INFO C
INNER JOIN
    ITEM_TREE P ON C.ITEM_ID = P.ITEM_ID
WHERE
    P.PARENT_ITEM_ID IS NULL
ORDER BY
    C.ITEM_ID ASC;