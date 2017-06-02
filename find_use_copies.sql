SELECT resource.ead_id AS EAD_ID
	, resource.title AS COLLECTION_TITLE
#	, a.id
#	, a.parent_id
    , a.display_string AS PARENT_TITLE
    , b.display_string AS CHILD_TITLE
	, CONCAT('https://archivesspace.library.yale.edu/resources/', resource.id, '#tree::archival_object/', b.id) AS URL
#    , b.repo_id
#    , b.parent_id
FROM archival_object a
LEFT JOIN archival_object b on a.id = b.parent_id
LEFT JOIN resource on a.root_record_id = resource.id
WHERE resource.repo_id = 12
AND b.display_string is not null
AND b.display_string like '%Use Cop%' #is there a way to check all case possibilites?
OR b.display_string like '%use cop%'
OR b.display_string like '%Use cop%'
#OR b.display_string like 'Original'
#OR b.display_string like 'Original%' #this cuold bring back lots of false positives
#OR b.display_string like '%Duplicating master%' #could just do %master%?
#OR b.display_string like '%Duplicate%' #refine
#OR b.display_string like 'Master%' #try %master% or %Master% if this doesn't work
#OR b.display_string like 'master%'
#OR b.display_string like 'Copy%' #refine
#OR b.display_string like 'copy%' #refine
#OR b.display_string like 'Copies' #refine
#OR b.display_string like 'copies' #refine
#OR b.display_string like 'digital'



#add URI
#joins - containers, barcode

#could also figure out what has been digitized...I think Kevin wants that too
