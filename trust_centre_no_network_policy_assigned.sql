SELECT
  f.value:entity_id::VARCHAR AS entity_id,
  f.value:entity_name::VARCHAR AS entity_name,
  f.value:entity_object_type::VARCHAR AS entity_object_type,
  f.value:entity_detail AS entity_detail
FROM
  snowflake.trust_center.findings,
  LATERAL FLATTEN(input => at_risk_entities) AS f
WHERE
  EVENT_ID = '171928';