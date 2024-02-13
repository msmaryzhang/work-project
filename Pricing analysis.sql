-- check if data is coherent with excel file
SELECT TOP (1000) [Datasheet]
      ,[Image]
      ,[DK Part #]
      ,[Mfr Part #]
      ,[Mfr]
      ,[Supplier]
      ,[Description]
      ,[Stock]
      ,[Price]
      ,[@ qty]
      ,[Min Qty]
      ,[ Package]
      ,[Series]
      ,[Product Status]
      ,[Type]
      ,[Number of Outputs]
      ,[Voltage - Input]
      ,[Voltage - Output 1]
      ,[Voltage - Output 2]
      ,[Voltage - Output 3]
      ,[Voltage - Output 4]
      ,[Voltage - Output 6]
      ,[Current - Output 1]
      ,[Power (Watts)]
      ,[Applications]
      ,[Voltage - Isolation]
      ,[Efficiency]
      ,[Operating Temperature]
      ,[Features]
      ,[Mounting Type]
      ,[Size / Dimension]
      ,[Approval Agency]
      ,[Current - Output 2]
      ,[Voltage - Output 5]
      ,[Standard Number]
      ,[Current - Output 3]
      ,[Current - Output 4]
      ,[F38]
      ,[F39]
  FROM [StrategicMarketingAEI].[dbo].['ac_dc_e io-b - altoghther$'];

/*
  -- get initial ac-dc external/ internal off-board data summary to get attention from product team
  select Series, round(avg(Price),2) as AvgPrice, max(Price)-min(Price) as Range
  from [dbo].['ac_dc_e io-b - altoghther$']
  where [Product Status] <> 'Obsolete'
  group by Series

  */


  -- cte which series has the biggest range
  with TopRange as 
  (select Series, round(avg(Price),2) as AvgPrice, max(Price)-min(Price) as Range
  from [dbo].['ac_dc_e io-b - altoghther$']
  where [Product Status] <> 'Obsolete'
  group by Series)

  select *, rank() over (order by Range desc) as Rnk
  from TopRange;


  -- find duplicated items because of a human error when collecting the data, DK Part # is most likely the primary key, which is confirmed with the following
  select [DK Part #], count([DK Part #])
  from [dbo].['ac_dc_e io-b - altoghther$']
  group by [DK Part #]
  having count([DK Part #]) > 1

  -- remove duplicate rows
  select distinct [DK Part #]
	,[Datasheet]
      ,[Image]
      ,[Mfr Part #]
      ,[Mfr]
      ,[Supplier]
      ,[Description]
      ,[Stock]
      ,[Price]
      ,[@ qty]
      ,[Min Qty]
      ,[ Package]
      ,[Series]
      ,[Product Status]
      ,[Type]
      ,[Number of Outputs]
      ,[Voltage - Input]
      ,[Voltage - Output 1]
      ,[Voltage - Output 2]
      ,[Voltage - Output 3]
      ,[Voltage - Output 4]
      ,[Voltage - Output 6]
      ,[Current - Output 1]
      ,[Power (Watts)]
      ,[Applications]
      ,[Voltage - Isolation]
      ,[Efficiency]
      ,[Operating Temperature]
      ,[Features]
      ,[Mounting Type]
      ,[Size / Dimension]
      ,[Approval Agency]
      ,[Current - Output 2]
      ,[Voltage - Output 5]
      ,[Standard Number]
      ,[Current - Output 3]
      ,[Current - Output 4]
      ,[F38]
      ,[F39]
into [StrategicMarketingAEI].[dbo].[ac_dc_e io-b]
FROM [StrategicMarketingAEI].[dbo].['ac_dc_e io-b - altoghther$']




  -- AE series on Digikey, aggregate function to calculate gap between prices






