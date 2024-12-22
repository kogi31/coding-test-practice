-- 코드를 작성해주세요
-- item_A -> item_b = parent item
-- not parent item root item
-- 희귀도가 RARE인 아이템들의 모든 다음 업그레이드 아이템
-- 자식에 해당하는 ITEM_ID, 의 ITEM_ID, ITEM_NAME, RARITY
-- ITEM_ID DESC
SELECT  II.ITEM_ID
        ,II.ITEM_NAME
        ,II.RARITY
  FROM  ITEM_INFO AS II
  JOIN  ITEM_TREE AS IT
    ON  II.ITEM_ID = IT.ITEM_ID
 WHERE  IT.PARENT_ITEM_ID IN (SELECT  ITEM_ID
                                FROM  ITEM_INFO
                               WHERE  RARITY = 'RARE')
 ORDER
    BY  ITEM_ID DESC;