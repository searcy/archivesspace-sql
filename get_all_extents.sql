SELECT ev2.value as extent_type
#    , e.container_summary
#    , resource.title as title
    , CONCAT('/repositories/', resource.repo_id, '/resources/', resource.id) AS uri
FROM resource
JOIN extent e on resource.id = e.resource_id
LEFT JOIN enumeration_value ev on ev.id = e.portion_id
LEFT JOIN enumeration_value ev2 on ev2.id = e.extent_type_id
UNION ALL
SELECT ev2.value as extent_type
#    , e.container_summary
#    , accession.title as title
    , CONCAT('/repositories/', accession.repo_id, '/accessions/', accession.id) AS uri
FROM accession
JOIN extent e on accession.id = e.accession_id
LEFT JOIN enumeration_value ev on ev.id = e.portion_id
LEFT JOIN enumeration_value ev2 on ev2.id = e.extent_type_id
UNION ALL
SELECT ev2.value as extent_type
#    , e.container_summary
#    , ao.title as title
    , CONCAT('/repositories/', ao.repo_id, '/archival_objects/', ao.id) AS uri
FROM archival_object ao
JOIN extent e on ao.id = e.archival_object_id
LEFT JOIN enumeration_value ev on ev.id = e.portion_id
LEFT JOIN enumeration_value ev2 on ev2.id = e.extent_type_id
UNION ALL
SELECT ev2.value as extent_type
#    , e.container_summary
#    , do.title as title
    , CONCAT('/repositories/', do.repo_id, '/digital_objects/', do.id) AS uri
FROM digital_object do
JOIN extent e on do.id = e.digital_object_id
LEFT JOIN enumeration_value ev on ev.id = e.portion_id
LEFT JOIN enumeration_value ev2 on ev2.id = e.extent_type_id
UNION ALL
SELECT ev2.value as extent_type
#    , e.container_summary
#    , doc.title as title
    , CONCAT('/repositories/', doc.repo_id, '/digital_object_components/', doc.id) AS uri
FROM digital_object_component doc
JOIN extent e on doc.id = e.digital_object_component_id
LEFT JOIN enumeration_value ev on ev.id = e.portion_id
LEFT JOIN enumeration_value ev2 on ev2.id = e.extent_type_id
UNION ALL
SELECT ev2.value as extent_type
#    , e.container_summary
 #   , deaccession.id as title
    , NULL as uri
FROM deaccession
JOIN extent e on deaccession.id = e.deaccession_id
LEFT JOIN enumeration_value ev on ev.id = e.portion_id
LEFT JOIN enumeration_value ev2 on ev2.id = e.extent_type_id