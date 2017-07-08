SELECT resource.title
    , CONCAT('/repositories/', resource.repo_id, '/resources/', resource.id)
    , date.begin
    , date.end
	, enumeration_value.value as date_type
FROM resource
LEFT JOIN date on date.resource_id = resource.id
LEFT JOIN enumeration_value on enumeration_value.id = date.date_type_id
WHERE resource.repo_id = 14 #your repo ID here
AND enumeration_value.value like '%inclusive%' #change to whatever date type you're looking for (or remove if you want all dates)
