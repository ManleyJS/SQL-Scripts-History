USE ROLE haven_batch_dataload;
USE SCHEMA haven_raw.google_integration;
USE WAREHOUSE bourne_batch_dataload_xsmall ;

SHOW VIEWS LIKE 'google_%';

USE ROLE sysadmin;

ALTER WAREHOUSE bourne_batch_dataload_xsmall SET warehouse_size = medium;

call load_avro_data_file('Google_Ads_p_Ad', 'haven_raw.google_integration.gcs_snowflake_digital_integration_stage', 'Google_Ads/p_Ad/2020/');

SELECT count(*) FROM HAVEN_RAW.GOOGLE_INTEGRATION.GOOGLE_ADS_P_AD_STAGE;

INSERT into HAVEN_RAW.GOOGLE_INTEGRATION.GOOGLE_ADS_P_AD
(PARTITIONTIME, CreativeId, EnhancedDisplayCreativeLandscapeLogoImageMediaId, DisplayUrl, ExpandedDynamicSearchCreativeDescription2, MultiAssetResponsiveDisplayAdMainColor, MultiAssetResponsiveDisplayAdMarketingImages, MultiAssetResponsiveDisplayAdSquareMarketingImages, ImageAdUrl, ImageCreativeImageHeight, ResponsiveSearchAdDescriptions, ResponsiveSearchAdHeadlines, GmailCreativeHeaderImageMediaId, GmailCreativeLogoImageMediaId, Description1, Description2, DevicePreference, MultiAssetResponsiveDisplayAdYouTubeVideos, Path1, Path2, CombinedApprovalStatus, CreativeDestinationUrl, CreativeTrackingUrlTemplate, CreativeUrlCustomParameters, Description, UniversalAppAdMandatoryAdText, UniversalAppAdYouTubeVideos, AdType, AllowFlexibleColor, ExpandedTextAdDescription2, ExpandedTextAdHeadlinePart3, FormatSetting, UniversalAppAdHeadlines, UniversalAppAdHtml5MediaBundles, UniversalAppAdImages, GmailCreativeMarketingImageMediaId, AccentColor, AdStrengthInfo, GmailTeaserBusinessName, GmailTeaserDescription, PolicySummary, PricePrefix, PromoText, EnhancedDisplayCreativeLogoImageMediaId, EnhancedDisplayCreativeMarketingImageMediaId, EnhancedDisplayCreativeMarketingImageSquareMediaId, ExternalCustomerId, CreativeFinalAppUrls, CreativeFinalMobileUrls, CreativeFinalUrls, ResponsiveSearchAdPath1, ResponsiveSearchAdPath2, ShortHeadline, AdGroupId, CampaignId, GmailTeaserHeadline, Headline, HeadlinePart1, HeadlinePart2, Status, SystemManagedEntitySource, UniversalAppAdDescriptions, Automated, BusinessName, CallOnlyPhoneNumber, CallToActionText, MarketingImageDescription, MarketingImageHeadline, MultiAssetResponsiveDisplayAdAccentColor, MultiAssetResponsiveDisplayAdBusinessName, MultiAssetResponsiveDisplayAdFormatSetting, MultiAssetResponsiveDisplayAdHeadlines, MultiAssetResponsiveDisplayAdLandscapeLogoImages, LabelIds, Labels, LongHeadline, MainColor, MarketingImageCallToActionText, MarketingImageCallToActionTextColor, MultiAssetResponsiveDisplayAdCallToActionText, MultiAssetResponsiveDisplayAdDescriptions, MultiAssetResponsiveDisplayAdDynamicSettingsPricePrefix, MultiAssetResponsiveDisplayAdDynamicSettingsPromoText, MultiAssetResponsiveDisplayAdLogoImages, MultiAssetResponsiveDisplayAdLongHeadline, ImageCreativeImageWidth, ImageCreativeMimeType, ImageCreativeName)
SELECT date(PARTITIONTIME), "CreativeId", "EnhancedDisplayCreativeLandscapeLogoImageMediaId", "DisplayUrl", "ExpandedDynamicSearchCreativeDescription2", "MultiAssetResponsiveDisplayAdMainColor", "MultiAssetResponsiveDisplayAdMarketingImages", "MultiAssetResponsiveDisplayAdSquareMarketingImages", "ImageAdUrl", "ImageCreativeImageHeight", "ResponsiveSearchAdDescriptions", "ResponsiveSearchAdHeadlines", "GmailCreativeHeaderImageMediaId", "GmailCreativeLogoImageMediaId", "Description1", "Description2", "DevicePreference", "MultiAssetResponsiveDisplayAdYouTubeVideos", "Path1", "Path2", "CombinedApprovalStatus", "CreativeDestinationUrl", "CreativeTrackingUrlTemplate", "CreativeUrlCustomParameters", "Description", "UniversalAppAdMandatoryAdText", "UniversalAppAdYouTubeVideos", "AdType", "AllowFlexibleColor", "ExpandedTextAdDescription2", "ExpandedTextAdHeadlinePart3", "FormatSetting", "UniversalAppAdHeadlines", "UniversalAppAdHtml5MediaBundles", "UniversalAppAdImages", "GmailCreativeMarketingImageMediaId", "AccentColor", "AdStrengthInfo", "GmailTeaserBusinessName", "GmailTeaserDescription", "PolicySummary", "PricePrefix", "PromoText", "EnhancedDisplayCreativeLogoImageMediaId", "EnhancedDisplayCreativeMarketingImageMediaId", "EnhancedDisplayCreativeMarketingImageSquareMediaId", "ExternalCustomerId", "CreativeFinalAppUrls", "CreativeFinalMobileUrls", "CreativeFinalUrls", "ResponsiveSearchAdPath1", "ResponsiveSearchAdPath2", "ShortHeadline", "AdGroupId", "CampaignId", "GmailTeaserHeadline", "Headline", "HeadlinePart1", "HeadlinePart2", "Status", "SystemManagedEntitySource", "UniversalAppAdDescriptions", "Automated", "BusinessName", "CallOnlyPhoneNumber", "CallToActionText", "MarketingImageDescription", "MarketingImageHeadline", "MultiAssetResponsiveDisplayAdAccentColor", "MultiAssetResponsiveDisplayAdBusinessName", "MultiAssetResponsiveDisplayAdFormatSetting", "MultiAssetResponsiveDisplayAdHeadlines", "MultiAssetResponsiveDisplayAdLandscapeLogoImages", "LabelIds", "Labels", "LongHeadline", "MainColor", "MarketingImageCallToActionText", "MarketingImageCallToActionTextColor", "MultiAssetResponsiveDisplayAdCallToActionText", "MultiAssetResponsiveDisplayAdDescriptions", "MultiAssetResponsiveDisplayAdDynamicSettingsPricePrefix", "MultiAssetResponsiveDisplayAdDynamicSettingsPromoText", "MultiAssetResponsiveDisplayAdLogoImages", "MultiAssetResponsiveDisplayAdLongHeadline", "ImageCreativeImageWidth", "ImageCreativeMimeType", "ImageCreativeName"
FROM HAVEN_RAW.GOOGLE_INTEGRATION.GOOGLE_ADS_P_AD_STAGE
ORDER BY date(partitiontime);


