SELECT * FROM constituencywise_details
SELECT * FROM constituencywise_results
SELECT * FROM partywise_results
SELECT * FROM statewise_results
SELECT * FROM states
SELECT * FROM constituencywise_results
SELECT DISTINCT COUNT(Parliament_Constituency) AS Total_Seats
FROM constituencywise_results

SELECT 
s.state AS State_Name,
COUNT(cr.parliament_constituency) AS Total_Seats 
FROM constituencywise_results cr
INNER JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency 
INNER JOIN states s ON sr.State_ID = s.State_ID
GROUP BY s.state

SELECT 
	SUM(CASE 
		WHEN party IN (
			'Bharatiya Janata Party - BJP',
			'Telugu Desam - TDP',
			'Janata Dal  (United) - JD(U)',
			'Shiv Sena - SHS',
			'Lok Janshakti Party(Ram Vilas) - LJPRV',
			'Nationalist Congress Party - NCP',
			'Janata Dal  (Secular) - JD(S)',
			'AJSU Party - AJSUP',
			'Apna Dal (Soneylal) - ADAL',
			'Hindustani Awam Morcha (Secular) - HAMS',
			'Janasena Party - JnP',
			'Rashtriya Lok Dal - RLD',
			'Sikkim Krantikari Morcha - SKM',
			'Asom Gana Parishad - AGP'
			) THEN [Won]
			ELSE 0
		END) AS NDA_Total_Seats_Won
FROM partywise_results

SELECT 
	party AS Party_Name,
	won AS Seats_Won
FROM partywise_results
WHERE party IN (
			'Bharatiya Janata Party - BJP',
			'Telugu Desam - TDP',
			'Janata Dal  (United) - JD(U)',
			'Shiv Sena - SHS',
			'Lok Janshakti Party(Ram Vilas) - LJPRV',
			'Nationalist Congress Party - NCP',
			'Janata Dal  (Secular) - JD(S)',
			'AJSU Party - AJSUP',
			'Apna Dal (Soneylal) - ADAL',
			'Hindustani Awam Morcha (Secular) - HAMS',
			'Janasena Party - JnP',
			'Rashtriya Lok Dal - RLD',
			'Sikkim Krantikari Morcha - SKM',
			'Asom Gana Parishad - AGP'
			)
ORDER BY Seats_Won DESC


SELECT 
	SUM(CASE 
		WHEN party IN(
				'Indian National Congress - INC',
				'Communist Party of India  (Marxist) - CPI(M)',
				'Aam Aadmi Party - AAAP',
				'Samajwadi Party - SP',
				'All India Trinamool Congress - AITC',
				'Dravida Munnetra Kazhagam - DMK',
				'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
				'Kerala Congress - KEC',
				'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
				'Communist Party of India - CPI',
				'Indian Union Muslim League - IUML',
				'Jammu & Kashmir National Conference - JKN',
				'Jharkhand Mukti Morcha - JMM',
				'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
				'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
				'Rashtriya Janata Dal - RJD',
				'Revolutionary Socialist Party - RSP',
				'Viduthalai Chiruthaigal Katchi - VCK',
				'Rashtriya Loktantrik Party - RLTP',
				'Bharat Adivasi Party - BHRTADVSIP'
		) THEN [Won]
		ELSE 0
		END) AS INDIA_Total_Seats_Won
FROM partywise_results

SELECt 
	party AS Party_Name,
	won AS Seats_Won
	FROM partywise_results
	WHERE party IN(
				'Indian National Congress - INC',
				'Communist Party of India  (Marxist) - CPI(M)',
				'Aam Aadmi Party - AAAP',
				'Samajwadi Party - SP',
				'All India Trinamool Congress - AITC',
				'Dravida Munnetra Kazhagam - DMK',
				'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
				'Kerala Congress - KEC',
				'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
				'Communist Party of India - CPI',
				'Indian Union Muslim League - IUML',
				'Jammu & Kashmir National Conference - JKN',
				'Jharkhand Mukti Morcha - JMM',
				'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
				'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
				'Rashtriya Janata Dal - RJD',
				'Revolutionary Socialist Party - RSP',
				'Viduthalai Chiruthaigal Katchi - VCK',
				'Rashtriya Loktantrik Party - RLTP',
				'Bharat Adivasi Party - BHRTADVSIP'
		) 
ORDER BY Seats_Won DESC

ALTER TABLE partywise_results
ADD party_alliance VARCHAR(50)

UPDATE partywise_results
SET party_alliance = 'I.N.D.I.A'
WHERE party IN(
				'Indian National Congress - INC',
				'Communist Party of India  (Marxist) - CPI(M)',
				'Aam Aadmi Party - AAAP',
				'Samajwadi Party - SP',
				'All India Trinamool Congress - AITC',
				'Dravida Munnetra Kazhagam - DMK',
				'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
				'Kerala Congress - KEC',
				'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
				'Communist Party of India - CPI',
				'Indian Union Muslim League - IUML',
				'Jammu & Kashmir National Conference - JKN',
				'Jharkhand Mukti Morcha - JMM',
				'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
				'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
				'Rashtriya Janata Dal - RJD',
				'Revolutionary Socialist Party - RSP',
				'Viduthalai Chiruthaigal Katchi - VCK',
				'Rashtriya Loktantrik Party - RLTP',
				'Bharat Adivasi Party - BHRTADVSIP'
);
UPDATE partywise_results
SET party_alliance = 'NDA'
WHERE party IN(
			'Bharatiya Janata Party - BJP',
			'Telugu Desam - TDP',
			'Janata Dal  (United) - JD(U)',
			'Shiv Sena - SHS',
			'Lok Janshakti Party(Ram Vilas) - LJPRV',
			'Nationalist Congress Party - NCP',
			'Janata Dal  (Secular) - JD(S)',
			'AJSU Party - AJSUP',
			'Apna Dal (Soneylal) - ADAL',
			'Hindustani Awam Morcha (Secular) - HAMS',
			'Janasena Party - JnP',
			'Rashtriya Lok Dal - RLD',
			'Sikkim Krantikari Morcha - SKM',
			'Asom Gana Parishad - AGP'
			
);

