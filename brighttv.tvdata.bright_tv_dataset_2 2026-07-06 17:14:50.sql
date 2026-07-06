-- Databricks notebook source


SELECT * 
FROM `brighttv`.`tvdata`.`bright_tv_dataset_2`
LIMIT 100;
-----------------------------------------------------------------
SELECT age, 
 CASE 
 WHEN age= 0 THEN 'Infant'
 WHEN age BETWEEN 1 AND 12 THEN 'kids'
 WHEN age BETWEEN 13 AND 17 THEN 'teenager'
 WHEN age BETWEEN 18 AND 35 THEN 'young adult'
 WHEN age BETWEEN 36 AND 50 THEN 'adult'
 WHEN age  >50 AND age <= 60 THen 'Elder'
 WHEN age > 60 THEN 'Pensioner'
 END AS age_group
FROM `brighttv`.`tvdata`.`bright_tv_dataset_2`;
--------------------------------------------------------------------------

SELECT DISTINCT province,
CASE 
WHEN province = 'None' THEN 'Unknown'
WHEN province = '' THEN 'Unknown'
WHEN province IS NULL THEN 'Unknown'
ELSE province
END AS region
FROM `brighttv`.`tvdata`.`bright_tv_dataset_2`;