create OR REPLACE table HAVEN_RAW.GOOGLE_INTEGRATION.GOOGLE_ADS_P_AD
(PARTITIONTIME, CreativeId, EnhancedDisplayCreativeLandscapeLogoImageMediaId, DisplayUrl, ExpandedDynamicSearchCreativeDescription2, MultiAssetResponsiveDisplayAdMainColor, MultiAssetResponsiveDisplayAdMarketingImages, MultiAssetResponsiveDisplayAdSquareMarketingImages, ImageAdUrl, ImageCreativeImageHeight, ResponsiveSearchAdDescriptions, ResponsiveSearchAdHeadlines, GmailCreativeHeaderImageMediaId, GmailCreativeLogoImageMediaId, Description1, Description2, DevicePreference, MultiAssetResponsiveDisplayAdYouTubeVideos, Path1, Path2, CombinedApprovalStatus, CreativeDestinationUrl, CreativeTrackingUrlTemplate, CreativeUrlCustomParameters, Description, UniversalAppAdMandatoryAdText, UniversalAppAdYouTubeVideos, AdType, AllowFlexibleColor, ExpandedTextAdDescription2, ExpandedTextAdHeadlinePart3, FormatSetting, UniversalAppAdHeadlines, UniversalAppAdHtml5MediaBundles, UniversalAppAdImages, GmailCreativeMarketingImageMediaId, AccentColor, AdStrengthInfo, GmailTeaserBusinessName, GmailTeaserDescription, PolicySummary, PricePrefix, PromoText, EnhancedDisplayCreativeLogoImageMediaId, EnhancedDisplayCreativeMarketingImageMediaId, EnhancedDisplayCreativeMarketingImageSquareMediaId, ExternalCustomerId, CreativeFinalAppUrls, CreativeFinalMobileUrls, CreativeFinalUrls, ResponsiveSearchAdPath1, ResponsiveSearchAdPath2, ShortHeadline, AdGroupId, CampaignId, GmailTeaserHeadline, Headline, HeadlinePart1, HeadlinePart2, Status, SystemManagedEntitySource, UniversalAppAdDescriptions, Automated, BusinessName, CallOnlyPhoneNumber, CallToActionText, MarketingImageDescription, MarketingImageHeadline, MultiAssetResponsiveDisplayAdAccentColor, MultiAssetResponsiveDisplayAdBusinessName, MultiAssetResponsiveDisplayAdFormatSetting, MultiAssetResponsiveDisplayAdHeadlines, MultiAssetResponsiveDisplayAdLandscapeLogoImages, LabelIds, Labels, LongHeadline, MainColor, MarketingImageCallToActionText, MarketingImageCallToActionTextColor, MultiAssetResponsiveDisplayAdCallToActionText, MultiAssetResponsiveDisplayAdDescriptions, MultiAssetResponsiveDisplayAdDynamicSettingsPricePrefix, MultiAssetResponsiveDisplayAdDynamicSettingsPromoText, MultiAssetResponsiveDisplayAdLogoImages, MultiAssetResponsiveDisplayAdLongHeadline, ImageCreativeImageWidth, ImageCreativeMimeType, ImageCreativeName)
AS SELECT date(PARTITIONTIME), "CreativeId", "EnhancedDisplayCreativeLandscapeLogoImageMediaId", "DisplayUrl", "ExpandedDynamicSearchCreativeDescription2", "MultiAssetResponsiveDisplayAdMainColor", "MultiAssetResponsiveDisplayAdMarketingImages", "MultiAssetResponsiveDisplayAdSquareMarketingImages", "ImageAdUrl", "ImageCreativeImageHeight", "ResponsiveSearchAdDescriptions", "ResponsiveSearchAdHeadlines", "GmailCreativeHeaderImageMediaId", "GmailCreativeLogoImageMediaId", "Description1", "Description2", "DevicePreference", "MultiAssetResponsiveDisplayAdYouTubeVideos", "Path1", "Path2", "CombinedApprovalStatus", "CreativeDestinationUrl", "CreativeTrackingUrlTemplate", "CreativeUrlCustomParameters", "Description", "UniversalAppAdMandatoryAdText", "UniversalAppAdYouTubeVideos", "AdType", "AllowFlexibleColor", "ExpandedTextAdDescription2", "ExpandedTextAdHeadlinePart3", "FormatSetting", "UniversalAppAdHeadlines", "UniversalAppAdHtml5MediaBundles", "UniversalAppAdImages", "GmailCreativeMarketingImageMediaId", "AccentColor", "AdStrengthInfo", "GmailTeaserBusinessName", "GmailTeaserDescription", "PolicySummary", "PricePrefix", "PromoText", "EnhancedDisplayCreativeLogoImageMediaId", "EnhancedDisplayCreativeMarketingImageMediaId", "EnhancedDisplayCreativeMarketingImageSquareMediaId", "ExternalCustomerId", "CreativeFinalAppUrls", "CreativeFinalMobileUrls", "CreativeFinalUrls", "ResponsiveSearchAdPath1", "ResponsiveSearchAdPath2", "ShortHeadline", "AdGroupId", "CampaignId", "GmailTeaserHeadline", "Headline", "HeadlinePart1", "HeadlinePart2", "Status", "SystemManagedEntitySource", "UniversalAppAdDescriptions", "Automated", "BusinessName", "CallOnlyPhoneNumber", "CallToActionText", "MarketingImageDescription", "MarketingImageHeadline", "MultiAssetResponsiveDisplayAdAccentColor", "MultiAssetResponsiveDisplayAdBusinessName", "MultiAssetResponsiveDisplayAdFormatSetting", "MultiAssetResponsiveDisplayAdHeadlines", "MultiAssetResponsiveDisplayAdLandscapeLogoImages", "LabelIds", "Labels", "LongHeadline", "MainColor", "MarketingImageCallToActionText", "MarketingImageCallToActionTextColor", "MultiAssetResponsiveDisplayAdCallToActionText", "MultiAssetResponsiveDisplayAdDescriptions", "MultiAssetResponsiveDisplayAdDynamicSettingsPricePrefix", "MultiAssetResponsiveDisplayAdDynamicSettingsPromoText", "MultiAssetResponsiveDisplayAdLogoImages", "MultiAssetResponsiveDisplayAdLongHeadline", "ImageCreativeImageWidth", "ImageCreativeMimeType", "ImageCreativeName"
FROM HAVEN_RAW.GOOGLE_INTEGRATION.GOOGLE_ADS_P_AD_STAGE
ORDER BY date(partitiontime);


