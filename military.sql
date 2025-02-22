CREATE DATABASE Military;
use Military;

#-----------------------------Table_Creation---------------------------#

                #-----------Military_Man-----------------#
CREATE TABLE Military_Man (
                              Soldier_ID INT PRIMARY KEY,
                              First_Name VARCHAR(100),
                              Last_Name VARCHAR(100),
                              DOB DATE,
                              Joining_Date DATE,
                              Rank VARCHAR(100),
                              Batch_Number INT,
                              Gender VARCHAR(10)
);

                #-----------Medical_Report---------------#
CREATE TABLE Medical_Report (
                                Health_ID INT NOT NULL,
                                Soldier_ID INT NOT NULL,
                                UNIQUE (Health_ID),
                                PRIMARY KEY (Health_ID, Soldier_ID),
                                FOREIGN KEY (Soldier_ID) REFERENCES Military_Man(Soldier_ID)

);

                #-----------Health_Details---------------#
CREATE TABLE Health_Details (
                                Health_ID INT PRIMARY KEY ,
                                Last_Checkup_Date DATE,
                                Next_Checkup_Date DATE,
                                Blood_Group VARCHAR(5),
                                Current_Weight DECIMAL(5,2),
                                Major_Health_Issue VARCHAR(100),
                                FOREIGN KEY (Health_ID) REFERENCES Medical_Report(Health_ID)
);



                 #---------------Mission------------------#
CREATE TABLE Mission (
                         Mission_ID INT NOT NULL ,
                         Soldier_ID INT NOT NULL ,
                         PRIMARY KEY (Mission_ID, Soldier_ID),
                         FOREIGN KEY (Soldier_ID) REFERENCES Military_Man(Soldier_ID)
);

                #-----------Mission_Details---------------#
CREATE TABLE Mission_Details (
                                 Mission_ID INT PRIMARY KEY,
                                 Mission_Type VARCHAR(100),
                                 Mission_Region VARCHAR(100),
                                 Duration INT,
                                 Dead INT,
                                 Injured INT,
                                 Status VARCHAR(100),
                                 FOREIGN KEY (Mission_ID) REFERENCES Mission(Mission_ID)
);


                #-----------Trainings---------------#
CREATE TABLE Trainings (
                           Soldier_ID INT PRIMARY KEY,
                           Physical VARCHAR(100),
                           Weapon VARCHAR(100),
                           Map_Reading VARCHAR(100),
                           FOREIGN KEY (Soldier_ID) REFERENCES Military_Man(Soldier_ID),
                           FOREIGN KEY (Soldier_ID) REFERENCES Mission(Soldier_ID)
);

               #-----------Growth_Report---------------#

CREATE TABLE Growth_Report (
                               Soldier_ID INT NOT NULL,
                               UNIQUE (Soldier_ID),
                               Previous_Rank VARCHAR(100) ,
                               Current_Rank VARCHAR(100) ,
                               Success_Rate_Of_Missions FLOAT(5,2) DEFAULT NULL,
                               FOREIGN KEY (Soldier_ID) REFERENCES Military_Man(Soldier_ID)
);
#SELECT * FROM Military_Man;



#------------------------------------Insertion in Table---------------------------------#



              #------------------Military_man insertion---------------------#

INSERT INTO Military_Man (Soldier_ID, First_Name, Last_Name, DOB, Joining_Date, Rank, Batch_Number, Gender)
VALUES
    (101, 'John', 'Doe', '1990-05-15', '2010-07-20', 'Private', 1011, 'Male'),
    (102, 'Jane', 'Smith', '1992-09-28', '2011-06-23', 'Private', 1021, 'Female'),
    (103, 'Michael', 'Johnson', '1988-11-03', '2010-07-20', 'Private', 1011, 'Male'),
    (104, 'Emily', 'Brown', '1991-03-18', '2010-07-11', 'Private', 1011, 'Female'),
    (105, 'Christopher', 'Wilson', '1989-07-07', '2011-07-15', 'Private', 1021, 'Male'),
    (106, 'Jennifer', 'Martinez', '1993-12-10', '2015-06-30', 'Sergeant', 1061, 'Female'),
    (107, 'David', 'Anderson', '1990-04-25', '2014-09-17', 'Lieutenant', 1071, 'Male'),
    (108, 'Sarah', 'Garcia', '1987-08-12', '2012-11-05', 'Warrant Officer', 1081, 'Female'),
    (109, 'Matthew', 'Lopez', '1994-02-08', '2016-04-19', 'Private', 1091, 'Male'),
    (110, 'Jessica', 'Lee', '1988-06-30', '2012-07-20', 'Private', 1081, 'Female');



            #---------------------Medical_Report insertion-------------------------#

