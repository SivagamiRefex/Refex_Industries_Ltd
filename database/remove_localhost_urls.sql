-- SQL Script to remove http://localhost:8080/ from all URL fields
-- Run this script directly on your database to update existing records

USE `industries`;

-- Update about_hero table
UPDATE `about_hero` 
SET `background_image` = REPLACE(`background_image`, 'http://localhost:8080/', '/'),
    `logo_cards` = REPLACE(`logo_cards`, 'http://localhost:8080/', '/')
WHERE `background_image` LIKE '%http://localhost:8080/%' 
   OR `logo_cards` LIKE '%http://localhost:8080/%';

-- Update about_journey table
UPDATE `about_journey` 
SET `image` = REPLACE(`image`, 'http://localhost:8080/', '/'),
    `images` = REPLACE(`images`, 'http://localhost:8080/', '/')
WHERE `image` LIKE '%http://localhost:8080/%' 
   OR `images` LIKE '%http://localhost:8080/%';

-- Update about_presence table
UPDATE `about_presence` 
SET `map_image` = REPLACE(`map_image`, 'http://localhost:8080/', '/'),
    `presence_text_image` = REPLACE(`presence_text_image`, 'http://localhost:8080/', '/')
WHERE `map_image` LIKE '%http://localhost:8080/%' 
   OR `presence_text_image` LIKE '%http://localhost:8080/%';

-- Update about_vision_mission table
UPDATE `about_vision_mission` 
SET `vision_image` = REPLACE(`vision_image`, 'http://localhost:8080/', '/'),
    `mission_image` = REPLACE(`mission_image`, 'http://localhost:8080/', '/')
WHERE `vision_image` LIKE '%http://localhost:8080/%' 
   OR `mission_image` LIKE '%http://localhost:8080/%';

-- Update ash_utilization_clients table
UPDATE `ash_utilization_clients` 
SET `image` = REPLACE(`image`, 'http://localhost:8080/', '/')
WHERE `image` LIKE '%http://localhost:8080/%';

-- Update ash_utilization_features table
UPDATE `ash_utilization_features` 
SET `image` = REPLACE(`image`, 'http://localhost:8080/', '/')
WHERE `image` LIKE '%http://localhost:8080/%';

-- Update ash_utilization_hero table
UPDATE `ash_utilization_hero` 
SET `slides` = REPLACE(`slides`, 'http://localhost:8080/', '/')
WHERE `slides` LIKE '%http://localhost:8080/%';

-- Update ash_utilization_impacts table
UPDATE `ash_utilization_impacts` 
SET `icon` = REPLACE(`icon`, 'http://localhost:8080/', '/')
WHERE `icon` LIKE '%http://localhost:8080/%';

-- Update ash_utilization_services table
UPDATE `ash_utilization_services` 
SET `image` = REPLACE(`image`, 'http://localhost:8080/', '/')
WHERE `image` LIKE '%http://localhost:8080/%';

-- Update ash_utilization_who_we_are table
UPDATE `ash_utilization_who_we_are` 
SET `slides` = REPLACE(`slides`, 'http://localhost:8080/', '/')
WHERE `slides` LIKE '%http://localhost:8080/%';

-- Update awards table
UPDATE `awards` 
SET `image` = REPLACE(`image`, 'http://localhost:8080/', '/')
WHERE `image` LIKE '%http://localhost:8080/%';

-- Update contact_hero table
UPDATE `contact_hero` 
SET `background_image` = REPLACE(`background_image`, 'http://localhost:8080/', '/')
WHERE `background_image` LIKE '%http://localhost:8080/%';

-- Update flip_cards table
UPDATE `flip_cards` 
SET `image` = REPLACE(`image`, 'http://localhost:8080/', '/'),
    `back_image` = REPLACE(`back_image`, 'http://localhost:8080/', '/')
WHERE `image` LIKE '%http://localhost:8080/%' 
   OR `back_image` LIKE '%http://localhost:8080/%';

-- Update green_mobility_brand_values table
UPDATE `green_mobility_brand_values` 
SET `icon` = REPLACE(`icon`, 'http://localhost:8080/', '/')
WHERE `icon` LIKE '%http://localhost:8080/%';

