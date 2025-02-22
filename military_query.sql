use Military;

#1
SELECT First_Name, Last_Name
FROM Military_Man
WHERE Rank = 'Private';

#2
SELECT Rank, COUNT(*) AS Rank_Count
FROM Military_Man
GROUP BY Rank
HAVING Rank_Count > 1;

#3
SELECT First_Name, Last_Name
FROM Military_Man
WHERE Soldier_ID IN (
    SELECT Soldier_ID
    FROM Mission
    WHERE Mission_ID = 301
);

#4
SELECT m.First_Name, m.Last_Name, m.Rank, gf.Total_Female
FROM Military_Man m
         INNER JOIN (
    SELECT CountFemaleSoldiers() AS Total_Female
) gf;

#5
SELECT m.First_Name, m.Last_Name, mi.Mission_Type
FROM Military_Man m
         LEFT JOIN (
    SELECT GetSoldiersInMission(301) AS Soldier_IDs
) gm ON m.Soldier_ID = gm.Soldier_IDs;
