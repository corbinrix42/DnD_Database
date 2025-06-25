/************ DnD schema *************/



CREATE TABLE Races (
    race_ID NUMBER PRIMARY KEY,
    race_Name VARCHAR2(50) NOT NULL
);



CREATE TABLE Campaign (
    campaign_ID NUMBER PRIMARY KEY,
    campaign_Name VARCHAR2(100) NOT NULL,
    dungeon_Master VARCHAR(50)
);



CREATE TABLE Classes (
    class_ID NUMBER PRIMARY KEY,
    class_Name VARCHAR2(50) NOT NULL,
    class_Type VARCHAR2(50)
);


CREATE TABLE Players (
    player_ID NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    campaign_ID NUMBER,
    first_Name VARCHAR2(50) NOT NULL,
    last_Name VARCHAR2(50) NOT NULL,
    FOREIGN KEY (campaign_ID) REFERENCES Campaign(campaign_ID)
);



CREATE TABLE Stat (
    stat_ID NUMBER PRIMARY KEY,
    stat_Name VARCHAR2(50) NOT NULL
);



CREATE TABLE Characters (
    char_ID NUMBER PRIMARY KEY,
    player_ID NUMBER NOT NULL,
    race_ID NUMBER NOT NULL,
    class_ID NUMBER NOT NULL,
    campaign_ID NUMBER, 
    first_Name VARCHAR2(50) NOT NULL,
    last_Name VARCHAR2(50),
    char_Level NUMBER DEFAULT 0 CHECK (char_Level >= 0),
    FOREIGN KEY (player_ID) REFERENCES Players(player_ID),
    FOREIGN KEY (race_ID) REFERENCES Races(race_ID),
    FOREIGN KEY (class_ID) REFERENCES Classes(class_ID),
    FOREIGN KEY (campaign_ID) REFERENCES Campaign(campaign_ID)
);



CREATE TABLE Char_Statistics (
    char_ID NUMBER NOT NULL,
    stat_ID NUMBER NOT NULL,
    stat_Num NUMBER CHECK (stat_Num >= 0), 
    PRIMARY KEY (char_ID, stat_ID),
    FOREIGN KEY (char_ID) REFERENCES Characters(char_ID),
    FOREIGN KEY (stat_ID) REFERENCES Stat(stat_ID)
);



CREATE TABLE Race_Stat (
    race_ID NUMBER NOT NULL,
    stat_ID NUMBER,
    bonus_value NUMBER NOT NULL,
    PRIMARY KEY (race_ID, stat_ID),
    FOREIGN KEY (race_ID) REFERENCES Races(race_ID),
    FOREIGN KEY (stat_ID) REFERENCES Stat(stat_ID)
);


-- Insert into Races (Standard Player Handbook)

INSERT INTO Races (race_ID, race_Name)
VALUES (1, 'Dwarf');
INSERT INTO Races (race_ID, race_Name)
VALUES (2, 'Elf');
INSERT INTO Races (race_ID, race_Name)
VALUES (3, 'Halfling');
INSERT INTO Races (race_ID, race_Name)
VALUES (4, 'Human');
INSERT INTO Races (race_ID, race_Name)
VALUES (5, 'Dragonborn');
INSERT INTO Races (race_ID, race_Name)
VALUES (6, 'Gnome');
INSERT INTO Races (race_ID, race_Name)
VALUES (7, 'Half-Elf');
INSERT INTO Races (race_ID, race_Name)
VALUES (8, 'Half-Orc');
INSERT INTO Races (race_ID, race_Name)
VALUES (9, 'Tiefling');


-- Insert into Campaign 

INSERT INTO Campaign (campaign_ID, campaign_Name, dungeon_Master)
VALUES (1, 'Prison of Nomorrow', 'Rick Newton');
INSERT INTO Campaign (campaign_ID, campaign_Name, dungeon_Master)
VALUES (2, 'Advent of the Rustlands', 'Rick Newton');
INSERT INTO Campaign (campaign_ID, campaign_Name, dungeon_Master)
VALUES (3, 'Pomp and Tribulations', 'Lucinda Blythe');


-- Insert into Classes (Standard Player Handbook)


INSERT INTO Classes (class_ID, class_Name, class_Type)
VALUES (1, 'Barbarian', 'Martial');
INSERT INTO Classes (class_ID, class_Name, class_Type)
VALUES (2, 'Bard', 'Arcane');
INSERT INTO Classes (class_ID, class_Name, class_Type)
VALUES (3, 'Cleric', 'Divine');
INSERT INTO Classes (class_ID, class_Name, class_Type)
VALUES (4, 'Druid', 'Divine');
INSERT INTO Classes (class_ID, class_Name, class_Type)
VALUES (5, 'Fighter', 'Martial');
INSERT INTO Classes (class_ID, class_Name, class_Type)
VALUES (6, 'Monk', 'Martial');
INSERT INTO Classes (class_ID, class_Name, class_Type)
VALUES (7, 'Paladin', 'Martial');
INSERT INTO Classes (class_ID, class_Name, class_Type)
VALUES (8, 'Ranger', 'Martial');
INSERT INTO Classes (class_ID, class_Name, class_Type)
VALUES (9, 'Rogue', 'Martial');
INSERT INTO Classes (class_ID, class_Name, class_Type)
VALUES (10, 'Sorcerer', 'Arcane');
INSERT INTO Classes (class_ID, class_Name, class_Type)
VALUES (11, 'Warlock', 'Arcane');
INSERT INTO Classes (class_ID, class_Name, class_Type)
VALUES (12, 'Wizard', 'Arcane');