DROP TABLE HAVEN_RAW.GOOGLE_INTEGRATION.GOOGLE_P_AD_STAGE;

SELECT date(partitiontime) FROM google_ads_p_ad_stage LIMIT 10;
SELECT count(*) FROM google_ads_p_ad_stage;
SELECT count(*) FROM google_ads_p_ad WHERE partitiontime BETWEEN '2023-01-01' AND '2023-12-31';

SELECT max(partitiontime) FROM google_ads_p_ad;
ALTER TABLE GOOGLE_P_AD_STAGE RENAME TO google_p_ad_stage_2022;

CREATE TABLE GOOGLE_P_AD_STAGE LIKE google_p_ad_stage_June;

COPY INTO GOOGLE_P_AD_STAGE
FROM @GCS_SNOWFLAKE_DIGITAL_INTEGRATION_STAGE/Google_Ads/p_Ad/2023


ALTER WAREHOUSE bourne_batch_dataload_xsmall SET warehouse_size = xsmall;

USE ROLE securityadmin;

SHOW USERS LIKE 'raheel%';
SHOW GRANTS TO ROLE warner_guest_commercial;
SHOW GRANTS TO ROLE warner_marketing;

SHOW ROLES LIKE 'warner_%';

USE ROLE sysadmin;

-- `digital-trading-1274`.Google_Ads.p_Ad_8093032730 definition

-- Drop table

-- DROP TABLE `digital-trading-1274`.Google_Ads.p_Ad_8093032730;

drop TABLE haven_raw.GOOGLE_INTEGRATION.google_ads_p_Ad;


SHOW FILE FORMATS;
SHOW STAGES;

CREATE OR REPLACE FILE FORMAT GCS_CSV_COMPRESSED 
TYPE = CSV,
SKIP_HEADER = 0,
DATE_FORMAT = AUTO,
TIME_FORMAT = AUTO,
TIMESTAMP_FORMAT = 'YYYY-MM-DD HH24:MI:SS.FF6 UTC',
TRIM_SPACE = false,
FIELD_OPTIONALLY_ENCLOSED_BY = '"',
ERROR_ON_COLUMN_COUNT_MISMATCH = true,
SKIP_BLANK_LINES = false,
REPLACE_INVALID_CHARACTERS = false,
EMPTY_FIELD_AS_NULL = true,
SKIP_BYTE_ORDER_MARK = true,
ENCODING = 'UTF8',
compression = GZIP;


SELECT date(t.$1::bigint) FROM @GCS_SNOWFLAKE_DIGITAL_INTEGRATION_STAGE/Google_Ads/p_Ad
(file_format => 'GCS_CSV_COMPRESSED') T
LIMIT 20;

LS @GCS_SNOWFLAKE_DIGITAL_INTEGRATION_STAGE/Google_Ads/p_Ad/2023;

SELECT t.$1 FROM @GCS_SNOWFLAKE_DIGITAL_INTEGRATION_STAGE/Google_Ads/p_Ad/csv_version/
(file_format => 'GCS_CSV_COMPRESSED') T
LIMIT 20;

--COPY INTO haven_raw.GOOGLE_INTEGRATION.google_ads_p_Ad;

USE ROLE securityadmin;

show USERS LIKE 'bob%';

USE ROLE haven_batch_dataload;
USE SCHEMA haven_store.ma_mart;


-- HAVEN_STORE.MA_MART.MA_HOLIDAY_PERSON definition

