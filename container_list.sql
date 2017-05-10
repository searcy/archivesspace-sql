#get a container list fr a collection; just change ead_id

SELECT resource.ead_id AS EAD_ID
	, resource.title AS Collection
    , ao.display_string AS Archival_Object
	, cp.name AS Container_Type
	, tc.indicator AS Container_Number
    , tc.barcode AS Barcode
from sub_container sc
left join enumeration_value on enumeration_value.id = sc.type_2_id
left join top_container_link_rlshp tclr on tclr.sub_container_id = sc.id
left join top_container tc on tclr.top_container_id = tc.id
left join top_container_profile_rlshp tcpr on tcpr.top_container_id = tc.id
left join container_profile cp on cp.id = tcpr.container_profile_id
join instance on sc.instance_id = instance.id
join archival_object ao on instance.archival_object_id = ao.id
join resource on ao.root_record_id = resource.id
join repository on repository.id = resource.repo_id
WHERE resource.ead_id LIKE "%2022%"