--select *, date(_partitiontime) from SA360_haven_v2.p_AccountDeviceStats_21700000001663655 limit 100;
select max(date(_partitiontime)) from SA360_haven_v2.p_AccountDeviceStats_21700000001663655;

select * from `digital-trading-1274.SA360_haven_v2.INFORMATION_SCHEMA.COLUMNS` limit 50;

select column_name, ordinal_position from `digital-trading-1274.SA360_haven_v2.INFORMATION_SCHEMA.COLUMNS` where table_name = 'p_Advertiser_21700000001663655' 
order by ordinal_position asc;


select table_name, column_name from `digital-trading-1274.SA360_haven_v2.INFORMATION_SCHEMA.COLUMNS` where ordinal_position is null
order by table_name; 

select * from `digital-trading-1274.SA360_haven_v2.INFORMATION_SCHEMA.COLUMNS`
where table_name = 'p_Advertiser_21700000001663655' 
order by ordinal_position asc;

select date(date), count(*) from `digital-trading-1274.DV360_Tables.standard_daily`
group by 1 order by 1;

select count(*) from `digital-trading-1274.DV360_Tables.unique_reach_monthly`

--SELECT AdGroupId, CampaignId, CreativeId, EnhancedDisplayCreativeLandscapeLogoImageMediaId, EnhancedDisplayCreativeLogoImageMediaId, EnhancedDisplayCreativeMarketingImageMediaId, EnhancedDisplayCreativeMarketingImageSquareMediaId, ExternalCustomerId, GmailCreativeHeaderImageMediaId, GmailCreativeLogoImageMediaId, GmailCreativeMarketingImageMediaId, AccentColor, AdStrengthInfo, AdType, AllowFlexibleColor, Automated, BusinessName, CallOnlyPhoneNumber, CallToActionText, CombinedApprovalStatus, CreativeDestinationUrl, CreativeFinalAppUrls, CreativeFinalMobileUrls, CreativeFinalUrls, CreativeTrackingUrlTemplate, CreativeUrlCustomParameters, Description, Description1, Description2, DevicePreference, DisplayUrl, ExpandedDynamicSearchCreativeDescription2, ExpandedTextAdDescription2, ExpandedTextAdHeadlinePart3, FormatSetting, GmailTeaserBusinessName, GmailTeaserDescription, GmailTeaserHeadline, Headline, HeadlinePart1, HeadlinePart2, ImageAdUrl, ImageCreativeImageHeight, ImageCreativeImageWidth, ImageCreativeMimeType, ImageCreativeName, LabelIds, Labels, LongHeadline, MainColor, MarketingImageCallToActionText, MarketingImageCallToActionTextColor, MarketingImageDescription, MarketingImageHeadline, MultiAssetResponsiveDisplayAdAccentColor, MultiAssetResponsiveDisplayAdBusinessName, MultiAssetResponsiveDisplayAdCallToActionText, MultiAssetResponsiveDisplayAdDescriptions, MultiAssetResponsiveDisplayAdDynamicSettingsPricePrefix, MultiAssetResponsiveDisplayAdDynamicSettingsPromoText, MultiAssetResponsiveDisplayAdFormatSetting, MultiAssetResponsiveDisplayAdHeadlines, MultiAssetResponsiveDisplayAdLandscapeLogoImages, MultiAssetResponsiveDisplayAdLogoImages, MultiAssetResponsiveDisplayAdLongHeadline, MultiAssetResponsiveDisplayAdMainColor, MultiAssetResponsiveDisplayAdMarketingImages, MultiAssetResponsiveDisplayAdSquareMarketingImages, MultiAssetResponsiveDisplayAdYouTubeVideos, Path1, Path2, PolicySummary, PricePrefix, PromoText, ResponsiveSearchAdDescriptions, ResponsiveSearchAdHeadlines, ResponsiveSearchAdPath1, ResponsiveSearchAdPath2, ShortHeadline, Status, SystemManagedEntitySource, UniversalAppAdDescriptions, UniversalAppAdHeadlines, UniversalAppAdHtml5MediaBundles, UniversalAppAdImages, UniversalAppAdMandatoryAdText, UniversalAppAdYouTubeVideos


