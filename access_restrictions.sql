select CONCAT('/repositories/', ao.repo_id, '/archival_objects/', ao.id) as uri
	, REPLACE(ao.title, '"', "'") as title
	, rr.begin
	, rr.end
	, REPLACE(note.notes, '"', "'") as note_text
	, npi.persistent_id
from rights_restriction rr
JOIN archival_object ao on rr.archival_object_id = ao.id
JOIN note on note.archival_object_id = ao.id
JOIN note_persistent_id npi on npi.note_id = note.id
where restriction_note_type like 'accessrestrict'
and note.notes like '%accessrestrict%'
and (rr.begin is not null or rr.end is not null)
#and ao.repo_id
UNION ALL
select CONCAT('/repositories/', resource.repo_id, '/resources/', resource.id) as uri
	, REPLACE(resource.title, '"', "'") as title
	, rr.begin
	, rr.end 
	, REPLACE(note.notes, '"', "'") as note_text
	, npi.persistent_id
from rights_restriction rr
JOIN resource on rr.resource_id = resource.id
JOIN note on note.resource_id = resource.id
JOIN note_persistent_id npi on npi.note_id = note.id
where restriction_note_type like 'accessrestrict'
and note.notes like '%accessrestrict%'
and (rr.begin is not null or rr.end is not null)
#and resource.repo_id =