SELECT CONCAT('https://archivesspace.library.yale.edu/agents/agent_person/', ap.id) AS URI
	, np.sort_name AS sort_name
	, np.primary_name AS primary_name_form
	, np.rest_of_name AS rest_of_name
	, NULL AS rest_of_name_02
	, np.title AS title
	, np.fuller_form AS fuller_form
	, np.number AS number
	, np.dates AS dates_of_name
#	, ev3.value AS name_order
	, np.qualifier AS qualifier
	, np.dates AS dates_of_existence
#	, ev.value AS rules
#	, ev2.value AS source
	, nai.authority_id as authority_id
FROM name_person np
JOIN agent_person ap on ap.id = np.agent_person_id
#JOIN enumeration_value ev on np.rules_id = ev.id
#JOIN enumeration_value ev2 on np.source_id = ev2.id
#JOIN enumeration_value ev3 on np.name_order_id = ev3.id
LEFT JOIN name_authority_id nai on nai.name_person_id = np.id
#LEFT JOIN note on note.agent_person_id = ap.id
UNION ALL
SELECT CONCAT('https://archivesspace.library.yale.edu/agents/agent_family/', af.id) AS URI
    , nf.sort_name AS sort_name
    , nf.family_name AS primary_name_form
    , NULL AS rest_of_name
    , NULL AS rest_of_name_02
    , NULL AS title
    , NULL AS fuller_form
    , NULL AS number
    , nf.dates AS dates_of_name
#	, NULL AS name_order
	, nf.qualifier AS qualifier
    , nf.dates AS dates_of_existence
#   	, ev.value AS rules
#   	, ev2.value AS source
	, nai.authority_id as authority_id
FROM name_family nf
JOIN agent_family af on af.id = nf.agent_family_id
#JOIN enumeration_value ev on nf.rules_id = ev.id
#JOIN enumeration_value ev2 on nf.source_id = ev2.id
LEFT JOIN name_authority_id nai on nai.name_family_id = nf.id
#LEFT JOIN note on note.agent_family_id = af.id
UNION ALL
SELECT CONCAT('https://archivesspace.library.yale.edu/agents/agent_corporate_entity/', ace.id) AS URI
	, nce.sort_name AS sort_name
	, nce.primary_name AS primary_name_form
	, nce.subordinate_name_1 AS rest_of_name
	, nce.subordinate_name_2 AS rest_of_name_02
	, NULL AS title
	, NULL AS fuller_form
	, nce.number AS number
	, nce.dates AS dates_of_name
#	, NULL AS name_order
	, nce.qualifier AS qualifier
	, nce.dates AS dates_of_existence
#	, ev.value AS rules
#	, ev2.value AS source
	, nai.authority_id as authority_id
FROM name_corporate_entity nce
JOIN agent_corporate_entity ace on ace.id = nce.agent_corporate_entity_id
#JOIN enumeration_value ev on nce.rules_id = ev.id
#JOIN enumeration_value ev2 on nce.source_id = ev2.id
LEFT JOIN name_authority_id nai on nai.name_corporate_entity_id = nce.id
#LEFT JOIN note on note.agent_corporate_entity_id = ace.id