-- Insert into Players

INSERT INTO Players (first_Name, last_Name, campaign_ID)
VALUES ('Bob', 'Johnson', 1); 
INSERT INTO Players (first_Name, last_Name, campaign_ID)
VALUES ('Delia', 'Diamond', 1); 
INSERT INTO Players (first_Name, last_Name, campaign_ID)
VALUES ('Charlie', 'Brown', 1); 
INSERT INTO Players (first_Name, last_Name, campaign_ID)
VALUES ('Diana', 'White', 2);


-- Insert into Stat (basic DnD Stats)

INSERT INTO Stat (stat_ID, stat_Name)
VALUES (1, 'Strength');
INSERT INTO Stat (stat_ID, stat_Name)
VALUES (2, 'Dexterity');
INSERT INTO Stat (stat_ID, stat_Name)
VALUES (3, 'Constitution');
INSERT INTO Stat (stat_ID, stat_Name)
VALUES (4, 'Intelligence');
INSERT INTO Stat (stat_ID, stat_Name)
VALUES (5, 'Wisdom');
INSERT INTO Stat (stat_ID, stat_Name)
VALUES (6, 'Charisma');


-- Insert into Characters 

INSERT INTO Characters (char_ID, player_ID, race_ID, class_ID, campaign_ID, first_Name, last_Name, char_Level)
VALUES (1, 1, 1, 10, 1, 'Sevren', 'Stormhold', 7); 
INSERT INTO Characters (char_ID, player_ID, race_ID, class_ID, campaign_ID, first_Name, last_Name, char_Level)
VALUES (2, 3, 8, 5, 1, 'Jax', 'the Axe', 7); 
INSERT INTO Characters (char_ID, player_ID, race_ID, class_ID, campaign_ID, first_Name, last_Name, char_Level)
VALUES (3, 1, 4, 1, 1, 'Tarin', 'Spearbreaker', 5); 
INSERT INTO Characters (char_ID, player_ID, race_ID, class_ID, campaign_ID, first_Name, last_Name, char_Level)
VALUES (4, 2, 2, 4, 1, 'Adula', 'Moonstone', 7); 
INSERT INTO Characters (char_ID, player_ID, race_ID, class_ID, campaign_ID, first_Name, last_Name, char_Level)
VALUES (5, 2, 1, 9, 1, 'Button', 'Gutter', 7); 
INSERT INTO Characters (char_ID, player_ID, race_ID, class_ID, campaign_ID, first_Name, last_Name, char_Level)
VALUES (6, 3, 8, 6, 1, 'Viev', 'Scarab', 7); 
INSERT INTO Characters (char_ID, player_ID, race_ID, class_ID, campaign_ID, first_Name, last_Name, char_Level)
VALUES (7, 1, 1, 2, 2, 'Elandril', 'Brightwood', 12); 
INSERT INTO Characters (char_ID, player_ID, race_ID, class_ID, campaign_ID, first_Name, last_Name, char_Level)
VALUES (8, 2, 2, 1, 2, 'Thrain', 'Ironbeard', 12);   
INSERT INTO Characters (char_ID, player_ID, race_ID, class_ID, campaign_ID, first_Name, last_Name, char_Level)
VALUES (9, 3, 3, 4, 2, 'Longclaw', NULL, 12);    
INSERT INTO Characters (char_ID, player_ID, race_ID, class_ID, campaign_ID, first_Name, last_Name, char_Level)
VALUES (10, 4, 4, 3, 3, 'Grok', 'Skullcrusher', 1); 


-- Insert into Char_Statistics 

-- Sevren's Stats 

-- Strength
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (1, 1, 11); 

-- Dexterity

INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (1, 2, 16); 

-- Constitution
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (1, 3, 16); 

-- Intelligence
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (1, 4, 12); 


-- Wisdom
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (1, 5, 11); 

-- Charisma
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (1, 6, 20); 


-- Jax the Axe Stats

-- Strength
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (2, 1, 20); 

-- Dexterity
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (2, 2, 16); 

-- Constitution
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (2, 3, 15); 

-- Intelligence
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (2, 4, 10); 

-- Wisdom
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (2, 5, 12); 

-- Charisma
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (2, 6, 14); 


-- Tarin the Spearbreaker stats

-- Strength
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (3, 1, 20); 

