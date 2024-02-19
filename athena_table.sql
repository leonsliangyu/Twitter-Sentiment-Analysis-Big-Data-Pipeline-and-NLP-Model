--  creates the twitter_sentiment table in the data warehouse

CREATE EXTERNAL TABLE IF NOT EXISTS `twitter_sentiment`.`twitter_sentiment` (
  `id` string,
  `name` string,
  `username` string,
  `tweet` string,
  `followers_count` int,
  `location` string,
  `geo` string,
  `created_at` string,
  `prediction` double
)

-- define the storage format to be Parquet
ROW FORMAT SERDE 'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT 'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'


-- S3 bucket location
LOCATION 's3://b19-liangyu-awscli/BigDataProject/prediction/'


-- sets format of table's data as Parque
TBLPROPERTIES ('classification' = 'parquet');