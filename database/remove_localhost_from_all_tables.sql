-- Comprehensive SQL Script to remove http://localhost:8080/ from ALL tables and ALL URL fields
-- This script will search through all tables and update any column that contains URLs
-- Run this script directly on your database

USE `industries`;

-- ============================================
-- Method 1: Update specific known URL columns
-- ============================================

-- About Section
UPDATE `about_hero` SET `background_image` = REPLACE(`background_image`, 'http://localhost:8080/', '/'), `logo_cards` = REPLACE(`logo_cards`, 'http://localhost:8080/', '/') WHERE `background_image` LIKE '%http://localhost:8080/%' OR `logo_cards` LIKE '%http://localhost:8080/%';
UPDATE `about_journey` SET `image` = REPLACE(`image`, 'http://localhost:8080/', '/'), `images` = REPLACE(`images`, 'http://localhost:8080/', '/') WHERE `image` LIKE '%http://localhost:8080/%' OR `images` LIKE '%http://localhost:8080/%';
UPDATE `about_presence` SET `map_image` = REPLACE(`map_image`, 'http://localhost:8080/', '/'), `presence_text_image` = REPLACE(`presence_text_image`, 'http://localhost:8080/', '/') WHERE `map_image` LIKE '%http://localhost:8080/%' OR `presence_text_image` LIKE '%http://localhost:8080/%';
UPDATE `about_vision_mission` SET `vision_image` = REPLACE(`vision_image`, 'http://localhost:8080/', '/'), `mission_image` = REPLACE(`mission_image`, 'http://localhost:8080/', '/') WHERE `vision_image` LIKE '%http://localhost:8080/%' OR `mission_image` LIKE '%http://localhost:8080/%';

-- Ash Utilization
UPDATE `ash_utilization_clients` SET `image` = REPLACE(`image`, 'http://localhost:8080/', '/') WHERE `image` LIKE '%http://localhost:8080/%';
UPDATE `ash_utilization_features` SET `image` = REPLACE(`image`, 'http://localhost:8080/', '/') WHERE `image` LIKE '%http://localhost:8080/%';
UPDATE `ash_utilization_hero` SET `slides` = REPLACE(`slides`, 'http://localhost:8080/', '/') WHERE `slides` LIKE '%http://localhost:8080/%';
UPDATE `ash_utilization_impacts` SET `icon` = REPLACE(`icon`, 'http://localhost:8080/', '/') WHERE `icon` LIKE '%http://localhost:8080/%';
UPDATE `ash_utilization_services` SET `image` = REPLACE(`image`, 'http://localhost:8080/', '/') WHERE `image` LIKE '%http://localhost:8080/%';
UPDATE `ash_utilization_who_we_are` SET `slides` = REPLACE(`slides`, 'http://localhost:8080/', '/') WHERE `slides` LIKE '%http://localhost:8080/%';

-- Awards
UPDATE `awards` SET `image` = REPLACE(`image`, 'http://localhost:8080/', '/') WHERE `image` LIKE '%http://localhost:8080/%';

-- Capabilities
UPDATE `capabilities_facility` SET `image` = REPLACE(`image`, 'http://localhost:8080/', '/') WHERE `image` LIKE '%http://localhost:8080/%';
UPDATE `capabilities_hero` SET `background_image` = REPLACE(`background_image`, 'http://localhost:8080/', '/') WHERE `background_image` LIKE '%http://localhost:8080/%';
UPDATE `capabilities_research` SET `image` = REPLACE(`image`, 'http://localhost:8080/', '/') WHERE `image` LIKE '%http://localhost:8080/%';

-- Contact
UPDATE `contact_hero` SET `background_image` = REPLACE(`background_image`, 'http://localhost:8080/', '/') WHERE `background_image` LIKE '%http://localhost:8080/%';
UPDATE `contact_form` SET `map_embed_url` = REPLACE(`map_embed_url`, 'http://localhost:8080/', '/'), `form_endpoint_url` = REPLACE(`form_endpoint_url`, 'http://localhost:8080/', '/') WHERE `map_embed_url` LIKE '%http://localhost:8080/%' OR `form_endpoint_url` LIKE '%http://localhost:8080/%';