INSERT INTO Medical_Report (Health_ID, Soldier_ID)
VALUES
    (201, 101), (202, 101), (203, 101), (204, 101),
    (205, 102), (206, 102), (207, 102),
    (208, 103), (209, 103),
    (210, 104), (211, 104),
    (212, 105), (213, 105),
    (214, 106),
    (215, 107), (216, 107), (217, 107),
    (218, 108), (219, 108), (220, 108),
    (221, 109), (222, 109), (223, 109), (224, 109),
    (225, 110), (226, 110), (227, 110), (228, 110), (229, 110);

              #---------------------Health_Details insertion-------------------------#



INSERT INTO Health_Details (Health_ID, Last_Checkup_Date, Next_Checkup_Date, Blood_Group, Current_Weight, Major_Health_Issue)
VALUES
    (201, '2010-09-30', '2011-09-30', 'A+', 72.5, 'None'),
    (202, '2011-09-30', '2012-10-20', 'A+', 68.3, 'None'),
    (203, '2012-10-20', '2012-11-30', 'A+', 65.8, 'Asthma'),
    (204, '2012-11-30', '2013-01-15', 'A+', 71.2, 'Diabetes'),
    (205, '2011-07-20', '2012-04-20', 'A-', 70.1, 'None'),
    (206, '2012-04-20', '2012-10-19', 'A-', 67.9, 'High cholesterol'),
    (207, '2012-10-19', '2013-03-30', 'A-', 69.5, 'None'),
    (208, '2010-08-15', '2010-11-30', 'AB-', 72.8, 'None'),
    (209, '2010-11-30', '2011-03-28', 'AB-', 75.2, 'None'),
    (210, '2010-08-15', '2011-01-15', 'B-', 73.4, 'Arthritis'),
    (211, '2011-01-15', '2011-10-05', 'B-', 70.9, 'None'),
    (212, '2011-08-15', '2012-01-19', 'O-', 72.1, 'Respiratory Infections'),
    (213, '2012-01-19', '2012-09-25', 'O-', 71.6, 'None'),
    (214, '2015-07-30', '2016-02-27', 'B+', 68.2, 'None'),
    (215, '2014-09-30', '2014-09-30', 'O+', 69.8, 'None'),
    (216, '2014-09-30', '2015-01-15', 'O-', 73.7, 'None'),
    (217, '2015-01-15', '2015-08-20', 'O-', 70.5, 'Arthritis'),
    (218, '2012-12-05', '2013-05-25', 'B+', 68.9, 'None'),
    (219, '2013-05-25', '2013-08-20', 'B+', 71.3, 'High cholesterol'),
    (220, '2013-08-20', '2014-05-25', 'B+', 74.6, 'Dehydration'),
    (221, '2016-05-15', '2016-12-15', 'A+', 73.1, 'Muscle Strains and Sprains'),
    (222, '2016-12-15', '2017-04-30', 'A+', 69.7, 'Muscle Strains and Sprains'),
    (223, '2017-04-30', '2017-10-10', 'A+', 70.3, 'None'),
    (224, '2017-10-10', '2018-01-05', 'A+', 72.4, 'None'),
    (225, '2012-08-19', '2012-12-15', 'A-', 71.8, 'None'),
    (226, '2012-12-15', '2013-04-20', 'A-', 68.4, 'None'),
    (227, '2013-04-20', '2013-08-27', 'A-', 72.5, 'None'),
    (228, '2013-08-27', '2013-12-01', 'A-', 73.0, 'PTSD (Post-Traumatic Stress Disorder)'),
    (229, '2013-12-01', '2014-03-20', 'A-', 68.6, 'Heat Exhaustion');

# SELECT m.Soldier_ID,
#        h.Health_ID, h.Last_Checkup_Date, h.Next_Checkup_Date, h.Blood_Group, h.Current_Weight, h.Major_Health_Issue
# FROM Military_Man m
#          JOIN Medical_Report mr ON m.Soldier_ID = mr.Soldier_ID
#          JOIN Health_Details h ON mr.Health_ID = h.Health_ID
# WHERE m.Soldier_ID = 101;



                     #---------------------Mission insertion-------------------------#

INSERT INTO Mission (Mission_ID, Soldier_ID)
VALUES
    (301, 101),
    (301, 102),
    (302, 103),
    (301, 104),
    (304, 105),
    (302, 108),
    (303, 107),
    (303, 104),
    (305, 106),
    (306, 107),
    (307, 108),
    (307, 102),
    (308, 109),
    (309, 110),
    (309, 104),
    (310, 102),
    (311, 110),
    (311, 105),
    (308, 102),
    (310, 109),
    (304, 109),
    (305, 103),
    (305, 108);


                    #---------------------Mission_Details insertion------------------#
