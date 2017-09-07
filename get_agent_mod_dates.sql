SELECT ap.id
	, ap.last_modified_by AS agent_last_mod_by
    , ap.user_mtime AS agent_mod_time
    , np.last_modified_by AS name_last_mod_by
    , np.user_mtime AS name_mod_time
	, np.sort_name AS name
FROM agent_person ap
LEFT JOIN name_person np on ap.id = np.agent_person_id
WHERE ap.user_mtime BETWEEN '2017-08-01 00:00:00' and '2017-09-08 00:00:00'
#ORDER BY ap.user_mtime DESC
UNION ALL
SELECT af.id
	, af.last_modified_by AS agent_last_mod_by
    , af.user_mtime AS agent_mod_time
	, nf.last_modified_by AS name_last_mod_by
    , nf.user_mtime AS name_mod_time
    , nf.sort_name AS name
FROM agent_family af
LEFT JOIN name_family nf on af.id = nf.agent_family_id
WHERE af.user_mtime BETWEEN '2017-08-01 00:00:00' and '2017-09-08 00:00:00'
#ORDER BY af.user_mtime DESC
UNION ALL
SELECT ace.id
	, ace.last_modified_by AS agent_last_mod_by
	, ace.user_mtime AS agent_mod_time
    , nce.last_modified_by AS name_last_mod_by
    , nce.user_mtime AS name_mod_time
	, nce.sort_name AS name
FROM agent_corporate_entity ace
LEFT JOIN name_corporate_entity nce on ace.id = nce.agent_corporate_entity_id
WHERE nce.user_mtime BETWEEN '2017-08-01 00:00:00' and '2017-09-08 00:00:00'
#ORDER BY ace.user_mtime DESC