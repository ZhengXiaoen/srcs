-- Read-only preflight; run on an isolated recovered copy before first install.
-- Unknown high bits or negative initsmith require separate reviewed migration.
SELECT TABLE_NAME,COLUMN_TYPE,DATA_TYPE,IS_NULLABLE FROM information_schema.COLUMNS WHERE TABLE_SCHEMA='cq_actor' AND COLUMN_NAME='initsmith' ORDER BY TABLE_NAME;

SELECT 'actorbagitem' AS table_name,COUNT(*) AS total,MIN(initsmith) AS lo,MAX(initsmith) AS hi,SUM(COALESCE(initsmith,0)<>(COALESCE(initsmith,0)&255)) AS unexpected_high_or_negative FROM `cq_actor`.`actorbagitem`;

SELECT 'actorequipitem' AS table_name,COUNT(*) AS total,MIN(initsmith) AS lo,MAX(initsmith) AS hi,SUM(COALESCE(initsmith,0)<>(COALESCE(initsmith,0)&255)) AS unexpected_high_or_negative FROM `cq_actor`.`actorequipitem`;

SELECT 'actordepotitem' AS table_name,COUNT(*) AS total,MIN(initsmith) AS lo,MAX(initsmith) AS hi,SUM(COALESCE(initsmith,0)<>(COALESCE(initsmith,0)&255)) AS unexpected_high_or_negative FROM `cq_actor`.`actordepotitem`;

SELECT 'actorconsignment' AS table_name,COUNT(*) AS total,MIN(initsmith) AS lo,MAX(initsmith) AS hi,SUM(COALESCE(initsmith,0)<>(COALESCE(initsmith,0)&255)) AS unexpected_high_or_negative FROM `cq_actor`.`actorconsignment`;

SELECT 'useritem' AS table_name,COUNT(*) AS total,MIN(initsmith) AS lo,MAX(initsmith) AS hi,SUM(COALESCE(initsmith,0)<>(COALESCE(initsmith,0)&255)) AS unexpected_high_or_negative FROM `cq_actor`.`useritem`;

SELECT 'actorpetitem' AS table_name,COUNT(*) AS total,MIN(initsmith) AS lo,MAX(initsmith) AS hi,SUM(COALESCE(initsmith,0)<>(COALESCE(initsmith,0)&255)) AS unexpected_high_or_negative FROM `cq_actor`.`actorpetitem`;

SELECT 'actordmkjitem' AS table_name,COUNT(*) AS total,MIN(initsmith) AS lo,MAX(initsmith) AS hi,SUM(COALESCE(initsmith,0)<>(COALESCE(initsmith,0)&255)) AS unexpected_high_or_negative FROM `cq_actor`.`actordmkjitem`;

SELECT 'actormagicitem' AS table_name,COUNT(*) AS total,MIN(initsmith) AS lo,MAX(initsmith) AS hi,SUM(COALESCE(initsmith,0)<>(COALESCE(initsmith,0)&255)) AS unexpected_high_or_negative FROM `cq_actor`.`actormagicitem`;

SELECT 'guildstore' AS table_name,COUNT(*) AS total,MIN(initsmith) AS lo,MAX(initsmith) AS hi,SUM(COALESCE(initsmith,0)<>(COALESCE(initsmith,0)&255)) AS unexpected_high_or_negative FROM `cq_actor`.`guildstore`;

SHOW CREATE PROCEDURE `cq_actor`.`loadcharitems`;

SHOW CREATE PROCEDURE `cq_actor`.`loadguildstoredata`;

SHOW CREATE PROCEDURE `cq_actor`.`loadconsignmentext`;