create or replace TABLE HAVEN_STORE.MA_MART.MA_HOLIDAY_PERSON (
	PERSON_ID NUMBER(12,0),
	ADDRESS_ID NUMBER(12,0),
	FAMILY_TYPE_CAMEO VARCHAR(100),
	NVR VARCHAR(1),
	HAVEN_SEGMENT VARCHAR(20),
	CLOSEST_PARK VARCHAR(128),
	LAST_DRIVETIME NUMBER(38,0),
	CYHH_PREVIOUS VARCHAR(1),
	ACTIVE_OPTION VARCHAR(1),
	HOUSEHOLD_INCOME_CAMEO VARCHAR(168),
	SEG VARCHAR(10),
	MOSAIC_TYPE VARCHAR(128),
	CANCELLED VARCHAR(1),
	CX_REFUNDED VARCHAR(1),
	TOTAL_CLIENTBANK_BALANCE NUMBER(38,0),
	CS_PROSPECT VARCHAR(1),
	NVR_SEGMENT VARCHAR(25),
	ECLIENT_YN VARCHAR(1),
	HOME_COUNTY VARCHAR(50),
	LATEST_NPS NUMBER(38,0),
	NVR_NEXT_SEASON VARCHAR(1),
	NVR_SEGMENT_NEXT_SEASON VARCHAR(25),
	HOME_REGION VARCHAR(25),
	LIFETIME_FT_MEMBER VARCHAR(1),
	CURRENT_SEASON_FT_MEMBER VARCHAR(1),
	SUBJECT_ID VARCHAR(200),
	LATEST_SUB_PRODUCT VARCHAR(50),
	PREVIOUS_SEASON_FT_MEMBER VARCHAR(1),
	CURRENT_SEASON_YN VARCHAR(1),
	NO_FUTURE_BK_YN VARCHAR(1),
	LAST_PARK_VISITED VARCHAR(25),
	LAST_PARK_SPEND NUMBER(38,0),
	OFF_PEAK_SPEND VARCHAR(25),
	PEAK_SPEND VARCHAR(25),
	LAST_REGION_VISITED VARCHAR(25),
	CS_APPT_DATE DATE,
	CS_PARK_CD VARCHAR(2),
	CS_APPT VARCHAR(1)
);


CREATE TABLE HAVEN_STORE.MA_MART.MA_HOLIDAY_PERSON_SAVE CLONE HAVEN_STORE.MA_MART.MA_HOLIDAY_PERSON;

DROP TABLE HAVEN_STORE.MA_MART.MA_HOLIDAY_PERSON;
ALTER TABLE HAVEN_STORE.MA_MART.MA_HOLIDAY_PERSON_SAVE RENAME TO HAVEN_STORE.MA_MART.MA_HOLIDAY_PERSON;


USE ROLE securityadmin;
GRANT ROLE _haven_raw__eclient__creator TO ROLE haven_batch_dataload;
SHOW ROLES LIKE '%eclient%';
GRANT ROLE warner_guest_commercialTO ROLE dba;

USE ROLE useradmin;

CREATE ROLE warner_guest_commercial_raheeltahir;

SHOW GRANTS TO ROLE warner_guest_commercial_raheeltahir;

GRANT ROLE warner_guest_commercial_raheeltahir TO USER raheeltahir;

SHOW GRANTS TO USER raheeltahir;

USE ROLE dba;
USE ROLE WARNer_guest_commercial;

SHOW WAREHOUSES;

USE WAREHOUSE warner_guest_commercial_warehouse_xsmall;

SHOW ROLES LIKE '_warner_guest_commercial_%';

SHOW GRANTS TO ROLE warner_guest_commercial;

USE schema haven_store.availability;

SHOW TABLES; 

SELECT cast(NULL AS decimal(6,2));

USE ROLE sysadmin;
ALTER WAREHOUSE bourne_batch_dataload_xsmall SET warehouse_size = medium;
use role haven_batch_dataload;
use schema haven_raw.google_integration;
USE WAREHOUSE bourne_batch_dataload_xsmall;