UPDATE partywise_results
SET party_alliance = 'OTHER'
WHERE party_alliance IS NULL;

SELECT party_alliance,
SUM(won) AS Seats_Won
FROM partywise_results
GROUP BY party_alliance

SELECT cr.Winning_Candidate,
pr.party,
pr.party_alliance,
cr.total_votes,
cr.margin,
s.state,
cr.Constituency_Name
FROM constituencywise_results cr 
INNER JOIN partywise_results pr ON cr.party_id = pr.Party_ID
INNER JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
INNER JOIN states s ON sr.State_ID = s.State_ID
WHERE s.State = 'Uttar Pradesh' AND cr.Constituency_Name = 'GHAZIABAD'

SELECT 
cd.EVM_Votes,
cd.Postal_Votes,
Cd.Total_Votes,
cd.Candidate,
cr.Constituency_Name
FROM constituencywise_results cr JOIN constituencywise_details cd 
ON cr.Constituency_ID = cd.Constituency_ID
WHERE cr.Constituency_Name = 'AMETHI'

SELECT 
    pr.Party,
    COUNT(cr.Constituency_ID) AS Seats_Won
FROM 
    constituencywise_results cr
JOIN 
    partywise_results pr ON cr.Party_ID = pr.Party_ID
JOIN 
    statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN states s ON sr.State_ID = s.State_ID
WHERE 
    s.state = 'Uttar Pradesh'
GROUP BY 
    pr.Party
ORDER BY 
    Seats_Won DESC;

SELECT 
    s.State AS State_Name,
    SUM(CASE WHEN p.party_alliance = 'NDA' THEN 1 ELSE 0 END) AS NDA_Seats_Won,
    SUM(CASE WHEN p.party_alliance = 'I.N.D.I.A' THEN 1 ELSE 0 END) AS INDIA_Seats_Won,
	SUM(CASE WHEN p.party_alliance = 'OTHER' THEN 1 ELSE 0 END) AS OTHER_Seats_Won
FROM 
    constituencywise_results cr
JOIN 
    partywise_results p ON cr.Party_ID = p.Party_ID
JOIN 
    statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN 
    states s ON sr.State_ID = s.State_ID
WHERE 
    p.party_alliance IN ('NDA', 'I.N.D.I.A',  'OTHER')  -- Filter for NDA and INDIA alliances
GROUP BY 
    s.State
ORDER BY 
    s.State;

WITH RankedCandidates AS (
    SELECT 
        cd.Constituency_ID,
        cd.Candidate,
        cd.Party,
        cd.EVM_Votes,
        cd.Postal_Votes,
        cd.EVM_Votes + cd.Postal_Votes AS Total_Votes,
        ROW_NUMBER() OVER (PARTITION BY cd.Constituency_ID ORDER BY cd.EVM_Votes + cd.Postal_Votes DESC) AS VoteRank
    FROM 
        constituencywise_details cd
    JOIN 
        constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
    JOIN 
        statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
    JOIN 
        states s ON sr.State_ID = s.State_ID
    WHERE 
        s.State = 'Maharashtra'
)

SELECT 
    cr.Constituency_Name,
    MAX(CASE WHEN rc.VoteRank = 1 THEN rc.Candidate END) AS Winning_Candidate,
    MAX(CASE WHEN rc.VoteRank = 2 THEN rc.Candidate END) AS Runnerup_Candidate
FROM 
    RankedCandidates rc
JOIN 
    constituencywise_results cr ON rc.Constituency_ID = cr.Constituency_ID
GROUP BY 
    cr.Constituency_Name
ORDER BY 
    cr.Constituency_Name;


SELECT 
	COUNT(DISTINCT cr.Constituency_ID) AS Total_Seats,
	COUNT(DISTINCT cd.Candidate) AS Total_Candidates,
	COUNT(DISTINCT pr.Party) AS Total_Parties,
	SUM(cd.EVM_Votes + cd.Postal_Votes) AS Total_Votes,
	SUM(cd.EVM_Votes) AS Total_EVM_Votes,
	SUM(cd.Postal_Votes) AS Total_Postal_Votes
FROM constituencywise_results cr
JOIN 
	constituencywise_details cd ON cr.constituency_ID = cd.Constituency_ID
JOIN
	statewise_results sr ON sr.Parliament_Constituency = cr.Parliament_Constituency
JOIN
	partywise_results pr ON  cr.Party_ID = pr.Party_ID 
JOIN
	States s ON s.State_ID = sr.State_ID
WHERE
	s.State = 'Maharashtra';
	