USE ROLE dba;

USE SCHEMA haven_raw.google_integration;
USE ROLE haven_batch_dataload;


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_ACCOUNT definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_ACCOUNT (
	PARTITIONTIME NUMBER(38,0),
	account VARCHAR(16777216),
	status VARCHAR(16777216),
	accountTimeZone VARCHAR(16777216),
	accountCurrencyCode VARCHAR(16777216),
	agencyId VARCHAR(16777216),
	creationTimestamp NUMBER(38,0),
	lastModifiedTimestamp NUMBER(38,0),
	accountType VARCHAR(16777216),
	advertiserId VARCHAR(16777216),
	accountEngineId VARCHAR(16777216),
	accountId VARCHAR(16777216)
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_ACCOUNTDEVICESTATS definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_ACCOUNTDEVICESTATS_STAGE (
	PARTITIONTIME date,
	accountEngineId VARCHAR(16777216),
	accountId VARCHAR(16777216),
	adWordsConversionValue FLOAT,
	adWordsConversions FLOAT,
	adWordsViewThroughConversions NUMBER(38,0),
	advertiserId VARCHAR(16777216),
	agencyId VARCHAR(16777216),
	avgCpc FLOAT,
	avgCpm FLOAT,
	avgPos FLOAT,
	clicks NUMBER(38,0),
	cost FLOAT,
	ctr FLOAT,
	date date,
	deviceSegment VARCHAR(16777216),
	impr NUMBER(38,0),
	visits NUMBER(38,0)
);
accountEngineId, accountId, adWordsConversionValue, adWordsConversions, adWordsViewThroughConversions, advertiserId, agencyId, avgCpc, avgCpm, avgPos, clicks, cost, 
ctr, date, deviceSegment, impr, visits

-- HAVEN_RAW.GOOGLE_INTEGRATION.P_ACCOUNTFLOODLIGHTANDDEVICESTATS definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_ACCOUNTFLOODLIGHTANDDEVICESTATS (
	date NUMBER(38,0),
	agencyId VARCHAR(16777216),
	floodlightGroupId VARCHAR(16777216),
	dfaWeightedActions FLOAT,
	floodlightActivityId VARCHAR(16777216),
	dfaRevenue FLOAT,
	dfaTransactions NUMBER(38,0),
	accountId VARCHAR(16777216),
	advertiserId VARCHAR(16777216),
	deviceSegment VARCHAR(16777216),
	dfaActions NUMBER(38,0),
	PARTITIONTIME NUMBER(38,0),
	accountEngineId VARCHAR(16777216)
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_ACCOUNTSTATS definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_ACCOUNTSTATS (
	accountId VARCHAR(16777216),
	advertiserId VARCHAR(16777216),
	displayImpressionShare VARCHAR(16777216),
	topOfPageBidAvg FLOAT,
	displayBudgetLostImpressionShare VARCHAR(16777216),
	displayRankLostImpressionShare VARCHAR(16777216),
	qualityScoreAvg FLOAT,
	searchBudgetLostImpressionShare VARCHAR(16777216),
	searchImpressionShare VARCHAR(16777216),
	searchRankLostImpressionShare VARCHAR(16777216),
	agencyId VARCHAR(16777216),
	date NUMBER(38,0),
	PARTITIONTIME NUMBER(38,0),
	accountEngineId VARCHAR(16777216)
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_AD definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_AD (
	PARTITIONTIME NUMBER(38,0),
	creationTimestamp NUMBER(38,0),
	effectiveLabels VARCHAR(16777216),
	adType VARCHAR(16777216),
	agencyId VARCHAR(16777216),
	isUnattributedAd BOOLEAN,
	campaignId VARCHAR(16777216),
	engineStatus VARCHAR(16777216),
	accountId VARCHAR(16777216),
	ad VARCHAR(16777216),
	adPromotionLine VARCHAR(16777216),
	adGroupId VARCHAR(16777216),
	adHeadline VARCHAR(16777216),
	advertiserId VARCHAR(16777216),
	adEngineId VARCHAR(16777216),
	adDescription1 VARCHAR(16777216),
	adDescription2 VARCHAR(16777216),
	adId VARCHAR(16777216),
	adHeadline2 VARCHAR(16777216),
	adLandingPage VARCHAR(16777216),
	lastModifiedTimestamp NUMBER(38,0),
	status VARCHAR(16777216),
	adDisplayUrl VARCHAR(16777216),
	adLabels VARCHAR(16777216)
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_ADDEVICESTATS definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_ADDEVICESTATS (
	adWordsConversions FLOAT,
	PARTITIONTIME NUMBER(38,0),
	accountId VARCHAR(16777216),
	adEngineId VARCHAR(16777216),
	avgCpm FLOAT,
	avgPos FLOAT,
	campaignId VARCHAR(16777216),
	adWordsViewThroughConversions NUMBER(38,0),
	advertiserId VARCHAR(16777216),
	agencyId VARCHAR(16777216),
	avgCpc FLOAT,
	impr NUMBER(38,0),
	visits NUMBER(38,0),
	adGroupId VARCHAR(16777216),
	adId VARCHAR(16777216),
	adWordsConversionValue FLOAT,
	cost FLOAT,
	ctr FLOAT,
	date NUMBER(38,0),
	deviceSegment VARCHAR(16777216),
	clicks NUMBER(38,0)
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_ADFLOODLIGHTANDDEVICESTATS definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_ADFLOODLIGHTANDDEVICESTATS (
	adEngineId VARCHAR(16777216),
	advertiserId VARCHAR(16777216),
	accountId VARCHAR(16777216),
	campaignId VARCHAR(16777216),
	floodlightActivityId VARCHAR(16777216),
	adId VARCHAR(16777216),
	deviceSegment VARCHAR(16777216),
	PARTITIONTIME NUMBER(38,0),
	date NUMBER(38,0),
	floodlightGroupId VARCHAR(16777216),
	dfaRevenue FLOAT,
	dfaWeightedActions FLOAT,
	dfaActions NUMBER(38,0),
	dfaTransactions NUMBER(38,0),
	adGroupId VARCHAR(16777216),
	agencyId VARCHAR(16777216)
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_ADGROUP definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_ADGROUP (
	adGroup VARCHAR(16777216),
	adGroupBroadMaxCpc FLOAT,
	PARTITIONTIME NUMBER(38,0),
	accountId VARCHAR(16777216),
	adGroupLabels VARCHAR(16777216),
	adGroupMobileBidAdjustment FLOAT,
	provinceTargets VARCHAR(16777216),
	adGroupContentMaxCpc FLOAT,
	bidStrategyInherited BOOLEAN,
	bingAdsAdDistributions VARCHAR(16777216),
	engineStatus VARCHAR(16777216),
	lastModifiedTimestamp NUMBER(38,0),
	adGroupSearchMaxCpc FLOAT,
	adGroupStartDate NUMBER(38,0),
	engineRemarketingListTargetAll BOOLEAN,
	advertiserId VARCHAR(16777216),
	cityTargets VARCHAR(16777216),
	metroTargets VARCHAR(16777216),
	adGroupExactMaxCpc FLOAT,
	bingAdsLanguage VARCHAR(16777216),
	effectiveCountryTargets VARCHAR(16777216),
	adGroupEndDate NUMBER(38,0),
	adGroupEngineId VARCHAR(16777216),
	effectiveBidStrategyId VARCHAR(16777216),
	effectiveDeviceTargets VARCHAR(16777216),
	effectiveLabels VARCHAR(16777216),
	agencyId VARCHAR(16777216),
	effectiveCityTargets VARCHAR(16777216),
	effectiveMetroTargets VARCHAR(16777216),
	effectiveProvinceTargets VARCHAR(16777216),
	adGroupId VARCHAR(16777216),
	adGroupPhraseMaxCpc FLOAT,
	campaignId VARCHAR(16777216),
	status VARCHAR(16777216),
	countryTargets VARCHAR(16777216),
	creationTimestamp NUMBER(38,0),
	deviceTargets VARCHAR(16777216)
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_ADGROUPDEVICESTATS definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_ADGROUPDEVICESTATS (
	adWordsConversionValue FLOAT,
	accountId VARCHAR(16777216),
	campaignId VARCHAR(16777216),
	PARTITIONTIME NUMBER(38,0),
	adGroupId VARCHAR(16777216),
	visits NUMBER(38,0),
	impr NUMBER(38,0),
	avgCpm FLOAT,
	avgPos FLOAT,
	effectiveBidStrategyId VARCHAR(16777216),
	avgCpc FLOAT,
	deviceSegment VARCHAR(16777216),
	adWordsViewThroughConversions NUMBER(38,0),
	adWordsConversions FLOAT,
	agencyId VARCHAR(16777216),
	ctr FLOAT,
	date NUMBER(38,0),
	adGroupEngineId VARCHAR(16777216),
	advertiserId VARCHAR(16777216),
	clicks NUMBER(38,0),
	cost FLOAT
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_ADGROUPFEEDITEMSTATS definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_ADGROUPFEEDITEMSTATS (
	adGroupId VARCHAR(16777216),
	accountId VARCHAR(16777216),
	adWordsConversions FLOAT,
	adWordsViewThroughConversions NUMBER(38,0),
	avgCpm FLOAT,
	clicksWithFeedItemShowing NUMBER(38,0),
	PARTITIONTIME NUMBER(38,0),
	campaignId VARCHAR(16777216),
	impr NUMBER(38,0),
	advertiserId VARCHAR(16777216),
	clicks NUMBER(38,0),
	adWordsConversionValue FLOAT,
	feedItemId VARCHAR(16777216),
	avgPos FLOAT,
	cost FLOAT,
	feedId VARCHAR(16777216),
	ctr FLOAT,
	feedType VARCHAR(16777216),
	avgCpc FLOAT,
	date NUMBER(38,0),
	visits NUMBER(38,0),
	adGroupEngineId VARCHAR(16777216),
	agencyId VARCHAR(16777216),
	costWithFeedItemShowing FLOAT,
	effectiveBidStrategyId VARCHAR(16777216)
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_ADGROUPFLOODLIGHTANDDEVICESTATS definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_ADGROUPFLOODLIGHTANDDEVICESTATS (
	PARTITIONTIME NUMBER(38,0),
	deviceSegment VARCHAR(16777216),
	advertiserId VARCHAR(16777216),
	adGroupEngineId VARCHAR(16777216),
	dfaActions NUMBER(38,0),
	adGroupId VARCHAR(16777216),
	date NUMBER(38,0),
	dfaTransactions NUMBER(38,0),
	floodlightActivityId VARCHAR(16777216),
	floodlightGroupId VARCHAR(16777216),
	campaignId VARCHAR(16777216),
	effectiveBidStrategyId VARCHAR(16777216),
	accountId VARCHAR(16777216),
	agencyId VARCHAR(16777216),
	dfaRevenue FLOAT,
	dfaWeightedActions FLOAT
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_ADGROUPFLOODLIGHTANDFEEDITEMSTATS definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_ADGROUPFLOODLIGHTANDFEEDITEMSTATS (
	PARTITIONTIME NUMBER(38,0),
	accountId VARCHAR(16777216),
	dfaTransactions NUMBER(38,0),
	floodlightActivityId VARCHAR(16777216),
	feedType VARCHAR(16777216),
	agencyId VARCHAR(16777216),
	dfaRevenue FLOAT,
	feedItemId VARCHAR(16777216),
	dfaWeightedActions FLOAT,
	date NUMBER(38,0),
	advertiserId VARCHAR(16777216),
	dfaActions NUMBER(38,0),
	effectiveBidStrategyId VARCHAR(16777216),
	adGroupEngineId VARCHAR(16777216),
	adGroupId VARCHAR(16777216),
	campaignId VARCHAR(16777216),
	feedId VARCHAR(16777216),
	floodlightGroupId VARCHAR(16777216)
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_ADGROUPSTATS definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_ADGROUPSTATS (
	adGroupId VARCHAR(16777216),
	displayRankLostImpressionShare VARCHAR(16777216),
	advertiserId VARCHAR(16777216),
	topOfPageBidAvg FLOAT,
	date NUMBER(38,0),
	effectiveBidStrategyId VARCHAR(16777216),
	PARTITIONTIME NUMBER(38,0),
	qualityScoreAvg FLOAT,
	searchRankLostImpressionShare VARCHAR(16777216),
	accountId VARCHAR(16777216),
	agencyId VARCHAR(16777216),
	displayImpressionShare VARCHAR(16777216),
	searchImpressionShare VARCHAR(16777216),
	adGroupEngineId VARCHAR(16777216),
	campaignId VARCHAR(16777216)
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_ADGROUPTARGET definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_ADGROUPTARGET (
	PARTITIONTIME NUMBER(38,0),
	accountType VARCHAR(16777216),
	adGroupStatus VARCHAR(16777216),
	adGroupId VARCHAR(16777216),
	account VARCHAR(16777216),
	accountId VARCHAR(16777216),
	dynamicSearchAdsTargetConditions VARCHAR(16777216),
	engineRemarketingListBidModifier FLOAT,
	engineRemarketingList VARCHAR(16777216),
	status VARCHAR(16777216),
	creationTimestamp NUMBER(38,0),
	locationTargetBidModifier FLOAT,
	campaignStatus VARCHAR(16777216),
	advertiserId VARCHAR(16777216),
	campaign VARCHAR(16777216),
	ageTargetBidModifier FLOAT,
	lastModifiedTimestamp NUMBER(38,0),
	adGroupTargetId VARCHAR(16777216),
	advertiser VARCHAR(16777216),
	campaignId VARCHAR(16777216),
	locationTargetName VARCHAR(16777216),
	ageTargetAgeRange VARCHAR(16777216),
	dynamicSearchAdsTargetCoverage FLOAT,
	agencyId VARCHAR(16777216),
	dynamicSearchAdsTargetCpcBid FLOAT,
	dynamicSearchAdsTargetLandingPageUrl VARCHAR(16777216),
	genderTargetBidModifier FLOAT,
	genderTargetGenderType VARCHAR(16777216),
	adGroup VARCHAR(16777216),
	agency VARCHAR(16777216)
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_ADGROUPTARGETDEVICESTATS definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_ADGROUPTARGETDEVICESTATS (
	adGroupTargetId VARCHAR(16777216),
	adWordsConversions FLOAT,
	cost FLOAT,
	dynamicSearchAdsTargetCoverage FLOAT,
	date NUMBER(38,0),
	locationTargetBidModifier FLOAT,
	engineRemarketingList VARCHAR(16777216),
	ageTargetAgeRange VARCHAR(16777216),
	accountId VARCHAR(16777216),
	adWordsViewThroughConversions NUMBER(38,0),
	avgCpm FLOAT,
	adGroupId VARCHAR(16777216),
	adWordsConversionValue FLOAT,
	deviceSegment VARCHAR(16777216),
	avgCpc FLOAT,
	avgPos FLOAT,
	genderTargetBidModifier FLOAT,
	PARTITIONTIME NUMBER(38,0),
	dynamicSearchAdsTargetCpcBid FLOAT,
	impr NUMBER(38,0),
	clicks NUMBER(38,0),
	locationTargetName VARCHAR(16777216),
	ctr FLOAT,
	visits NUMBER(38,0),
	campaignId VARCHAR(16777216),
	agencyId VARCHAR(16777216),
	dynamicSearchAdsTargetConditions VARCHAR(16777216),
	engineRemarketingListBidModifier FLOAT,
	advertiserId VARCHAR(16777216),
	ageTargetBidModifier FLOAT,
	dynamicSearchAdsTargetLandingPageUrl VARCHAR(16777216),
	genderTargetGenderType VARCHAR(16777216)
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_ADGROUPTARGETFLOODLIGHTANDDEVICESTATS definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_ADGROUPTARGETFLOODLIGHTANDDEVICESTATS (
	PARTITIONTIME NUMBER(38,0),
	adGroupId VARCHAR(16777216),
	accountId VARCHAR(16777216),
	ageTargetBidModifier FLOAT,
	dynamicSearchAdsTargetCoverage FLOAT,
	floodlightGroupId VARCHAR(16777216),
	ageTargetAgeRange VARCHAR(16777216),
	floodlightActivityId VARCHAR(16777216),
	agencyId VARCHAR(16777216),
	locationTargetBidModifier FLOAT,
	dfaRevenue FLOAT,
	campaignId VARCHAR(16777216),
	date NUMBER(38,0),
	dfaActions NUMBER(38,0),
	deviceSegment VARCHAR(16777216),
	locationTargetName VARCHAR(16777216),
	dynamicSearchAdsTargetCpcBid FLOAT,
	dynamicSearchAdsTargetLandingPageUrl VARCHAR(16777216),
	engineRemarketingList VARCHAR(16777216),
	engineRemarketingListBidModifier FLOAT,
	genderTargetBidModifier FLOAT,
	genderTargetGenderType VARCHAR(16777216),
	adGroupTargetId VARCHAR(16777216),
	advertiserId VARCHAR(16777216),
	dfaTransactions NUMBER(38,0),
	dfaWeightedActions FLOAT,
	dynamicSearchAdsTargetConditions VARCHAR(16777216)
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_ADVERTISER definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_ADVERTISER (
	PARTITIONTIME NUMBER(38,0),
	agency VARCHAR(16777216),
	advertiserId VARCHAR(16777216),
	dfaNetworkId VARCHAR(16777216),
	lastModifiedTimestamp NUMBER(38,0),
	dfaAdvertiserId VARCHAR(16777216),
	dfaNetworkTimeZone VARCHAR(16777216),
	advertiser VARCHAR(16777216),
	advertiserCurrencyCode VARCHAR(16777216),
	agencyId VARCHAR(16777216),
	creationTimestamp NUMBER(38,0),
	status VARCHAR(16777216)
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_ADVERTISERDEVICESTATS definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_ADVERTISERDEVICESTATS (
	adWordsConversions FLOAT,
	advertiserId VARCHAR(16777216),
	adWordsViewThroughConversions NUMBER(38,0),
	impr NUMBER(38,0),
	deviceSegment VARCHAR(16777216),
	ctr FLOAT,
	agencyId VARCHAR(16777216),
	visits NUMBER(38,0),
	date NUMBER(38,0),
	avgPos FLOAT,
	PARTITIONTIME NUMBER(38,0),
	avgCpm FLOAT,
	dfaAdvertiserId VARCHAR(16777216),
	dfaNetworkId VARCHAR(16777216),
	adWordsConversionValue FLOAT,
	avgCpc FLOAT,
	clicks NUMBER(38,0),
	cost FLOAT
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_ADVERTISERFLOODLIGHTANDDEVICESTATS definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_ADVERTISERFLOODLIGHTANDDEVICESTATS (
	agencyId VARCHAR(16777216),
	advertiserId VARCHAR(16777216),
	dfaTransactions NUMBER(38,0),
	floodlightGroupId VARCHAR(16777216),
	dfaActions NUMBER(38,0),
	dfaRevenue FLOAT,
	dfaWeightedActions FLOAT,
	PARTITIONTIME NUMBER(38,0),
	deviceSegment VARCHAR(16777216),
	dfaNetworkId VARCHAR(16777216),
	floodlightActivityId VARCHAR(16777216),
	date NUMBER(38,0),
	dfaAdvertiserId VARCHAR(16777216)
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_ADVERTISERSTATS definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_ADVERTISERSTATS (
	advertiserId VARCHAR(16777216),
	qualityScoreAvg FLOAT,
	searchBudgetLostImpressionShare VARCHAR(16777216),
	agencyId VARCHAR(16777216),
	dfaAdvertiserId VARCHAR(16777216),
	searchRankLostImpressionShare VARCHAR(16777216),
	PARTITIONTIME NUMBER(38,0),
	dfaNetworkId VARCHAR(16777216),
	searchImpressionShare VARCHAR(16777216),
	date NUMBER(38,0),
	displayBudgetLostImpressionShare VARCHAR(16777216),
	displayImpressionShare VARCHAR(16777216),
	displayRankLostImpressionShare VARCHAR(16777216),
	topOfPageBidAvg FLOAT
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_BIDSTRATEGY definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_BIDSTRATEGY (
	agencyId VARCHAR(16777216),
	bidStrategyMaxBid FLOAT,
	advertiserId VARCHAR(16777216),
	creationTimestamp NUMBER(38,0),
	highPosition FLOAT,
	lowPosition FLOAT,
	roasTarget FLOAT,
	lastModifiedTimestamp NUMBER(38,0),
	ersTarget FLOAT,
	status VARCHAR(16777216),
	PARTITIONTIME NUMBER(38,0),
	bidStrategyGoal VARCHAR(16777216),
	bidStrategyId VARCHAR(16777216),
	monthlySpendTarget FLOAT,
	bidStrategy VARCHAR(16777216),
	bidStrategyMinBid FLOAT,
	cpaTarget FLOAT,
	floodlightActivityTargetIds VARCHAR(16777216),
	floodlightOptimizationEnabled BOOLEAN
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_BIDSTRATEGYSTATS definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_BIDSTRATEGYSTATS (
	PARTITIONTIME NUMBER(38,0),
	adWordsConversions FLOAT,
	adWordsConversionValue FLOAT,
	avgCpc FLOAT,
	dfaActions NUMBER(38,0),
	dfaRevenue FLOAT,
	ctr FLOAT,
	impr NUMBER(38,0),
	date NUMBER(38,0),
	avgCpm FLOAT,
	avgPos FLOAT,
	visits NUMBER(38,0),
	agencyId VARCHAR(16777216),
	clicks NUMBER(38,0),
	cost FLOAT,
	dfaTransactions NUMBER(38,0),
	dfaWeightedActions FLOAT,
	adWordsViewThroughConversions NUMBER(38,0),
	advertiserId VARCHAR(16777216),
	bidStrategyId VARCHAR(16777216)
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_CAMPAIGN definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_CAMPAIGN (
	languageTargets VARCHAR(16777216),
	PARTITIONTIME NUMBER(38,0),
	accountId VARCHAR(16777216),
	bingAdsBudgetType VARCHAR(16777216),
	adRotation VARCHAR(16777216),
	campaign VARCHAR(16777216),
	campaignEndDate NUMBER(38,0),
	excludedMetroTargets VARCHAR(16777216),
	bidStrategyInherited BOOLEAN,
	campaignStartDate NUMBER(38,0),
	cityTargets VARCHAR(16777216),
	countryTargets VARCHAR(16777216),
	campaignEngineId VARCHAR(16777216),
	campaignType VARCHAR(16777216),
	campaignMobileBidAdjustment FLOAT,
	lastModifiedTimestamp NUMBER(38,0),
	metroTargets VARCHAR(16777216),
	dailyBudget FLOAT,
	excludedProvinceTargets VARCHAR(16777216),
	keywordNearMatchEnabled VARCHAR(16777216),
	campaignId VARCHAR(16777216),
	campaignLabels VARCHAR(16777216),
	provinceTargets VARCHAR(16777216),
	status VARCHAR(16777216),
	monthlyBudget FLOAT,
	networkTarget VARCHAR(16777216),
	agencyId VARCHAR(16777216),
	deliveryMethod VARCHAR(16777216),
	deviceTargets VARCHAR(16777216),
	yahooGeoTargets VARCHAR(16777216),
	yahooJapanBidStrategy VARCHAR(16777216),
	adWordsBidStrategy VARCHAR(16777216),
	advertiserId VARCHAR(16777216),
	creationTimestamp NUMBER(38,0),
	effectiveCountryTargets VARCHAR(16777216),
	excludedCountryTargets VARCHAR(16777216),
	effectiveDeviceTargets VARCHAR(16777216),
	effectiveLabels VARCHAR(16777216),
	effectiveBidStrategyId VARCHAR(16777216),
	effectiveCityTargets VARCHAR(16777216),
	effectiveMetroTargets VARCHAR(16777216),
	effectiveProvinceTargets VARCHAR(16777216),
	engineStatus VARCHAR(16777216),
	excludedCityTargets VARCHAR(16777216)
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_CAMPAIGNDEVICESTATS definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_CAMPAIGNDEVICESTATS (
	adWordsConversionValue FLOAT,
	campaignEngineId VARCHAR(16777216),
	campaignId VARCHAR(16777216),
	PARTITIONTIME NUMBER(38,0),
	date NUMBER(38,0),
	advertiserId VARCHAR(16777216),
	agencyId VARCHAR(16777216),
	deviceSegment VARCHAR(16777216),
	avgCpc FLOAT,
	impr NUMBER(38,0),
	adWordsConversions FLOAT,
	effectiveBidStrategyId VARCHAR(16777216),
	accountId VARCHAR(16777216),
	clicks NUMBER(38,0),
	cost FLOAT,
	ctr FLOAT,
	visits NUMBER(38,0),
	adWordsViewThroughConversions NUMBER(38,0),
	avgCpm FLOAT,
	avgPos FLOAT
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_CAMPAIGNFEEDITEMSTATS definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_CAMPAIGNFEEDITEMSTATS (
	adWordsViewThroughConversions NUMBER(38,0),
	adWordsConversionValue FLOAT,
	advertiserId VARCHAR(16777216),
	impr NUMBER(38,0),
	cost FLOAT,
	costWithFeedItemShowing FLOAT,
	accountId VARCHAR(16777216),
	clicks NUMBER(38,0),
	clicksWithFeedItemShowing NUMBER(38,0),
	campaignEngineId VARCHAR(16777216),
	visits NUMBER(38,0),
	avgPos FLOAT,
	agencyId VARCHAR(16777216),
	avgCpm FLOAT,
	feedItemId VARCHAR(16777216),
	adWordsConversions FLOAT,
	avgCpc FLOAT,
	feedId VARCHAR(16777216),
	feedType VARCHAR(16777216),
	effectiveBidStrategyId VARCHAR(16777216),
	PARTITIONTIME NUMBER(38,0),
	campaignId VARCHAR(16777216),
	ctr FLOAT,
	date NUMBER(38,0)
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_CAMPAIGNFLOODLIGHTANDDEVICESTATS definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_CAMPAIGNFLOODLIGHTANDDEVICESTATS (
	advertiserId VARCHAR(16777216),
	effectiveBidStrategyId VARCHAR(16777216),
	floodlightActivityId VARCHAR(16777216),
	date NUMBER(38,0),
	campaignId VARCHAR(16777216),
	dfaTransactions NUMBER(38,0),
	PARTITIONTIME NUMBER(38,0),
	dfaRevenue FLOAT,
	accountId VARCHAR(16777216),
	campaignEngineId VARCHAR(16777216),
	dfaWeightedActions FLOAT,
	agencyId VARCHAR(16777216),
	deviceSegment VARCHAR(16777216),
	dfaActions NUMBER(38,0),
	floodlightGroupId VARCHAR(16777216)
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_CAMPAIGNFLOODLIGHTANDFEEDITEMSTATS definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_CAMPAIGNFLOODLIGHTANDFEEDITEMSTATS (
	campaignId VARCHAR(16777216),
	dfaRevenue FLOAT,
	floodlightGroupId VARCHAR(16777216),
	campaignEngineId VARCHAR(16777216),
	dfaTransactions NUMBER(38,0),
	PARTITIONTIME NUMBER(38,0),
	dfaActions NUMBER(38,0),
	feedId VARCHAR(16777216),
	feedType VARCHAR(16777216),
	accountId VARCHAR(16777216),
	dfaWeightedActions FLOAT,
	feedItemId VARCHAR(16777216),
	agencyId VARCHAR(16777216),
	date NUMBER(38,0),
	effectiveBidStrategyId VARCHAR(16777216),
	floodlightActivityId VARCHAR(16777216),
	advertiserId VARCHAR(16777216)
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_CAMPAIGNFLOODTLIGHTANDDEVICESTATS definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_CAMPAIGNFLOODTLIGHTANDDEVICESTATS (
	agencyId VARCHAR(16777216),
	deviceSegment VARCHAR(16777216),
	effectiveBidStrategyId VARCHAR(16777216),
	accountId VARCHAR(16777216),
	campaignId VARCHAR(16777216),
	dfaRevenue FLOAT,
	floodlightGroupId VARCHAR(16777216),
	PARTITIONTIME NUMBER(38,0),
	campaignEngineId VARCHAR(16777216),
	dfaActions NUMBER(38,0),
	dfaWeightedActions FLOAT,
	advertiserId VARCHAR(16777216),
	date NUMBER(38,0),
	dfaTransactions NUMBER(38,0),
	floodlightActivityId VARCHAR(16777216)
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_CAMPAIGNSTATS definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_CAMPAIGNSTATS (
	PARTITIONTIME NUMBER(38,0),
	avgCpm FLOAT,
	avgCpc FLOAT,
	visits NUMBER(38,0),
	displayRankLostImpressionShare VARCHAR(16777216),
	ctr FLOAT,
	searchRankLostImpressionShare VARCHAR(16777216),
	adWordsConversions FLOAT,
	campaignId VARCHAR(16777216),
	date NUMBER(38,0),
	advertiserId VARCHAR(16777216),
	agencyId VARCHAR(16777216),
	effectiveBidStrategyId VARCHAR(16777216),
	topOfPageBidAvg FLOAT,
	adWordsConversionValue FLOAT,
	impr NUMBER(38,0),
	accountId VARCHAR(16777216),
	displayBudgetLostImpressionShare VARCHAR(16777216),
	qualityScoreAvg FLOAT,
	avgPos FLOAT,
	campaignEngineId VARCHAR(16777216),
	searchBudgetLostImpressionShare VARCHAR(16777216),
	searchImpressionShare VARCHAR(16777216),
	adWordsViewThroughConversions NUMBER(38,0),
	clicks NUMBER(38,0),
	cost FLOAT,
	displayImpressionShare VARCHAR(16777216)
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_CAMPAIGNTARGET definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_CAMPAIGNTARGET (
	PARTITIONTIME NUMBER(38,0),
	status VARCHAR(16777216),
	accountId VARCHAR(16777216),
	campaignId VARCHAR(16777216),
	locationTargetBidModifier FLOAT,
	agencyId VARCHAR(16777216),
	lastModifiedTimestamp NUMBER(38,0),
	creationTimestamp NUMBER(38,0),
	engineRemarketingListBidModifier FLOAT,
	locationTargetName VARCHAR(16777216),
	advertiserId VARCHAR(16777216),
	campaignTargetId VARCHAR(16777216),
	engineRemarketingList VARCHAR(16777216)
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_CAMPAIGNTARGETDEVICESTATS definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_CAMPAIGNTARGETDEVICESTATS (
	PARTITIONTIME NUMBER(38,0),
	accountId VARCHAR(16777216),
	deviceSegment VARCHAR(16777216),
	advertiserId VARCHAR(16777216),
	avgCpm FLOAT,
	agencyId VARCHAR(16777216),
	ctr FLOAT,
	avgCpc FLOAT,
	clicks NUMBER(38,0),
	campaignId VARCHAR(16777216),
	impr NUMBER(38,0),
	adWordsConversionValue FLOAT,
	campaignTargetId VARCHAR(16777216),
	visits NUMBER(38,0),
	adWordsViewThroughConversions NUMBER(38,0),
	cost FLOAT,
	date NUMBER(38,0),
	adWordsConversions FLOAT,
	avgPos FLOAT
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_CAMPAIGNTARGETFLOODLIGHTANDDEVICESTATS definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_CAMPAIGNTARGETFLOODLIGHTANDDEVICESTATS (
	agencyId VARCHAR(16777216),
	dfaTransactions NUMBER(38,0),
	dfaRevenue FLOAT,
	dfaActions NUMBER(38,0),
	dfaWeightedActions FLOAT,
	accountId VARCHAR(16777216),
	campaignTargetId VARCHAR(16777216),
	floodlightActivityId VARCHAR(16777216),
	advertiserId VARCHAR(16777216),
	date NUMBER(38,0),
	floodlightGroupId VARCHAR(16777216),
	PARTITIONTIME NUMBER(38,0),
	campaignId VARCHAR(16777216),
	deviceSegment VARCHAR(16777216)
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_CONVERSION definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_CONVERSION (
	PARTITIONTIME NUMBER(38,0),
	agencyId VARCHAR(16777216),
	accountType VARCHAR(16777216),
	account VARCHAR(16777216),
	accountId VARCHAR(16777216),
	campaignId VARCHAR(16777216),
	conversionAttributionType VARCHAR(16777216),
	feedId VARCHAR(16777216),
	productCountry VARCHAR(16777216),
	status VARCHAR(16777216),
	productLanguage VARCHAR(16777216),
	conversionId VARCHAR(16777216),
	floodlightActivity VARCHAR(16777216),
	floodlightActivityId VARCHAR(16777216),
	conversionVisitId VARCHAR(16777216),
	advertiserConversionId VARCHAR(16777216),
	conversionDate NUMBER(38,0),
	keywordId VARCHAR(16777216),
	productChannel VARCHAR(16777216),
	floodlightEventRequestString VARCHAR(16777216),
	conversionLastModifiedTimestamp NUMBER(38,0),
	conversionQuantity FLOAT,
	conversionRevenue FLOAT,
	conversionSearchTerm VARCHAR(16777216),
	floodlightActivityTag VARCHAR(16777216),
	floodlightOrderId VARCHAR(16777216),
	floodlightOriginalRevenue FLOAT,
	floodlightGroupId VARCHAR(16777216),
	floodlightGroupTag VARCHAR(16777216),
	conversionTimestamp NUMBER(38,0),
	floodlightReferrer VARCHAR(16777216),
	inventoryAccountId VARCHAR(16777216),
	adGroupId VARCHAR(16777216),
	adId VARCHAR(16777216),
	advertiser VARCHAR(16777216),
	conversionType VARCHAR(16777216),
	conversionVisitExternalClickId VARCHAR(16777216),
	feedItemId VARCHAR(16777216),
	feedType VARCHAR(16777216),
	productGroupId VARCHAR(16777216),
	productId VARCHAR(16777216),
	advertiserId VARCHAR(16777216),
	agency VARCHAR(16777216),
	conversionVisitTimestamp NUMBER(38,0),
	deviceSegment VARCHAR(16777216),
	floodlightGroup VARCHAR(16777216),
	floodlightGroupConversionType VARCHAR(16777216),
	productStoreId VARCHAR(16777216),
	productTargetId VARCHAR(16777216)
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_FEEDITEM definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_FEEDITEM (
	PARTITIONTIME NUMBER(38,0),
	locationCategory VARCHAR(16777216),
	status VARCHAR(16777216),
	feedId VARCHAR(16777216),
	locationDetails VARCHAR(16777216),
	sitelinkDescription2 VARCHAR(16777216),
	agencyId VARCHAR(16777216),
	feedItemId VARCHAR(16777216),
	sitelinkDescription1 VARCHAR(16777216),
	creationTimestamp NUMBER(38,0),
	sitelinkDisplayText VARCHAR(16777216),
	accountId VARCHAR(16777216),
	lastModifiedTimestamp NUMBER(38,0),
	locationBusinessName VARCHAR(16777216),
	engineStatus VARCHAR(16777216),
	sitelinkClickserverUrl VARCHAR(16777216),
	sitelinkLandingPageUrl VARCHAR(16777216),
	advertiserId VARCHAR(16777216)
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_FEEDITEMFLOODLIGHTSTATS definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_FEEDITEMFLOODLIGHTSTATS (
	accountId VARCHAR(16777216),
	dfaRevenue FLOAT,
	dfaActions NUMBER(38,0),
	dfaWeightedActions FLOAT,
	advertiserId VARCHAR(16777216),
	floodlightActivityId VARCHAR(16777216),
	PARTITIONTIME NUMBER(38,0),
	feedId VARCHAR(16777216),
	floodlightGroupId VARCHAR(16777216),
	agencyId VARCHAR(16777216),
	date NUMBER(38,0),
	dfaTransactions NUMBER(38,0),
	feedItemId VARCHAR(16777216)
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_FEEDITEMSTATS definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_FEEDITEMSTATS (
	adWordsConversionValue FLOAT,
	avgPos FLOAT,
	feedId VARCHAR(16777216),
	adWordsViewThroughConversions NUMBER(38,0),
	costWithFeedItemShowing FLOAT,
	PARTITIONTIME NUMBER(38,0),
	advertiserId VARCHAR(16777216),
	avgCpc FLOAT,
	ctr FLOAT,
	avgCpm FLOAT,
	feedItemId VARCHAR(16777216),
	date NUMBER(38,0),
	agencyId VARCHAR(16777216),
	adWordsConversions FLOAT,
	dfaRevenue FLOAT,
	cost FLOAT,
	impr NUMBER(38,0),
	visits NUMBER(38,0),
	dfaTransactions NUMBER(38,0),
	dfaWeightedActions FLOAT,
	accountId VARCHAR(16777216),
	clicks NUMBER(38,0),
	clicksWithFeedItemShowing NUMBER(38,0),
	dfaActions NUMBER(38,0)
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_FLOODLIGHTACTIVITY definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_FLOODLIGHTACTIVITY (
	PARTITIONTIME NUMBER(38,0),
	lastModifiedTimestamp NUMBER(38,0),
	agencyId VARCHAR(16777216),
	floodlightActivityId VARCHAR(16777216),
	floodlightGroupTag VARCHAR(16777216),
	advertiserId VARCHAR(16777216),
	floodlightActivityTag VARCHAR(16777216),
	floodlightConfigurationId VARCHAR(16777216),
	status VARCHAR(16777216),
	creationTimestamp NUMBER(38,0),
	floodlightActivity VARCHAR(16777216),
	floodlightGroup VARCHAR(16777216),
	floodlightGroupConversionType VARCHAR(16777216),
	floodlightGroupId VARCHAR(16777216)
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_KEYWORD definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_KEYWORD (
	PARTITIONTIME NUMBER(38,0),
	creationTimestamp NUMBER(38,0),
	lastModifiedTimestamp NUMBER(38,0),
	qualityScoreCurrent NUMBER(38,0),
	status VARCHAR(16777216),
	keywordId VARCHAR(16777216),
	effectiveBidStrategyId VARCHAR(16777216),
	isDisplayKeyword BOOLEAN,
	keywordClickserverUrl VARCHAR(16777216),
	keywordText VARCHAR(16777216),
	effectiveLabels VARCHAR(16777216),
	topOfPageBidCurrent FLOAT,
	advertiserId VARCHAR(16777216),
	engineStatus VARCHAR(16777216),
	keywordEngineId VARCHAR(16777216),
	agencyId VARCHAR(16777216),
	keywordLabels VARCHAR(16777216),
	keywordLandingPage VARCHAR(16777216),
	keywordUrlParams VARCHAR(16777216),
	bingKeywordParam2 VARCHAR(16777216),
	accountId VARCHAR(16777216),
	adGroupId VARCHAR(16777216),
	bingKeywordParam3 VARCHAR(16777216),
	campaignId VARCHAR(16777216),
	keywordMatchType VARCHAR(16777216),
	keywordMaxBid FLOAT,
	keywordMaxCpc FLOAT,
	keywordMinBid FLOAT,
	bidStrategyInherited BOOLEAN,
	effectiveKeywordMaxCpc FLOAT
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_KEYWORDDEVICESTATS definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_KEYWORDDEVICESTATS (
	adGroupId VARCHAR(16777216),
	adWordsConversionValue FLOAT,
	deviceSegment VARCHAR(16777216),
	avgPos FLOAT,
	campaignId VARCHAR(16777216),
	avgCpm FLOAT,
	effectiveBidStrategyId VARCHAR(16777216),
	agencyId VARCHAR(16777216),
	visits NUMBER(38,0),
	PARTITIONTIME NUMBER(38,0),
	impr NUMBER(38,0),
	adId VARCHAR(16777216),
	adWordsViewThroughConversions NUMBER(38,0),
	advertiserId VARCHAR(16777216),
	clicks NUMBER(38,0),
	cost FLOAT,
	accountId VARCHAR(16777216),
	ctr FLOAT,
	date NUMBER(38,0),
	keywordEngineId VARCHAR(16777216),
	keywordId VARCHAR(16777216),
	adWordsConversions FLOAT,
	avgCpc FLOAT
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_KEYWORDFLOODLIGHTANDDEVICESTATS definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_KEYWORDFLOODLIGHTANDDEVICESTATS (
	advertiserId VARCHAR(16777216),
	keywordId VARCHAR(16777216),
	floodlightActivityId VARCHAR(16777216),
	adId VARCHAR(16777216),
	adGroupId VARCHAR(16777216),
	PARTITIONTIME NUMBER(38,0),
	dfaRevenue FLOAT,
	dfaActions NUMBER(38,0),
	dfaTransactions NUMBER(38,0),
	campaignId VARCHAR(16777216),
	agencyId VARCHAR(16777216),
	date NUMBER(38,0),
	dfaWeightedActions FLOAT,
	floodlightGroupId VARCHAR(16777216),
	keywordEngineId VARCHAR(16777216),
	accountId VARCHAR(16777216),
	deviceSegment VARCHAR(16777216),
	effectiveBidStrategyId VARCHAR(16777216)
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_KEYWORDSTATS definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_KEYWORDSTATS (
	PARTITIONTIME NUMBER(38,0),
	keywordEngineId VARCHAR(16777216),
	campaignId VARCHAR(16777216),
	keywordId VARCHAR(16777216),
	qualityScoreAvg FLOAT,
	accountId VARCHAR(16777216),
	agencyId VARCHAR(16777216),
	effectiveBidStrategyId VARCHAR(16777216),
	topOfPageBidAvg FLOAT,
	adGroupId VARCHAR(16777216),
	advertiserId VARCHAR(16777216)
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_NEGATIVEADGROUPKEYWORD definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_NEGATIVEADGROUPKEYWORD (
	accountId VARCHAR(16777216),
	negativeAdGroupKeywordMatchType VARCHAR(16777216),
	PARTITIONTIME NUMBER(38,0),
	agencyId VARCHAR(16777216),
	lastModifiedTimestamp NUMBER(38,0),
	campaignId VARCHAR(16777216),
	negativeAdGroupKeywordId VARCHAR(16777216),
	status VARCHAR(16777216),
	advertiserId VARCHAR(16777216),
	creationTimestamp NUMBER(38,0),
	engineStatus VARCHAR(16777216),
	negativeAdGroupKeywordText VARCHAR(16777216),
	adGroupId VARCHAR(16777216)
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_NEGATIVEADGROUPTARGET definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_NEGATIVEADGROUPTARGET (
	advertiserId VARCHAR(16777216),
	adGroupId VARCHAR(16777216),
	PARTITIONTIME NUMBER(38,0),
	agencyId VARCHAR(16777216),
	campaignId VARCHAR(16777216),
	dynamicSearchAdsTargetConditions VARCHAR(16777216),
	locationTargetName VARCHAR(16777216),
	negativeAdGroupTargetId VARCHAR(16777216),
	creationTimestamp NUMBER(38,0),
	engineRemarketingList VARCHAR(16777216),
	accountId VARCHAR(16777216),
	ageTargetAgeRange VARCHAR(16777216),
	genderTargetGenderType VARCHAR(16777216),
	lastModifiedTimestamp NUMBER(38,0),
	status VARCHAR(16777216)
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_NEGATIVECAMPAIGNKEYWORD definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_NEGATIVECAMPAIGNKEYWORD (
	accountId VARCHAR(16777216),
	negativeCampaignKeywordText VARCHAR(16777216),
	negativeCampaignKeywordMatchType VARCHAR(16777216),
	negativeCampaignKeywordId VARCHAR(16777216),
	agencyId VARCHAR(16777216),
	lastModifiedTimestamp NUMBER(38,0),
	advertiserId VARCHAR(16777216),
	campaignId VARCHAR(16777216),
	engineStatus VARCHAR(16777216),
	status VARCHAR(16777216),
	PARTITIONTIME NUMBER(38,0),
	creationTimestamp NUMBER(38,0)
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_NEGATIVECAMPAIGNTARGET definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_NEGATIVECAMPAIGNTARGET (
	PARTITIONTIME NUMBER(38,0),
	accountId VARCHAR(16777216),
	advertiserId VARCHAR(16777216),
	locationTargetName VARCHAR(16777216),
	ageTargetAgeRange VARCHAR(16777216),
	negativeCampaignTargetId VARCHAR(16777216),
	status VARCHAR(16777216),
	genderTargetGenderType VARCHAR(16777216),
	lastModifiedTimestamp NUMBER(38,0),
	dynamicSearchAdsTargetConditions VARCHAR(16777216),
	engineRemarketingList VARCHAR(16777216),
	agencyId VARCHAR(16777216),
	creationTimestamp NUMBER(38,0),
	campaignId VARCHAR(16777216)
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_PRODUCTADVERTISED definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_PRODUCTADVERTISED (
	productCategoryLevel4 VARCHAR(16777216),
	productTypeLevel3 VARCHAR(16777216),
	productLanguage VARCHAR(16777216),
	agencyId VARCHAR(16777216),
	productTypeLevel2 VARCHAR(16777216),
	creationTimestamp NUMBER(38,0),
	lastModifiedTimestamp NUMBER(38,0),
	productAgeGroup VARCHAR(16777216),
	productCustomLabel4 VARCHAR(16777216),
	productGender VARCHAR(16777216),
	status VARCHAR(16777216),
	productCategoryLevel1 VARCHAR(16777216),
	productCategoryLevel5 VARCHAR(16777216),
	productMpn VARCHAR(16777216),
	productSize VARCHAR(16777216),
	productStoreId VARCHAR(16777216),
	productGtin VARCHAR(16777216),
	productId VARCHAR(16777216),
	productItemGroupId VARCHAR(16777216),
	productChannel VARCHAR(16777216),
	productChannelExclusivity VARCHAR(16777216),
	productTypeLevel4 VARCHAR(16777216),
	productTypeLevel5 VARCHAR(16777216),
	productColor VARCHAR(16777216),
	productCategoryLevel2 VARCHAR(16777216),
	productCategoryLevel3 VARCHAR(16777216),
	productBrand VARCHAR(16777216),
	productCategory VARCHAR(16777216),
	productMaterial VARCHAR(16777216),
	PARTITIONTIME NUMBER(38,0),
	advertiserId VARCHAR(16777216),
	productCondition VARCHAR(16777216),
	productCostOfGoodsSold FLOAT,
	productLandingPageUrl VARCHAR(16777216),
	productTitle VARCHAR(16777216),
	productTypeLevel1 VARCHAR(16777216),
	productCountry VARCHAR(16777216),
	productCustomLabel0 VARCHAR(16777216),
	productCustomLabel1 VARCHAR(16777216),
	productCustomLabel2 VARCHAR(16777216),
	productCustomLabel3 VARCHAR(16777216),
	productPattern VARCHAR(16777216),
	productPrice FLOAT,
	productSalePrice FLOAT,
	productAvailability VARCHAR(16777216)
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_PRODUCTADVERTISEDDEVICESTATS definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_PRODUCTADVERTISEDDEVICESTATS (
	PARTITIONTIME NUMBER(38,0),
	date NUMBER(38,0),
	ctr FLOAT,
	agencyId VARCHAR(16777216),
	advertiserId VARCHAR(16777216),
	productId VARCHAR(16777216),
	visits NUMBER(38,0),
	adWordsConversionValue FLOAT,
	avgCpc FLOAT,
	impr NUMBER(38,0),
	adWordsViewThroughConversions NUMBER(38,0),
	avgPos FLOAT,
	clicks NUMBER(38,0),
	cost FLOAT,
	deviceSegment VARCHAR(16777216),
	adWordsConversions FLOAT,
	avgCpm FLOAT
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_PRODUCTADVERTISEDFLOODLIGHTANDDEVICESTATS definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_PRODUCTADVERTISEDFLOODLIGHTANDDEVICESTATS (
	advertiserId VARCHAR(16777216),
	campaignId VARCHAR(16777216),
	dfaWeightedActions FLOAT,
	dfaRevenue FLOAT,
	productId VARCHAR(16777216),
	date NUMBER(38,0),
	accountId VARCHAR(16777216),
	dfaTransactions NUMBER(38,0),
	floodlightActivityId VARCHAR(16777216),
	adGroupId VARCHAR(16777216),
	agencyId VARCHAR(16777216),
	dfaActions NUMBER(38,0),
	floodlightGroupId VARCHAR(16777216),
	PARTITIONTIME NUMBER(38,0),
	deviceSegment VARCHAR(16777216)
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_PRODUCTGROUP definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_PRODUCTGROUP (
	advertiserId VARCHAR(16777216),
	productGroupClickserverUrl VARCHAR(16777216),
	adGroupId VARCHAR(16777216),
	productGroupMaxCpc FLOAT,
	bidStrategyInherited BOOLEAN,
	lastModifiedTimestamp NUMBER(38,0),
	effectiveBidStrategy VARCHAR(16777216),
	productGroupLandingPage VARCHAR(16777216),
	status VARCHAR(16777216),
	accountId VARCHAR(16777216),
	productGroupId VARCHAR(16777216),
	PARTITIONTIME NUMBER(38,0),
	campaignId VARCHAR(16777216),
	effectiveProductGroupMaxCpc FLOAT,
	engineStatus VARCHAR(16777216),
	productGroupMaxBid FLOAT,
	effectiveBidStrategyId VARCHAR(16777216),
	creationTimestamp NUMBER(38,0),
	productGroup VARCHAR(16777216),
	productGroupMinBid FLOAT,
	productGroupPartitionType VARCHAR(16777216),
	agencyId VARCHAR(16777216),
	effectiveLabels VARCHAR(16777216)
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_PRODUCTGROUPSTATS definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_PRODUCTGROUPSTATS (
	accountId VARCHAR(16777216),
	visits NUMBER(38,0),
	date NUMBER(38,0),
	ctr FLOAT,
	effectiveBidStrategyId VARCHAR(16777216),
	advertiserId VARCHAR(16777216),
	dfaRevenue FLOAT,
	agencyId VARCHAR(16777216),
	campaignId VARCHAR(16777216),
	avgCpc FLOAT,
	adWordsConversions FLOAT,
	adWordsViewThroughConversions NUMBER(38,0),
	adWordsConversionValue FLOAT,
	dfaActions NUMBER(38,0),
	dfaTransactions NUMBER(38,0),
	dfaWeightedActions FLOAT,
	adGroupId VARCHAR(16777216),
	clicks NUMBER(38,0),
	cost FLOAT,
	impr NUMBER(38,0),
	productGroupId VARCHAR(16777216),
	PARTITIONTIME NUMBER(38,0),
	avgCpm FLOAT,
	avgPos FLOAT
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_PRODUCTLEADANDCROSSSELLFLOODLIGHTSTATS definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_PRODUCTLEADANDCROSSSELLFLOODLIGHTSTATS (
	PARTITIONTIME NUMBER(38,0),
	agencyId VARCHAR(16777216),
	adGroupId VARCHAR(16777216),
	dfaWeightedActions FLOAT,
	campaignId VARCHAR(16777216),
	productIdSold VARCHAR(16777216),
	crossSellRevenueFromUnitsSold FLOAT,
	crossSellGrossProfitMargin FLOAT,
	productRevenueFromUnitsSold FLOAT,
	productAverageUnitPrice FLOAT,
	deviceSegment VARCHAR(16777216),
	crossSellUnitsSold FLOAT,
	floodlightActivityId VARCHAR(16777216),
	leadUnitsSold FLOAT,
	dfaActions NUMBER(38,0),
	productId VARCHAR(16777216),
	productUnitsSold FLOAT,
	advertiserId VARCHAR(16777216),
	crossSellAverageUnitPrice FLOAT,
	date NUMBER(38,0),
	dfaRevenue FLOAT,
	dfaTransactions NUMBER(38,0),
	leadCostOfGoodsSold FLOAT,
	leadGrossProfitFromUnitsSold FLOAT,
	floodlightGroupId VARCHAR(16777216),
	leadAverageUnitPrice FLOAT,
	leadGrossProfitMargin FLOAT,
	leadRevenueFromUnitsSold FLOAT,
	accountId VARCHAR(16777216),
	crossSellCostOfGoodsSold FLOAT,
	crossSellGrossFromUnitsSold FLOAT
);


-- HAVEN_RAW.GOOGLE_INTEGRATION.P_VISIT definition

create or replace TABLE HAVEN_RAW.GOOGLE_INTEGRATION.P_VISIT (
	PARTITIONTIME NUMBER(38,0),
	account VARCHAR(16777216),
	accountType VARCHAR(16777216),
	visitNetworkType VARCHAR(16777216),
	visitDate NUMBER(38,0),
	advertiser VARCHAR(16777216),
	productLanguage VARCHAR(16777216),
	campaignId VARCHAR(16777216),
	productId VARCHAR(16777216),
	productStoreId VARCHAR(16777216),
	keywordId VARCHAR(16777216),
	visitExternalClickId VARCHAR(16777216),
	feedType VARCHAR(16777216),
	feedItemId VARCHAR(16777216),
	advertiserId VARCHAR(16777216),
	deviceSegment VARCHAR(16777216),
	productTargetId VARCHAR(16777216),
	adGroupId VARCHAR(16777216),
	productChannel VARCHAR(16777216),
	visitSearchQuery VARCHAR(16777216),
	visitReferrer VARCHAR(16777216),
	agencyId VARCHAR(16777216),
	status VARCHAR(16777216),
	visitId VARCHAR(16777216),
	agency VARCHAR(16777216),
	accountId VARCHAR(16777216),
	feedId VARCHAR(16777216),
	productCountry VARCHAR(16777216),
	visitTimestamp NUMBER(38,0),
	adId VARCHAR(16777216),
	inventoryAccountId VARCHAR(16777216),
	productGroupId VARCHAR(16777216)
);