CREATE OR REPLACE TABLE HAVEN_RAW.GOOGLE_INTEGRATION.GOOGLE_ADS_P_ADS_AD
(ad_group_ad_ad_name, ad_group_ad_ad_responsive_display_ad_accent_color, ad_group_ad_ad_responsive_display_ad_business_name, ad_group_ad_ad_responsive_display_ad_call_to_action_text, ad_group_ad_ad_responsive_display_ad_descriptions, ad_group_ad_ad_responsive_display_ad_format_setting, ad_group_ad_ad_responsive_display_ad_headlines, ad_group_ad_ad_responsive_display_ad_logo_images, ad_group_ad_ad_responsive_display_ad_long_headline, ad_group_ad_ad_expanded_text_ad_headline_part1, ad_group_ad_ad_expanded_text_ad_headline_part2, ad_group_ad_ad_expanded_text_ad_headline_part3, ad_group_ad_ad_expanded_text_ad_path1, ad_group_ad_ad_expanded_text_ad_path2, ad_group_ad_ad_final_app_urls, ad_group_ad_ad_final_mobile_urls, ad_group_ad_ad_final_urls, ad_group_ad_ad_group, ad_group_ad_ad_app_ad_images, ad_group_ad_ad_app_ad_mandatory_ad_text, ad_group_ad_ad_app_ad_youtube_videos, ad_group_ad_ad_call_ad_phone_number, ad_group_ad_ad_device_preference, ad_group_ad_ad_display_url, ad_group_ad_ad_expanded_dynamic_search_ad_description, ad_group_ad_ad_expanded_dynamic_search_ad_description2, ad_group_ad_ad_expanded_text_ad_description, ad_group_ad_ad_expanded_text_ad_description2, ad_group_ad_ad_responsive_display_ad_main_color, ad_group_ad_ad_responsive_display_ad_marketing_images, ad_group_ad_ad_responsive_display_ad_price_prefix, ad_group_ad_ad_responsive_display_ad_promo_text, ad_group_ad_ad_responsive_display_ad_square_logo_images, ad_group_ad_ad_responsive_display_ad_square_marketing_images, ad_group_ad_ad_responsive_display_ad_youtube_videos, ad_group_ad_ad_responsive_search_ad_descriptions, ad_group_ad_ad_responsive_search_ad_headlines, ad_group_ad_ad_responsive_search_ad_path1, ad_group_ad_ad_legacy_responsive_display_ad_format_setting, ad_group_ad_ad_legacy_responsive_display_ad_logo_image, ad_group_ad_ad_legacy_responsive_display_ad_long_headline, ad_group_ad_ad_legacy_responsive_display_ad_main_color, ad_group_ad_ad_legacy_responsive_display_ad_marketing_image, ad_group_ad_ad_legacy_responsive_display_ad_price_prefix, ad_group_ad_ad_legacy_responsive_display_ad_promo_text, ad_group_ad_ad_legacy_responsive_display_ad_short_headline, ad_group_ad_ad_legacy_responsive_display_ad_square_logo_image, ad_group_ad_ad_legacy_responsive_display_ad_square_marketing_image, ad_group_ad_ad_responsive_search_ad_path2, ad_group_ad_ad_strength, ad_group_ad_ad_system_managed_resource_source, ad_group_ad_ad_text_ad_description1, ad_group_ad_ad_text_ad_description2, ad_group_ad_ad_text_ad_headline, ad_group_ad_ad_tracking_url_template, ad_group_ad_ad_type, ad_group_ad_ad_url_custom_parameters, ad_group_ad_status, ad_group_ad_ad_image_ad_image_url, ad_group_ad_ad_image_ad_mime_type, ad_group_ad_ad_image_ad_name, ad_group_ad_ad_image_ad_pixel_height, ad_group_ad_ad_image_ad_pixel_width, ad_group_ad_ad_legacy_responsive_display_ad_accent_color, ad_group_ad_ad_legacy_responsive_display_ad_allow_flexible_color, ad_group_ad_ad_legacy_responsive_display_ad_business_name, ad_group_ad_ad_legacy_responsive_display_ad_call_to_action_text, ad_group_ad_ad_legacy_responsive_display_ad_description, PARTITIONTIME, ad_group_ad_ad_id, ad_group_id, campaign_id, customer_id, ad_group_ad_ad_added_by_google_ads, ad_group_ad_ad_app_ad_descriptions, ad_group_ad_ad_app_ad_headlines, ad_group_ad_ad_app_ad_html5_media_bundles)
AS SELECT "ad_group_ad_ad_name", "ad_group_ad_ad_responsive_display_ad_accent_color", "ad_group_ad_ad_responsive_display_ad_business_name", "ad_group_ad_ad_responsive_display_ad_call_to_action_text", "ad_group_ad_ad_responsive_display_ad_descriptions", "ad_group_ad_ad_responsive_display_ad_format_setting", "ad_group_ad_ad_responsive_display_ad_headlines", "ad_group_ad_ad_responsive_display_ad_logo_images", "ad_group_ad_ad_responsive_display_ad_long_headline", "ad_group_ad_ad_expanded_text_ad_headline_part1", "ad_group_ad_ad_expanded_text_ad_headline_part2", "ad_group_ad_ad_expanded_text_ad_headline_part3", "ad_group_ad_ad_expanded_text_ad_path1", "ad_group_ad_ad_expanded_text_ad_path2", "ad_group_ad_ad_final_app_urls", "ad_group_ad_ad_final_mobile_urls", "ad_group_ad_ad_final_urls", "ad_group_ad_ad_group", "ad_group_ad_ad_app_ad_images", "ad_group_ad_ad_app_ad_mandatory_ad_text", "ad_group_ad_ad_app_ad_youtube_videos", "ad_group_ad_ad_call_ad_phone_number", "ad_group_ad_ad_device_preference", "ad_group_ad_ad_display_url", "ad_group_ad_ad_expanded_dynamic_search_ad_description", "ad_group_ad_ad_expanded_dynamic_search_ad_description2", "ad_group_ad_ad_expanded_text_ad_description", "ad_group_ad_ad_expanded_text_ad_description2", "ad_group_ad_ad_responsive_display_ad_main_color", "ad_group_ad_ad_responsive_display_ad_marketing_images", "ad_group_ad_ad_responsive_display_ad_price_prefix", "ad_group_ad_ad_responsive_display_ad_promo_text", "ad_group_ad_ad_responsive_display_ad_square_logo_images", "ad_group_ad_ad_responsive_display_ad_square_marketing_images", "ad_group_ad_ad_responsive_display_ad_youtube_videos", "ad_group_ad_ad_responsive_search_ad_descriptions", "ad_group_ad_ad_responsive_search_ad_headlines", "ad_group_ad_ad_responsive_search_ad_path1", "ad_group_ad_ad_legacy_responsive_display_ad_format_setting", "ad_group_ad_ad_legacy_responsive_display_ad_logo_image", "ad_group_ad_ad_legacy_responsive_display_ad_long_headline", "ad_group_ad_ad_legacy_responsive_display_ad_main_color", "ad_group_ad_ad_legacy_responsive_display_ad_marketing_image", "ad_group_ad_ad_legacy_responsive_display_ad_price_prefix", "ad_group_ad_ad_legacy_responsive_display_ad_promo_text", "ad_group_ad_ad_legacy_responsive_display_ad_short_headline", "ad_group_ad_ad_legacy_responsive_display_ad_square_logo_image", "ad_group_ad_ad_legacy_responsive_display_ad_square_marketing_image", "ad_group_ad_ad_responsive_search_ad_path2", "ad_group_ad_ad_strength", "ad_group_ad_ad_system_managed_resource_source", "ad_group_ad_ad_text_ad_description1", "ad_group_ad_ad_text_ad_description2", "ad_group_ad_ad_text_ad_headline", "ad_group_ad_ad_tracking_url_template", "ad_group_ad_ad_type", "ad_group_ad_ad_url_custom_parameters", "ad_group_ad_status", "ad_group_ad_ad_image_ad_image_url", "ad_group_ad_ad_image_ad_mime_type", "ad_group_ad_ad_image_ad_name", "ad_group_ad_ad_image_ad_pixel_height", "ad_group_ad_ad_image_ad_pixel_width", "ad_group_ad_ad_legacy_responsive_display_ad_accent_color", "ad_group_ad_ad_legacy_responsive_display_ad_allow_flexible_color", "ad_group_ad_ad_legacy_responsive_display_ad_business_name", "ad_group_ad_ad_legacy_responsive_display_ad_call_to_action_text", "ad_group_ad_ad_legacy_responsive_display_ad_description", date(PARTITIONTIME), "ad_group_ad_ad_id", "ad_group_id", "campaign_id", "customer_id", "ad_group_ad_ad_added_by_google_ads", "ad_group_ad_ad_app_ad_descriptions", "ad_group_ad_ad_app_ad_headlines", "ad_group_ad_ad_app_ad_html5_media_bundles"
FROM HAVEN_RAW.GOOGLE_INTEGRATION.GOOGLE_ADS_P_ADS_AD_STAGE
ORDER BY PARTITIONTIME;