-- ESG Section
UPDATE `esg_award` SET `image` = REPLACE(`image`, 'http://localhost:8080/', '/') WHERE `image` LIKE '%http://localhost:8080/%';
UPDATE `esg_collaboration_section` SET `logo` = REPLACE(`logo`, 'http://localhost:8080/', '/') WHERE `logo` LIKE '%http://localhost:8080/%';
UPDATE `esg_developmental_org` SET `logo` = REPLACE(`logo`, 'http://localhost:8080/', '/') WHERE `logo` LIKE '%http://localhost:8080/%';
UPDATE `esg_governance_item` SET `link` = REPLACE(`link`, 'http://localhost:8080/', '/') WHERE `link` LIKE '%http://localhost:8080/%';
UPDATE `esg_hero` SET `background_image` = REPLACE(`background_image`, 'http://localhost:8080/', '/') WHERE `background_image` LIKE '%http://localhost:8080/%';
UPDATE `esg_policy` SET `link` = REPLACE(`link`, 'http://localhost:8080/', '/') WHERE `link` LIKE '%http://localhost:8080/%';
UPDATE `esg_program` SET `image` = REPLACE(`image`, 'http://localhost:8080/', '/') WHERE `image` LIKE '%http://localhost:8080/%';
UPDATE `esg_refex_on_esg` SET `image` = REPLACE(`image`, 'http://localhost:8080/', '/') WHERE `image` LIKE '%http://localhost:8080/%';
UPDATE `esg_report` SET `image` = REPLACE(`image`, 'http://localhost:8080/', '/'), `link` = REPLACE(`link`, 'http://localhost:8080/', '/') WHERE `image` LIKE '%http://localhost:8080/%' OR `link` LIKE '%http://localhost:8080/%';
UPDATE `esg_sustainable_business` SET `image` = REPLACE(`image`, 'http://localhost:8080/', '/') WHERE `image` LIKE '%http://localhost:8080/%';
UPDATE `esg_unsdg_action` SET `icon` = REPLACE(`icon`, 'http://localhost:8080/', '/') WHERE `icon` LIKE '%http://localhost:8080/%';

-- Flip Cards
UPDATE `flip_cards` SET `image` = REPLACE(`image`, 'http://localhost:8080/', '/'), `back_image` = REPLACE(`back_image`, 'http://localhost:8080/', '/'), `link` = REPLACE(`link`, 'http://localhost:8080/', '/') WHERE `image` LIKE '%http://localhost:8080/%' OR `back_image` LIKE '%http://localhost:8080/%' OR `link` LIKE '%http://localhost:8080/%';

-- Green Mobility
UPDATE `green_mobility_brand_values` SET `icon` = REPLACE(`icon`, 'http://localhost:8080/', '/') WHERE `icon` LIKE '%http://localhost:8080/%';
UPDATE `green_mobility_clients` SET `image` = REPLACE(`image`, 'http://localhost:8080/', '/') WHERE `image` LIKE '%http://localhost:8080/%';
UPDATE `green_mobility_hero` SET `background_image` = REPLACE(`background_image`, 'http://localhost:8080/', '/'), `slides` = REPLACE(`slides`, 'http://localhost:8080/', '/') WHERE `background_image` LIKE '%http://localhost:8080/%' OR `slides` LIKE '%http://localhost:8080/%';
UPDATE `green_mobility_impacts` SET `icon` = REPLACE(`icon`, 'http://localhost:8080/', '/') WHERE `icon` LIKE '%http://localhost:8080/%';
UPDATE `green_mobility_our_services` SET `image` = REPLACE(`image`, 'http://localhost:8080/', '/') WHERE `image` LIKE '%http://localhost:8080/%';
UPDATE `green_mobility_services` SET `image` = REPLACE(`image`, 'http://localhost:8080/', '/') WHERE `image` LIKE '%http://localhost:8080/%';
UPDATE `green_mobility_sustainability` SET `image` = REPLACE(`image`, 'http://localhost:8080/', '/') WHERE `image` LIKE '%http://localhost:8080/%';
UPDATE `green_mobility_testimonials` SET `image` = REPLACE(`image`, 'http://localhost:8080/', '/') WHERE `image` LIKE '%http://localhost:8080/%';
UPDATE `green_mobility_who_we_are` SET `image` = REPLACE(`image`, 'http://localhost:8080/', '/') WHERE `image` LIKE '%http://localhost:8080/%';
UPDATE `green_mobility_why_choose_us` SET `icon` = REPLACE(`icon`, 'http://localhost:8080/', '/') WHERE `icon` LIKE '%http://localhost:8080/%';

-- Hero Slides
UPDATE `hero_slides` SET `image` = REPLACE(`image`, 'http://localhost:8080/', '/'), `link` = REPLACE(`link`, 'http://localhost:8080/', '/') WHERE `image` LIKE '%http://localhost:8080/%' OR `link` LIKE '%http://localhost:8080/%';