-- Dexterity
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (3, 2, 16); 

-- Constitution
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (3, 3, 16); 

-- Intelligence
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (3, 4, 8); 

-- Wisdom
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (3, 5, 13); 

-- Charisma
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (3, 6, 10); 


-- Adula Moonstone's stats

-- Strength
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (4, 1, 14); 

-- Dexterity
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (4, 2, 13); 

-- Constitution
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (4, 3, 18); 

-- Intelligence
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (4, 4, 13); 

-- Wisdom
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (4, 5, 20); 

-- Charisma
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (4, 6, 14); 


-- Button Gutter's stats

-- Strength
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (5, 1, 14); 

-- Dexterity
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (5, 2, 20); 

-- Constitution
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (5, 3, 18); 

-- Intelligence
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (5, 4, 11); 

-- Wisdom
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (5, 5, 10); 

-- Charisma
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (5, 6, 16); 


-- Viev Scarab's stats

-- Strength
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (6, 1, 18); 

-- Dexterity
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (6, 2, 20); 

-- Constitution
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (6, 3, 14); 

-- Intelligence
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (6, 4, 14); 

-- Wisdom
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (6, 5, 18); 

-- Charisma
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (6, 6, 12); 


-- Elandril's stats 

-- Strength
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (7, 1, 8); 

-- Dexterity
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (7, 2, 14); 

-- Constitution
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (7, 3, 12); 

-- Intelligence
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (7, 4, 16); 

-- Wisdom
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (7, 5, 10); 

-- Charisma
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (7, 6, 11); 


-- Thrain's stats 

-- Strength
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (8, 1, 16); 

-- Dexterity
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (8, 2, 10); 

-- Constitution
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (8, 3, 14); 

-- Intelligence
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (8, 4, 8);

-- Wisdom
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (8, 5, 12); 

-- Charisma
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (8, 6, 10); 


-- Longclaw's stats 

-- Strength
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (9, 1, 10); 

-- Dexterity
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (9, 2, 16); 

-- Constitution
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (9, 3, 12); 

-- Intelligence
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (9, 4, 14); 

-- Wisdom
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (9, 5, 10); 

-- Charisma
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (9, 6, 12); 


-- Grok's stats 

-- Strength
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (10, 1, 10); 

-- Dexterity
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (10, 2, 16); 

-- Constitution
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (10, 3, 12); 

-- Intelligence
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (10, 4, 14); 

-- Wisdom
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (10, 5, 10); 

-- Charisma
INSERT INTO Char_Statistics (char_ID, stat_ID, stat_Num)
VALUES (10, 6, 12); 



-- Insert into Race_Stat

-- Dwarves get +2 Constitution
INSERT INTO Race_Stat (race_ID, stat_ID, bonus_value)
VALUES (1, 3, 2); 

-- Elves get +2 Dexterity
INSERT INTO Race_Stat (race_ID, stat_ID, bonus_value)
VALUES (2, 2, 2); 

-- Halfling get +2 Dexterity
INSERT INTO Race_Stat (race_ID, stat_ID, bonus_value)
VALUES (3, 2, 2); 

-- Human get +1 All (no idea how to do +1 to all) 
INSERT INTO Race_Stat (race_ID, stat_ID, bonus_value)
VALUES (4, 1, 1); 

-- Human get +1 All (no idea how to do +1 to all) 
INSERT INTO Race_Stat (race_ID, stat_ID, bonus_value)
VALUES (4, 2, 1); 

-- Human get +1 All (no idea how to do +1 to all) 
INSERT INTO Race_Stat (race_ID, stat_ID, bonus_value)
VALUES (4, 3, 1); 

-- Human get +1 All (no idea how to do +1 to all) 
INSERT INTO Race_Stat (race_ID, stat_ID, bonus_value)
VALUES (4, 4, 1); 

-- Human get +1 All (no idea how to do +1 to all) 
INSERT INTO Race_Stat (race_ID, stat_ID, bonus_value)
VALUES (4, 5, 1); 

-- Human get +1 All (no idea how to do +1 to all) 
INSERT INTO Race_Stat (race_ID, stat_ID, bonus_value)
VALUES (4, 6, 1); 

-- Dragonborn get +2 Strength
INSERT INTO Race_Stat (race_ID, stat_ID, bonus_value)
VALUES (5, 1, 2); 

-- Gnome get +2 Intelligence
INSERT INTO Race_Stat (race_ID, stat_ID, bonus_value)
VALUES (6, 4, 2); 

-- Half-Elf get NULL
INSERT INTO Race_Stat (race_ID, stat_ID, bonus_value)
VALUES (7, 6, 2); 

-- Half-Orc get +2 Strength
INSERT INTO Race_Stat (race_ID, stat_ID, bonus_value)
VALUES (8, 1, 2); 

-- Tiefling get +2 Charisma
INSERT INTO Race_Stat (race_ID, stat_ID, bonus_value)
VALUES (9, 6, 2); 


COMMIT;