USE ROLE sysadmin;
ALTER WAREHOUSE bourne_batch_dataload_xsmall SET warehouse_size = xsmall;

USE ROLE haven_batch_dataload;

USE SCHEMA haven_raw.google_integration;

USE WAREHOUSE bourne_batch_dataload_xsmall;
ALTER TABLE GOOGLE_ADS_P_AD drop COLUMN D_GROUP_AD_POLICY_SUMMARY_APPROVAL_STATUS;
ALTER TABLE GOOGLE_ADS_P_ADS_AD drop COLUMN D_GROUP_AD_POLICY_SUMMARY_APPROVAL_STATUS;
ALTER TABLE GOOGLE_ADS_P_ADS_AD add COLUMN AD_GROUP_AD_POLICY_SUMMARY_APPROVAL_STATUS varchar();

call load_avro_data_file('Google_Ads_p_ads_Ad', 'haven_raw.google_integration.gcs_snowflake_digital_integration_stage', 'Google_Ads/p_ads_Ad/2023-08-14/');

SELECT date(partitiontime), count(*) FROM GOOGLE_ADS_P_ADs_ad_stage LIMIT GROUP BY 1 ORDER BY 1;

SELECT * FROM GOOGLE_ADS_P_ADS_AD_STAGE LIMIT 100;