-- Investors
UPDATE `investors_hero` SET `background_image` = REPLACE(`background_image`, 'http://localhost:8080/', '/') WHERE `background_image` LIKE '%http://localhost:8080/%';
UPDATE `investors_page_content` SET `content` = REPLACE(`content`, 'http://localhost:8080/', '/'), `filter_items` = REPLACE(`filter_items`, 'http://localhost:8080/', '/'), `sections` = REPLACE(`sections`, 'http://localhost:8080/', '/') WHERE `content` LIKE '%http://localhost:8080/%' OR `filter_items` LIKE '%http://localhost:8080/%' OR `sections` LIKE '%http://localhost:8080/%';
UPDATE `investors_related_links` SET `link` = REPLACE(`link`, 'http://localhost:8080/', '/') WHERE `link` LIKE '%http://localhost:8080/%';

-- Journey
UPDATE `journey_items` SET `image` = REPLACE(`image`, 'http://localhost:8080/', '/') WHERE `image` LIKE '%http://localhost:8080/%';

-- Leadership
UPDATE `leadership_members` SET `image` = REPLACE(`image`, 'http://localhost:8080/', '/') WHERE `image` LIKE '%http://localhost:8080/%';

-- Newsroom
UPDATE `news_items` SET `image` = REPLACE(`image`, 'http://localhost:8080/', '/'), `link` = REPLACE(`link`, 'http://localhost:8080/', '/') WHERE `image` LIKE '%http://localhost:8080/%' OR `link` LIKE '%http://localhost:8080/%';
UPDATE `newsroom_event` SET `image` = REPLACE(`image`, 'http://localhost:8080/', '/'), `link` = REPLACE(`link`, 'http://localhost:8080/', '/') WHERE `image` LIKE '%http://localhost:8080/%' OR `link` LIKE '%http://localhost:8080/%';
UPDATE `newsroom_hero` SET `background_image` = REPLACE(`background_image`, 'http://localhost:8080/', '/') WHERE `background_image` LIKE '%http://localhost:8080/%';
UPDATE `press_release` SET `image` = REPLACE(`image`, 'http://localhost:8080/', '/'), `link` = REPLACE(`link`, 'http://localhost:8080/', '/') WHERE `image` LIKE '%http://localhost:8080/%' OR `link` LIKE '%http://localhost:8080/%';

-- Product
UPDATE `product_hero` SET `background_image` = REPLACE(`background_image`, 'http://localhost:8080/', '/') WHERE `background_image` LIKE '%http://localhost:8080/%';

-- Refrigerant Gas
UPDATE `refrigerant_gas_client` SET `image` = REPLACE(`image`, 'http://localhost:8080/', '/') WHERE `image` LIKE '%http://localhost:8080/%';
UPDATE `refrigerant_gas_hero` SET `background_image` = REPLACE(`background_image`, 'http://localhost:8080/', '/'), `slides` = REPLACE(`slides`, 'http://localhost:8080/', '/') WHERE `background_image` LIKE '%http://localhost:8080/%' OR `slides` LIKE '%http://localhost:8080/%';
UPDATE `refrigerant_gas_impact` SET `icon` = REPLACE(`icon`, 'http://localhost:8080/', '/') WHERE `icon` LIKE '%http://localhost:8080/%';
UPDATE `refrigerant_gas_product` SET `image` = REPLACE(`image`, 'http://localhost:8080/', '/') WHERE `image` LIKE '%http://localhost:8080/%';
UPDATE `refrigerant_gas_who_we_are` SET `image` = REPLACE(`image`, 'http://localhost:8080/', '/') WHERE `image` LIKE '%http://localhost:8080/%';
UPDATE `refrigerant_gas_why_choose_us` SET `icon` = REPLACE(`icon`, 'http://localhost:8080/', '/') WHERE `icon` LIKE '%http://localhost:8080/%';

-- Research
UPDATE `research_innovations` SET `image` = REPLACE(`image`, 'http://localhost:8080/', '/') WHERE `image` LIKE '%http://localhost:8080/%';

-- Sustainability
UPDATE `sustainability_hero` SET `background_image` = REPLACE(`background_image`, 'http://localhost:8080/', '/') WHERE `background_image` LIKE '%http://localhost:8080/%';
UPDATE `sustainability_policy` SET `link` = REPLACE(`link`, 'http://localhost:8080/', '/') WHERE `link` LIKE '%http://localhost:8080/%';
UPDATE `sustainability_sdg_card` SET `image` = REPLACE(`image`, 'http://localhost:8080/', '/') WHERE `image` LIKE '%http://localhost:8080/%';
UPDATE `sustainability_vision_mission` SET `image` = REPLACE(`image`, 'http://localhost:8080/', '/') WHERE `image` LIKE '%http://localhost:8080/%';

