SELECT CONCAT('/agents/people/', ap.id) as agent_person_uri
	, CONCAT('/repositories/', resource.repo_id, '/resources/', resource.id) as record_uri
	, resource.title as title
	, NULL as parent_uri
	, NULL as parent_title
FROM linked_agents_rlshp lar
JOIN agent_person ap on lar.agent_person_id = ap.id
JOIN resource on resource.id = lar.resource_id
UNION ALL
SELECT CONCAT('/agents/people/', ap.id) as agent_person_uri
	, CONCAT('/repositories/', ao.repo_id, '/archival_objects/', ao.id) as record_uri
	, ao.title as title
	, CONCAT('/repositories/', resource.repo_id, '/resources/', resource.id) as parent_uri
	, resource.title as parent_title
FROM linked_agents_rlshp lar
JOIN agent_person ap on lar.agent_person_id = ap.id
JOIN archival_object ao on ao.id = lar.archival_object_id
JOIN resource on resource.id = ao.root_record_id
UNION ALL
SELECT CONCAT('/agents/people/', ap.id) as agent_person_uri
	, CONCAT('/repositories/', accession.repo_id, '/accessions/', accession.id) as record_uri
	, accession.title as title
	, NULL as parent_uri
	, NULL as parent_title
FROM linked_agents_rlshp lar
JOIN agent_person ap on lar.agent_person_id = ap.id
JOIN accession on accession.id = lar.accession_id
UNION ALL
SELECT CONCAT('/agents/people/', ap.id) as agent_person_uri
	, CONCAT('/repositories/', do.repo_id, '/digital_objects/', do.id) as record_uri
	, do.title as title
	, NULL as parent_uri
	, NULL as parent_title
FROM linked_agents_rlshp lar
JOIN agent_person ap on lar.agent_person_id = ap.id
JOIN digital_object do on do.id = lar.digital_object_id
UNION ALL
SELECT CONCAT('/agents/people/', ap.id) as agent_person_uri
	, CONCAT('/repositories/', doc.repo_id, '/digital_object_components/', doc.id) as record_uri
	, doc.title as title
	, CONCAT('/repositories/', do.repo_id, '/digital_objects/', do.id) as parent_uri
	, do.title as parent_title
FROM linked_agents_rlshp lar
JOIN agent_person ap on lar.agent_person_id = ap.id
JOIN digital_object_component doc on doc.id = lar.digital_object_component_id
JOIN digital_object do on do.id = doc.root_record_id
UNION ALL
SELECT CONCAT('/agents/people/', ap.id) as agent_person_uri
	, CONCAT('/repositories/', event.repo_id, '/events/', event.id) as record_uri
	, 'EVENT' as title
	, NULL as parent_uri
	, NULL as parent_title
FROM linked_agents_rlshp lar
JOIN agent_person ap on lar.agent_person_id = ap.id
JOIN event on do.id = lar.event_id