insert into HAVEN_RAW.GOOGLE_INTEGRATION.Google_Ads_p_ads_Ad ( PARTITIONTIME, AD_GROUP_AD_AD_ID, AD_GROUP_ID, CAMPAIGN_ID, CUSTOMER_ID, AD_GROUP_AD_AD_ADDED_BY_GOOGLE_ADS, AD_GROUP_AD_AD_APP_AD_DESCRIPTIONS, AD_GROUP_AD_AD_APP_AD_HEADLINES, AD_GROUP_AD_AD_APP_AD_HTML5_MEDIA_BUNDLES, AD_GROUP_AD_AD_APP_AD_IMAGES, AD_GROUP_AD_AD_APP_AD_MANDATORY_AD_TEXT, AD_GROUP_AD_AD_APP_AD_YOUTUBE_VIDEOS, AD_GROUP_AD_AD_CALL_AD_PHONE_NUMBER, AD_GROUP_AD_AD_DEVICE_PREFERENCE, AD_GROUP_AD_AD_DISPLAY_URL, AD_GROUP_AD_AD_EXPANDED_DYNAMIC_SEARCH_AD_DESCRIPTION, AD_GROUP_AD_AD_EXPANDED_DYNAMIC_SEARCH_AD_DESCRIPTION2, AD_GROUP_AD_AD_EXPANDED_TEXT_AD_DESCRIPTION, AD_GROUP_AD_AD_EXPANDED_TEXT_AD_DESCRIPTION2, AD_GROUP_AD_AD_EXPANDED_TEXT_AD_HEADLINE_PART1, AD_GROUP_AD_AD_EXPANDED_TEXT_AD_HEADLINE_PART2, AD_GROUP_AD_AD_EXPANDED_TEXT_AD_HEADLINE_PART3, AD_GROUP_AD_AD_EXPANDED_TEXT_AD_PATH1, AD_GROUP_AD_AD_EXPANDED_TEXT_AD_PATH2, AD_GROUP_AD_AD_FINAL_APP_URLS, AD_GROUP_AD_AD_FINAL_MOBILE_URLS, AD_GROUP_AD_AD_FINAL_URLS, AD_GROUP_AD_AD_GROUP, AD_GROUP_AD_AD_IMAGE_AD_IMAGE_URL, AD_GROUP_AD_AD_IMAGE_AD_MIME_TYPE, AD_GROUP_AD_AD_IMAGE_AD_NAME, AD_GROUP_AD_AD_IMAGE_AD_PIXEL_HEIGHT, AD_GROUP_AD_AD_IMAGE_AD_PIXEL_WIDTH, AD_GROUP_AD_AD_LEGACY_RESPONSIVE_DISPLAY_AD_ACCENT_COLOR, AD_GROUP_AD_AD_LEGACY_RESPONSIVE_DISPLAY_AD_ALLOW_FLEXIBLE_COLOR, AD_GROUP_AD_AD_LEGACY_RESPONSIVE_DISPLAY_AD_BUSINESS_NAME, AD_GROUP_AD_AD_LEGACY_RESPONSIVE_DISPLAY_AD_CALL_TO_ACTION_TEXT, AD_GROUP_AD_AD_LEGACY_RESPONSIVE_DISPLAY_AD_DESCRIPTION, AD_GROUP_AD_AD_LEGACY_RESPONSIVE_DISPLAY_AD_FORMAT_SETTING, AD_GROUP_AD_AD_LEGACY_RESPONSIVE_DISPLAY_AD_LOGO_IMAGE, AD_GROUP_AD_AD_LEGACY_RESPONSIVE_DISPLAY_AD_LONG_HEADLINE, AD_GROUP_AD_AD_LEGACY_RESPONSIVE_DISPLAY_AD_MAIN_COLOR, AD_GROUP_AD_AD_LEGACY_RESPONSIVE_DISPLAY_AD_MARKETING_IMAGE, AD_GROUP_AD_AD_LEGACY_RESPONSIVE_DISPLAY_AD_PRICE_PREFIX, AD_GROUP_AD_AD_LEGACY_RESPONSIVE_DISPLAY_AD_PROMO_TEXT, AD_GROUP_AD_AD_LEGACY_RESPONSIVE_DISPLAY_AD_SHORT_HEADLINE, AD_GROUP_AD_AD_LEGACY_RESPONSIVE_DISPLAY_AD_SQUARE_LOGO_IMAGE, AD_GROUP_AD_AD_LEGACY_RESPONSIVE_DISPLAY_AD_SQUARE_MARKETING_IMAGE, AD_GROUP_AD_AD_NAME, AD_GROUP_AD_AD_RESPONSIVE_DISPLAY_AD_ACCENT_COLOR, AD_GROUP_AD_AD_RESPONSIVE_DISPLAY_AD_BUSINESS_NAME, AD_GROUP_AD_AD_RESPONSIVE_DISPLAY_AD_CALL_TO_ACTION_TEXT, AD_GROUP_AD_AD_RESPONSIVE_DISPLAY_AD_DESCRIPTIONS, AD_GROUP_AD_AD_RESPONSIVE_DISPLAY_AD_FORMAT_SETTING, AD_GROUP_AD_AD_RESPONSIVE_DISPLAY_AD_HEADLINES, AD_GROUP_AD_AD_RESPONSIVE_DISPLAY_AD_LOGO_IMAGES, AD_GROUP_AD_AD_RESPONSIVE_DISPLAY_AD_LONG_HEADLINE, AD_GROUP_AD_AD_RESPONSIVE_DISPLAY_AD_MAIN_COLOR, AD_GROUP_AD_AD_RESPONSIVE_DISPLAY_AD_MARKETING_IMAGES, AD_GROUP_AD_AD_RESPONSIVE_DISPLAY_AD_PRICE_PREFIX, AD_GROUP_AD_AD_RESPONSIVE_DISPLAY_AD_PROMO_TEXT, AD_GROUP_AD_AD_RESPONSIVE_DISPLAY_AD_SQUARE_LOGO_IMAGES, AD_GROUP_AD_AD_RESPONSIVE_DISPLAY_AD_SQUARE_MARKETING_IMAGES, AD_GROUP_AD_AD_RESPONSIVE_DISPLAY_AD_YOUTUBE_VIDEOS, AD_GROUP_AD_AD_RESPONSIVE_SEARCH_AD_DESCRIPTIONS, AD_GROUP_AD_AD_RESPONSIVE_SEARCH_AD_HEADLINES, AD_GROUP_AD_AD_RESPONSIVE_SEARCH_AD_PATH1, AD_GROUP_AD_AD_RESPONSIVE_SEARCH_AD_PATH2, AD_GROUP_AD_AD_STRENGTH, AD_GROUP_AD_AD_SYSTEM_MANAGED_RESOURCE_SOURCE, AD_GROUP_AD_AD_TEXT_AD_DESCRIPTION1, AD_GROUP_AD_AD_TEXT_AD_DESCRIPTION2, AD_GROUP_AD_AD_TEXT_AD_HEADLINE, AD_GROUP_AD_AD_TRACKING_URL_TEMPLATE, AD_GROUP_AD_AD_TYPE, AD_GROUP_AD_AD_URL_CUSTOM_PARAMETERS, AD_GROUP_AD_POLICY_SUMMARY_APPROVAL_STATUS, AD_GROUP_AD_STATUS ) select DATE("PARTITIONTIME") AS "PARTITIONTIME", "ad_group_ad_ad_id", "ad_group_id", "campaign_id", "customer_id", "ad_group_ad_ad_added_by_google_ads", "ad_group_ad_ad_app_ad_descriptions", "ad_group_ad_ad_app_ad_headlines", "ad_group_ad_ad_app_ad_html5_media_bundles", "ad_group_ad_ad_app_ad_images", "ad_group_ad_ad_app_ad_mandatory_ad_text", "ad_group_ad_ad_app_ad_youtube_videos", "ad_group_ad_ad_call_ad_phone_number", "ad_group_ad_ad_device_preference", "ad_group_ad_ad_display_url", "ad_group_ad_ad_expanded_dynamic_search_ad_description", "ad_group_ad_ad_expanded_dynamic_search_ad_description2", "ad_group_ad_ad_expanded_text_ad_description", "ad_group_ad_ad_expanded_text_ad_description2", "ad_group_ad_ad_expanded_text_ad_headline_part1", "ad_group_ad_ad_expanded_text_ad_headline_part2", "ad_group_ad_ad_expanded_text_ad_headline_part3", "ad_group_ad_ad_expanded_text_ad_path1", "ad_group_ad_ad_expanded_text_ad_path2", "ad_group_ad_ad_final_app_urls", "ad_group_ad_ad_final_mobile_urls", "ad_group_ad_ad_final_urls", "ad_group_ad_ad_group", "ad_group_ad_ad_image_ad_image_url", "ad_group_ad_ad_image_ad_mime_type", "ad_group_ad_ad_image_ad_name", "ad_group_ad_ad_image_ad_pixel_height", "ad_group_ad_ad_image_ad_pixel_width", "ad_group_ad_ad_legacy_responsive_display_ad_accent_color", "ad_group_ad_ad_legacy_responsive_display_ad_allow_flexible_color", "ad_group_ad_ad_legacy_responsive_display_ad_business_name", "ad_group_ad_ad_legacy_responsive_display_ad_call_to_action_text", "ad_group_ad_ad_legacy_responsive_display_ad_description", "ad_group_ad_ad_legacy_responsive_display_ad_format_setting", "ad_group_ad_ad_legacy_responsive_display_ad_logo_image", "ad_group_ad_ad_legacy_responsive_display_ad_long_headline", "ad_group_ad_ad_legacy_responsive_display_ad_main_color", "ad_group_ad_ad_legacy_responsive_display_ad_marketing_image", "ad_group_ad_ad_legacy_responsive_display_ad_price_prefix", "ad_group_ad_ad_legacy_responsive_display_ad_promo_text", "ad_group_ad_ad_legacy_responsive_display_ad_short_headline", "ad_group_ad_ad_legacy_responsive_display_ad_square_logo_image", "ad_group_ad_ad_legacy_responsive_display_ad_square_marketing_image", "ad_group_ad_ad_name", "ad_group_ad_ad_responsive_display_ad_accent_color", "ad_group_ad_ad_responsive_display_ad_business_name", "ad_group_ad_ad_responsive_display_ad_call_to_action_text", "ad_group_ad_ad_responsive_display_ad_descriptions", "ad_group_ad_ad_responsive_display_ad_format_setting", "ad_group_ad_ad_responsive_display_ad_headlines", "ad_group_ad_ad_responsive_display_ad_logo_images", "ad_group_ad_ad_responsive_display_ad_long_headline", "ad_group_ad_ad_responsive_display_ad_main_color", "ad_group_ad_ad_responsive_display_ad_marketing_images", "ad_group_ad_ad_responsive_display_ad_price_prefix", "ad_group_ad_ad_responsive_display_ad_promo_text", "ad_group_ad_ad_responsive_display_ad_square_logo_images", "ad_group_ad_ad_responsive_display_ad_square_marketing_images", "ad_group_ad_ad_responsive_display_ad_youtube_videos", "ad_group_ad_ad_responsive_search_ad_descriptions", "ad_group_ad_ad_responsive_search_ad_headlines", "ad_group_ad_ad_responsive_search_ad_path1", "ad_group_ad_ad_responsive_search_ad_path2", "ad_group_ad_ad_strength", "ad_group_ad_ad_system_managed_resource_source", "ad_group_ad_ad_text_ad_description1", "ad_group_ad_ad_text_ad_description2", "ad_group_ad_ad_text_ad_headline", "ad_group_ad_ad_tracking_url_template", "ad_group_ad_ad_type", "ad_group_ad_ad_url_custom_parameters", "ad_group_ad_policy_summary_approval_status", "ad_group_ad_status" from HAVEN_RAW.GOOGLE_INTEGRATION.Google_Ads_p_ads_Ad_stage order by "PARTITIONTIME" ASC;

