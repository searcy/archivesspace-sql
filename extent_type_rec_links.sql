SELECT repository.name
    , r2.identifier as root_rec_id
    , r2.title as parent_title
    , ao.display_string as title
    , e.extent_type_id as extent_type_id
    , ev.value as extent_type
    , CONCAT('repositories/', ao.repo_id, '/archival_objects/', ao.id) as URI
FROM archival_object ao
JOIN extent e on e.archival_object_id = ao.id
LEFT JOIN enumeration_value ev on ev.id = extent_type_id
LEFT JOIN resource r2 on r2.id = ao.root_record_id
LEFT JOIN repository on repository.id = ao.repo_id
#WHERE ao.repo_id = whatever - if you want to find by repo
UNION all
SELECT repository.name
    , resource.identifier as root_rec_id
    , NULL as parent_title
    , resource.title as title
    , e.extent_type_id as extent_type_id
    , ev.value as extent_type
    , CONCAT('repositories/', resource.repo_id, '/archival_objects/', resource.id) as URI
FROM resource
JOIN extent e on e.resource_id = resource.id
LEFT JOIN enumeration_value ev on ev.id = e.extent_type_id
LEFT JOIN repository on repository.id = resource.repo_id
#WHERE resource.repo_id = whatever