INSERT INTO Mission_Details (Mission_ID, Mission_Type, Mission_Region, Duration, Dead, Injured, Status)
VALUES
    (301, 'Reconnaissance', 'Iraq', 10, 10, 300, 'Successful'),
    (302, 'Search and Rescue', 'Mount Everest', 2, 0, 5, 'Successful'),
    (303, 'Combat Patrol', 'Baghdad', 8, 4, 2, 'Failed'),
    (304, 'Convoy Escort', 'Afghanistan', 240, 10000, 500000, 'Failed'),
    (305, 'Counterinsurgency', 'Amazon Rainforest', 2, 3, 7, 'Partially Successful'),
    (306, 'Intelligence Gathering', 'Antarctica', 18, 50, 10, 'Successful'),
    (307, 'Security Detail', 'Somalia', 12, 10, 700, 'Aborted'),
    (308, 'Combat Training', 'Fort Benning', 5, 0, 0, 'Successful'),
    (309, 'Humanitarian Aid', 'Haiti', 10, 0, 0, 'Successful'),
    (310, 'Surgical Strike', 'Tokyo', 3, 10, 2, 'Failed'),
    (311, 'Evacuation', 'New York City', 1, 8, 15, 'Partially Successful');



                   #---------------------Trainings insertion-------------------------#


INSERT INTO Trainings (Soldier_ID, Physical, Weapon, Map_Reading)
VALUES
    (101, 70.00, 65.00, 80.00),
    (102, 45.00, 50.00, 85.00),
    (103, 80.00, 75.00, 40.00),
    (104, 40.00, 45.00, 50.00),
    (105, 85.00, 60.00, 70.00),
    (106, 55.00, 60.00, 65.00),
    (107, 75.00, 70.00, 65.00),
    (108, 60.00, 95.00, 70.00),
    (109, 40.00, 75.00, 80.00),
    (110, 50.00, 55.00, 60.00);

                   #--------------------Growth_Report insertion---------------------#

INSERT INTO Growth_Report(Soldier_ID, Previous_Rank, Current_Rank)
VALUES (101,'Private','Private'),
       (102,'Private','Private'),
       (103,'Private','Private'),
       (104,'Private','Private'),
       (105,'Private','Private'),
       (106,'Sergeant','Sergeant'),
       (107,'Lieutenant','Lieutenant'),
       (108,'Warrant Officer','Warrant Officer'),
       (109,'Private','Private'),
       (110,'Private','Private');

                   #--------------------Creating User------------------------------#

CREATE USER 'amjonota'@'%' IDENTIFIED BY '12345678';
CREATE USER 'sir'@'10.100.32.71' IDENTIFIED BY 'iamsir';

                   #-------------------Granting Access to the User----------------#

GRANT SELECT ON *.* TO 'amjonota'@'%';
GRANT SELECT, INSERT , UPDATE , DELETE ON *.* TO 'sir'@'10.100.32.71';

                   #------------------User Defined Functions----------------------#

                                        #----CountFemaleSoldiers----#

                                        CREATE FUNCTION CountFemaleSoldiers() RETURNS INT
                                        BEGIN
                                            DECLARE femaleCount INT;

                                            SELECT COUNT(*) INTO femaleCount
                                            FROM Military_Man
                                            WHERE Gender = 'Female';

                                            RETURN femaleCount;
                                        END;



#----------------------GetSoldiersInMission it returns a list of soldiers who have participated in a mission together-------------------#
DELIMITER //

CREATE FUNCTION GetSoldiersInMission(MissionID INT)
    RETURNS TEXT
BEGIN
    DECLARE soldierList TEXT;

    SELECT GROUP_CONCAT(m.Soldier_ID) INTO soldierList
    FROM Mission m
             INNER JOIN Mission_Details md ON m.Mission_ID = md.Mission_ID
    WHERE m.Mission_ID = MissionID;

    RETURN soldierList;
END //

DELIMITER ;




                       #-------------------Triggers-----------------------#

DELIMITER //

CREATE TRIGGER update_growth_report AFTER INSERT ON Mission
    FOR EACH ROW
BEGIN
    DECLARE success_rate DECIMAL(5,2);

    -- Calculate success rate based on all Mission_Details related to the soldier
    SELECT
        SUM(
                CASE MD.Status
                    WHEN 'Successful' THEN 20
                    WHEN 'Failed' THEN -5
                    WHEN 'Partially Successful' THEN 10
                    WHEN 'Aborted' THEN 0
                    ELSE 0
                    END
        ) / 100
    INTO success_rate
    FROM Mission_Details MD
             JOIN Mission M ON MD.Mission_ID = M.Mission_ID
    WHERE M.Soldier_ID = NEW.Soldier_ID;

    -- Update Growth_Report with the calculated success rate for the soldier
    UPDATE Growth_Report
    SET Success_Rate_Of_Missions = success_rate
    WHERE Soldier_ID = NEW.Soldier_ID;
END;
//

DELIMITER ;





















                                    #-----------------------Procedures ( Stored-Procedures)--------------------#

                       #-------------------showtable(Procedures) which will help to show table by eliminating multipe use of Select-------------------#

DELIMITER //

CREATE PROCEDURE ShowTableData(tableName VARCHAR(255))
BEGIN
    SET @sql = CONCAT('SELECT * FROM ', tableName);
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END //

DELIMITER ;



#----------------------Query via User Defined Function-----------------#
#SELECT CountFemaleSoldiers() AS Total_Female
#SELECT GetSoldiersInMission(301);


#---calling procedures-----#
#CALL ShowTableData('Military_Man');














































