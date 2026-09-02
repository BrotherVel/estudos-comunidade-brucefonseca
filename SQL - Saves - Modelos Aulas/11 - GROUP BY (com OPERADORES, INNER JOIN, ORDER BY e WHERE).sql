USE ContosoRetailDW

SELECT
	S.channelKey
	,C.ChannelName
	,S.PromotionKey
	,P.PromotionName
	,P.PromotionDescription
	,SUM(S.SalesAmount)
	,AVG(S.SalesAmount)
	,MIN(S.SalesAmount)
	,MAX(S.SalesAmount)
FROM FactSales S
INNER JOIN DimChannel C ON C.ChannelKey = S.channelKey
INNER JOIN DimPromotion P ON P.PromotionKey = S.PromotionKey
WHERE
	S.channelKey IN (1,2) AND
	S.PromotionKey BETWEEN 1 AND 5
GROUP BY S.channelKey, C.ChannelName, S.PromotionKey, P.PromotionName, P.PromotionDescription
ORDER BY S.channelKey, C.ChannelName, S.PromotionKey, P.PromotionName