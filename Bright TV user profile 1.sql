-- Databricks notebook source

-- Checking all the columns in the table
SELECT *    
FROM brighttv.tvdata.bright_tv_dataset_2;

-- Grouping by age
SELECT age, 
 CASE 
 WHEN age= 0 THEN 'Infant'
 WHEN age BETWEEN 1 AND 12 THEN 'kids'
 WHEN age BETWEEN 13 AND 17 THEN 'teenager'
 WHEN age BETWEEN 18 AND 35 THEN 'young adult'
 WHEN age BETWEEN 36 AND 50 THEN 'adult'
 WHEN age  >50 AND age <= 60 THEN 'Elder'
 WHEN age > 60 THEN 'Pensioner'
 END AS age_group
FROM brighttv.tvdata.bright_tv_dataset_2;

-- Check different Provinces
SELECT DISTINCT province,
CASE 
WHEN province = 'None' THEN 'Unknown'
WHEN province = '' THEN 'Unknown'
WHEN province IS NULL THEN 'Unknown'
ELSE province
END AS region
FROM brighttv.tvdata.bright_tv_dataset_2;

-- Check Different Genders
SELECT DISTINCT gender,
 CASE 
 WHEN gender = 'None' THEN 'Unknown'
 WHEN gender = '' THEN 'Unknown'
 WHEN gender IS NULL THEN 'Unknown'
 ELSE gender
 END AS gender
 FROM brighttv.tvdata.bright_tv_dataset_2;

-- Check Different Races
SELECT DISTINCT race,
 CASE 
 WHEN race = 'None' THEN 'Unknown'
 WHEN race = '' THEN 'Unknown'
 WHEN race IS NULL THEN 'Unknown'
 ELSE race
 END AS race
 FROM brighttv.tvdata.bright_tv_dataset_2;

-- Check Different Emails
SELECT DISTINCT email,
 CASE 
 WHEN email = 'None' THEN 'Unknown'
 WHEN email = '' THEN 'Unknown'
 WHEN email IS NULL THEN 'Unknown'
 ELSE email
 END AS email
 FROM brighttv.tvdata.bright_tv_dataset_2;

-- Create cleaned view
CREATE OR REPLACE TEMP VIEW tv_dataset_2 AS
SELECT userid,
  CASE 
  WHEN province = 'None' THEN 'Uncategorized'
  WHEN province = '' THEN 'Uncategorized'
  WHEN province = 'other' THEN 'Uncategorized'
  WHEN province IS NULL THEN 'Unknown'
  ELSE province
  END AS province,
  CASE 
  WHEN age = 0 THEN 'Infant'
  WHEN age BETWEEN 1 AND 12 THEN 'kids'
  WHEN age BETWEEN 13 AND 19 THEN 'teenager'
  WHEN age BETWEEN 20 AND 35 THEN 'youth'
  WHEN age BETWEEN 36 AND 50 THEN 'adult'
  WHEN age BETWEEN 51 AND 65 THEN 'elder'
  WHEN age > 65 THEN 'pensioner'
  ELSE CAST(age AS STRING)
  END AS age_group,
  CASE 
  WHEN gender = 'None' THEN 'Unknown'
  WHEN gender = '' THEN 'Unknown'
  WHEN gender IS NULL THEN 'Unknown'
  ELSE gender
  END AS gender,
  CASE 
  WHEN race = 'Other' THEN 'None'
  WHEN race = '' THEN 'None'
  ELSE race
  END AS race,
  CASE 
  WHEN email IS NOT NULL AND email != '' AND email != 'None' THEN 1
  ELSE 0
  END AS email_flag,
  CASE
  WHEN `Social Media Handle` IS NOT NULL AND `Social Media Handle` != '' AND `Social Media Handle` != 'None' THEN 1
  ELSE 0
  END AS sm_flag
FROM brighttv.tvdata.bright_tv_dataset_2;











