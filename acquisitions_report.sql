#finds materials accessioned in 2016 or 2017; modify to whatever date you want

select identifier
	, title
    , content_description
    , accession_date
FROM accession
WHERE repo_id = 12
AND accession_date LIKE '%2016%'
OR accession_date LIKE '%2017'
ORDER BY accession_date