-- Update all other tables with image/url fields
-- Add more UPDATE statements for other tables as needed

-- Generic update for any text fields containing the URL (catch-all)
-- This will update any remaining fields that might have been missed
UPDATE `about_hero` SET `background_image` = REPLACE(`background_image`, 'http://localhost:8080/', '/') WHERE `background_image` LIKE '%http://localhost:8080/%';
UPDATE `about_journey` SET `image` = REPLACE(`image`, 'http://localhost:8080/', '/') WHERE `image` LIKE '%http://localhost:8080/%';
UPDATE `about_presence` SET `map_image` = REPLACE(`map_image`, 'http://localhost:8080/', '/'), `presence_text_image` = REPLACE(`presence_text_image`, 'http://localhost:8080/', '/') WHERE `map_image` LIKE '%http://localhost:8080/%' OR `presence_text_image` LIKE '%http://localhost:8080/%';
UPDATE `about_vision_mission` SET `vision_image` = REPLACE(`vision_image`, 'http://localhost:8080/', '/'), `mission_image` = REPLACE(`mission_image`, 'http://localhost:8080/', '/') WHERE `vision_image` LIKE '%http://localhost:8080/%' OR `mission_image` LIKE '%http://localhost:8080/%';
UPDATE `ash_utilization_clients` SET `image` = REPLACE(`image`, 'http://localhost:8080/', '/') WHERE `image` LIKE '%http://localhost:8080/%';
UPDATE `ash_utilization_features` SET `image` = REPLACE(`image`, 'http://localhost:8080/', '/') WHERE `image` LIKE '%http://localhost:8080/%';
UPDATE `ash_utilization_hero` SET `slides` = REPLACE(`slides`, 'http://localhost:8080/', '/') WHERE `slides` LIKE '%http://localhost:8080/%';
UPDATE `ash_utilization_impacts` SET `icon` = REPLACE(`icon`, 'http://localhost:8080/', '/') WHERE `icon` LIKE '%http://localhost:8080/%';
UPDATE `ash_utilization_services` SET `image` = REPLACE(`image`, 'http://localhost:8080/', '/') WHERE `image` LIKE '%http://localhost:8080/%';
UPDATE `ash_utilization_who_we_are` SET `slides` = REPLACE(`slides`, 'http://localhost:8080/', '/') WHERE `slides` LIKE '%http://localhost:8080/%';
UPDATE `awards` SET `image` = REPLACE(`image`, 'http://localhost:8080/', '/') WHERE `image` LIKE '%http://localhost:8080/%';
UPDATE `contact_hero` SET `background_image` = REPLACE(`background_image`, 'http://localhost:8080/', '/') WHERE `background_image` LIKE '%http://localhost:8080/%';
UPDATE `flip_cards` SET `image` = REPLACE(`image`, 'http://localhost:8080/', '/'), `back_image` = REPLACE(`back_image`, 'http://localhost:8080/', '/') WHERE `image` LIKE '%http://localhost:8080/%' OR `back_image` LIKE '%http://localhost:8080/%';
UPDATE `green_mobility_brand_values` SET `icon` = REPLACE(`icon`, 'http://localhost:8080/', '/') WHERE `icon` LIKE '%http://localhost:8080/%';

-- Check for any remaining instances
SELECT 'Remaining URLs with localhost:8080' AS status;
SELECT TABLE_NAME, COLUMN_NAME 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_SCHEMA = 'industries' 
  AND (COLUMN_NAME LIKE '%image%' OR COLUMN_NAME LIKE '%url%' OR COLUMN_NAME LIKE '%logo%' OR COLUMN_NAME LIKE '%pdf%' OR COLUMN_NAME LIKE '%audio%' OR COLUMN_NAME LIKE '%background%' OR COLUMN_NAME LIKE '%icon%' OR COLUMN_NAME LIKE '%slides%' OR COLUMN_NAME LIKE '%link%')
ORDER BY TABLE_NAME, COLUMN_NAME;