-- Venwind Refex
UPDATE `venwind_refex_hero` SET `background_image` = REPLACE(`background_image`, 'http://localhost:8080/', '/') WHERE `background_image` LIKE '%http://localhost:8080/%';
UPDATE `venwind_refex_technical_spec` SET `icon` = REPLACE(`icon`, 'http://localhost:8080/', '/') WHERE `icon` LIKE '%http://localhost:8080/%';
UPDATE `venwind_refex_visit_website` SET `background_image` = REPLACE(`background_image`, 'http://localhost:8080/', '/'), `button_link` = REPLACE(`button_link`, 'http://localhost:8080/', '/') WHERE `background_image` LIKE '%http://localhost:8080/%' OR `button_link` LIKE '%http://localhost:8080/%';
UPDATE `venwind_refex_who_we_are` SET `main_image` = REPLACE(`main_image`, 'http://localhost:8080/', '/'), `small_image` = REPLACE(`small_image`, 'http://localhost:8080/', '/') WHERE `main_image` LIKE '%http://localhost:8080/%' OR `small_image` LIKE '%http://localhost:8080/%';
UPDATE `venwind_refex_why_choose_us` SET `icon` = REPLACE(`icon`, 'http://localhost:8080/', '/') WHERE `icon` LIKE '%http://localhost:8080/%';

-- ============================================
-- Method 2: Dynamic update for ALL text/json columns that might contain URLs
-- This will catch any columns we might have missed
-- ============================================

-- Update all TEXT columns that might contain URLs
SET @sql = NULL;
SELECT GROUP_CONCAT(
    CONCAT(
        'UPDATE `', TABLE_NAME, '` SET `', COLUMN_NAME, '` = REPLACE(`', COLUMN_NAME, '`, ''http://localhost:8080/'', ''/'') WHERE `', COLUMN_NAME, '` LIKE ''%http://localhost:8080/%'';'
    ) SEPARATOR '\n'
)
INTO @sql
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'industries'
  AND TABLE_NAME NOT IN ('users', 'login_histories') -- Exclude sensitive tables
  AND (
    DATA_TYPE IN ('text', 'varchar', 'longtext', 'mediumtext', 'tinytext', 'json')
    AND (
      COLUMN_NAME LIKE '%image%' 
      OR COLUMN_NAME LIKE '%url%' 
      OR COLUMN_NAME LIKE '%logo%' 
      OR COLUMN_NAME LIKE '%pdf%' 
      OR COLUMN_NAME LIKE '%audio%' 
      OR COLUMN_NAME LIKE '%background%' 
      OR COLUMN_NAME LIKE '%icon%' 
      OR COLUMN_NAME LIKE '%slides%' 
      OR COLUMN_NAME LIKE '%link%'
      OR COLUMN_NAME LIKE '%thumbnail%'
      OR COLUMN_NAME LIKE '%photo%'
      OR COLUMN_NAME LIKE '%picture%'
      OR COLUMN_NAME LIKE '%file%'
      OR COLUMN_NAME LIKE '%document%'
      OR COLUMN_NAME LIKE '%attachment%'
      OR COLUMN_NAME LIKE '%media%'
      OR COLUMN_NAME LIKE '%embed%'
      OR COLUMN_NAME LIKE '%src%'
    )
  )
ORDER BY TABLE_NAME, COLUMN_NAME;

-- Execute the generated SQL
SET @sql = IFNULL(@sql, 'SELECT ''No columns found to update'' AS message;');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ============================================
-- Verification: Check for any remaining instances
-- ============================================

SELECT 'Verification: Checking for remaining http://localhost:8080/ URLs...' AS status;

-- Count remaining instances in each table
SELECT 
    TABLE_NAME,
    COLUMN_NAME,
    COUNT(*) AS remaining_count
FROM INFORMATION_SCHEMA.COLUMNS c
WHERE TABLE_SCHEMA = 'industries'
  AND DATA_TYPE IN ('text', 'varchar', 'longtext', 'mediumtext', 'tinytext', 'json')
  AND (
    COLUMN_NAME LIKE '%image%' 
    OR COLUMN_NAME LIKE '%url%' 
    OR COLUMN_NAME LIKE '%logo%' 
    OR COLUMN_NAME LIKE '%pdf%' 
    OR COLUMN_NAME LIKE '%audio%' 
    OR COLUMN_NAME LIKE '%background%' 
    OR COLUMN_NAME LIKE '%icon%' 
    OR COLUMN_NAME LIKE '%slides%' 
    OR COLUMN_NAME LIKE '%link%'
  )
GROUP BY TABLE_NAME, COLUMN_NAME
ORDER BY TABLE_NAME, COLUMN_NAME;

SELECT 'Update completed! Please verify the results above.' AS status;

