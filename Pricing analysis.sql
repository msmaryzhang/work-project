-- check if data is coherent with excel file
SELECT TOP (100) [Datasheet]
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
  FROM [xx].[dbo].['xx'];

  -- initial pricing information by Series
  select Series, round(avg(Price),2) as AvgPrice, max(Price)-min(Price) as Range
  from [dbo].['ac_dc_e io-b - altoghther$']
  where [Product Status] <> 'Obsolete'
  group by Series

  -- cte, Series with the biggest range
  with TopRange as 
  (select Series, round(avg(Price),2) as AvgPrice, max(Price)-min(Price) as Range
  from [dbo].['xx']
  where [Product Status] <> 'Obsolete'
  group by Series)

  select *, rank() over (order by Range desc) as Rnk
  from TopRange;

  -- check if duplicates exist
  select [DK Part #], count([DK Part #])
  from [dbo].['xx']
  group by [DK Part #]
  having count([DK Part #]) > 1








