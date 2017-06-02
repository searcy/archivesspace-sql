SELECT resource.ead_id AS EAD_ID
	,  resource.title AS Resource_Title
#	,  resource.repo_id
	,  aoa.display_string AS Parent_Archival_Object_Title
    ,  aob.display_string AS Child_Archival_Object_Title
	,  do.title AS Digital_Object_Title
    ,  do.digital_object_id AS Digital_Object_ID
    ,  file_version.file_uri
    ,  CONCAT('https://archivesspace.library.yale.edu/resources/', resource.id, '#tree::archival_object_', aoa.id) AS URL
FROM digital_object do
LEFT JOIN file_version on file_version.digital_object_id = do.id
LEFT JOIN instance_do_link_rlshp idlr on idlr.digital_object_id = do.id
LEFT JOIN instance on instance.id = idlr.instance_id
LEFT JOIN archival_object aoa on aoa.id = instance.archival_object_id
LEFT JOIN archival_object aob on aoa.id = aob.parent_id
LEFT JOIN resource on resource.id = aoa.root_record_id
WHERE resource.repo_id = 12
AND resource.title not like '%Kissinger%'