USE ROLE securityadmin;

GRANT ROLE _haven_raw__bloomreach__creator TO ROLE haven_batch_dataload;

SHOW USERS;

USE ROLE haven_commercial;
USE SCHEMA haven_base.zbsdata_complex;
USE ROLE dba;
USE WAREHOUSE dba_wh;

SELECT MOBILE_MANAGER_INT_SA_UID, count(*) 
FROM IORDER_TBL_MOBILE_MANAGER_INTERACTIONS
GROUP BY 1 ORDER BY 1; 


SELECT MOBILE_MANAGER_INT_SA_UID, count(*) 
FROM haven_base.zbsdata_complex.IORDER_TBL_MOBILE_MANAGER_INTERACTIONS
GROUP BY 1 ORDER BY 1; 

SELECT MOBILE_MANAGER_INT_SA_UID, count(*) 
FROM HAVEN_STORE.ZBSDATA_COMPLEX.IORDER_TBL_MOBILE_MANAGER_INTERACTIONS
GROUP BY 1 ORDER BY 1; 

SHOW GRANTS TO USER udaypatel;
SHOW GRANTS TO ROLE haven_crm_management;

USE ROLE sysadmin;
SHOW WAREHOUSES LIKE '%commercial%';

USE ROLE dba;
USE SCHEMA haven_raw.aztec_complex;



-- HAVEN_RAW.AZTEC_COMPLEX.PAYMENTS definition

create or replace TABLE HAVEN_RAW.AZTEC_COMPLEX.PAYMENTS (
	TRANSACTIONID NUMBER(38,0) NOT NULL DEFAULT 0,
	DATE TIMESTAMP_NTZ(3) NOT NULL DEFAULT CAST('0001-01-01 00:00:00' AS TIMESTAMP_NTZ(3)),
	BUSINESSDATE TIMESTAMP_NTZ(3),
	TERMINALID NUMBER(38,0) NOT NULL DEFAULT 0,
	EMPLOYEEID NUMBER(38,0) NOT NULL DEFAULT 0,
	ACCOUNTID NUMBER(38,0) NOT NULL DEFAULT 0,
	"TRANSACTION NUMBER" NUMBER(38,0),
	"ORDER" NUMBER(38,0) NOT NULL DEFAULT 0,
	PAYMENT NUMBER(38,0) NOT NULL DEFAULT 0,
	AMOUNT NUMBER(19,4) NOT NULL DEFAULT 0,
	CHANGE NUMBER(19,4) NOT NULL DEFAULT 0,
	PAYMENTMETHOD NUMBER(38,0) NOT NULL DEFAULT 0,
	RECEIPTNO VARCHAR(20) NOT NULL DEFAULT '',
	CORRECTEDORDER NUMBER(38,0),
	MOVETYPE BOOLEAN NOT NULL DEFAULT FALSE,
	TIP NUMBER(19,4),
	PAYMENTCOUNT NUMBER(38,0) NOT NULL DEFAULT 0,
	LMDT TIMESTAMP_NTZ(3),
	"CASH BACK" NUMBER(19,4) NOT NULL DEFAULT 0,
	ISEFT BOOLEAN,
	PROCESSED BOOLEAN NOT NULL DEFAULT FALSE,
	PAYOUT BOOLEAN NOT NULL DEFAULT FALSE,
	ISCASHBACK BOOLEAN NOT NULL DEFAULT FALSE,
	OWNERID NUMBER(38,0),
	AUTHORISER NUMBER(38,0),
	ACCOUNTNUMBER VARCHAR(21),
	REPORTINGEMPLOYEEID NUMBER(38,0),
	AMOUNTINTENDEREDCURRENCY NUMBER(19,4) NOT NULL DEFAULT 0,
	FORFEITAMOUNT NUMBER(19,4) NOT NULL DEFAULT 0,
	TERMINALSESSIONID NUMBER(38,0) NOT NULL DEFAULT 0,
	MONEYBELTPAYMENT BOOLEAN NOT NULL DEFAULT FALSE,
	ORIGINALDATETIME TIMESTAMP_NTZ(3),
	primary key (TERMINALID, DATE, TRANSACTIONID)
);



--AZTECACTIVITYMANAGEMENT_COMPLEX

