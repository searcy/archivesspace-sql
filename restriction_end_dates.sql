#finds restrictions that end between 2016-2018; can easily be modified to find any end date

SELECT resource.ead_id AS EAD_ID
	, resource.identifier AS Identifier
	, resource.title AS Resource_Title
	, ev.value AS LEVEL
    , ao.display_string AS Object_Title
	, rr.restriction_note_type AS Restriction_Type
	, rr.end AS END_DATE
FROM rights_restriction rr
LEFT JOIN archival_object ao on ao.id = rr.archival_object_id
LEFT JOIN resource on ao.root_record_id = resource.id
LEFT JOIN enumeration_value ev on ev.id = ao.level_id
WHERE rr.end LIKE "%2018%"
OR rr.end LIKE "%2017%"
OR rr.end LIKE "%2016%"
#can change ID to whatever you want
AND resource.identifier LIKE "%RU%"
ORDER BY rr.end