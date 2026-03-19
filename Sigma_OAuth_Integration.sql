use role accountadmin;

show integrations;

-- create security integration <enter_a_name_for_integration>
-- type = external_oauth  
-- enabled = true  
-- external_oauth_type = azure  
-- external_oauth_issuer = '<external_oauth_issuer>' 
-- external_oauth_jws_keys_url = ‘’
-- external_oauth_audience_list = (‘<application_id_uri>')  
-- external_oauth_token_user_mapping_claim = 'upn'  
-- external_oauth_snowflake_user_mapping_attribute = 'login_name'  
-- external_oauth_any_role_mode = 'ENABLE';


create security integration sigma_oauth_integration
type = external_oauth  
enabled = true  
external_oauth_type = azure
external_oauth_issuer = 'https://sts.windows.net/6bec8931-53ed-4238-a6a8-495fa78471d5/'
external_oauth_jws_keys_url = 'https://login.microsoftonline.com/6bec8931-53ed-4238-a6a8-495fa78471d5/discovery/v2.0/keys'
external_oauth_audience_list = ('https://bourneleisureltd.onmicrosoft.com/28bacccc-6ef0-4b2d-8b02-470eb353a268')
external_oauth_token_user_mapping_claim = 'upn'
external_oauth_snowflake_user_mapping_attribute = 'login_name'  
external_oauth_any_role_mode = 'ENABLE';

desc integration POWERBI_SSO_INTEGRATION;

alter integration POWERBI_SSO_INTEGRATION
set external_oauth_jws_keys_url = ('https://login.microsoftonline.com/6bec8931-53ed-4238-a6a8-495fa78471d5/discovery/v2.0/keys', 'https://login.windows.net/common/discovery/keys')
external_oauth_audience_list = ('https://bourneleisureltd.onmicrosoft.com/28bacccc-6ef0-4b2d-8b02-470eb353a268', 'https://analysis.windows.net/powerbi/connector/Snowflake')
;

desc integration POWERBI_SSO_INTEGRATION;

alter integration POWERBI_SSO_INTEGRATION
set EXTERNAL_OAUTH_ANY_ROLE_MODE = 'ENABLE';