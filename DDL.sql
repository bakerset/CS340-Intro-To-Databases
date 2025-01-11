-- Team members: Seth Baker & Aleksis Livshits  --

-- Citation:
-- From CS340 - Project Step 2 Draft: Normalized Schema + DDL with Sample Data
-- Source URL: https://canvas.oregonstate.edu/courses/1976520/assignments/9783693?module_item_id=24719057

SET FOREIGN_KEY_CHECKS=0;
SET AUTOCOMMIT = 0;

-- Citation:
-- From CS340 - Activity 1: Creating a Customer Object Table
-- Source URL: https://canvas.oregonstate.edu/courses/1976520/pages/activity-1-creating-a-customer-object-table?module_item_id=24719034

-- This table is created to store user information
CREATE OR REPLACE TABLE Users (
    userID int AUTO_INCREMENT UNIQUE NOT NULL,
    userName varchar(255) NOT NULL,
    userBudget decimal,
    PRIMARY KEY (userID)
);

-- This table is created to record the distances traveled
CREATE OR REPLACE TABLE Distances (
    distanceID int AUTO_INCREMENT UNIQUE NOT NULL,
    distanceTraveled decimal NOT NULL,
    travelID varchar(255) NOT NULL,
    PRIMARY KEY (distanceID)
);

-- This table stores travel locations
CREATE OR REPLACE TABLE Locations (
    locationID int AUTO_INCREMENT UNIQUE NOT NULL,
    countryTravel varchar(255),
    stateTravel varchar(255), 
    PRIMARY KEY (locationID)
);

-- This table stores transportation methods used by users
CREATE OR REPLACE TABLE Methods (
    methodID int AUTO_INCREMENT UNIQUE NOT NULL, 
    carTransport varchar(255),
    planeTransport varchar(255),
    trainTransport varchar(255),
    walkingDistance int,
    userID int NOT NULL,
    locationID int NOT NULL,
    PRIMARY KEY (methodID),
    FOREIGN KEY (userID) REFERENCES Users(userID) ON DELETE CASCADE,
    FOREIGN KEY (locationID) REFERENCES Locations(locationID) ON DELETE CASCADE
);

-- This table will manage the costs associated with travel.
CREATE OR REPLACE TABLE Costs (
    costID int AUTO_INCREMENT UNIQUE NOT NULL,
    totalCost decimal NOT NULL,
    currency varchar(255) NOT NULL,
    userID int NOT NULL,
    distanceID int NOT NULL,
    PRIMARY KEY (costID), 
    FOREIGN KEY (userID) REFERENCES Users(userID) ON DELETE CASCADE,
    FOREIGN KEY (distanceID) REFERENCES Distances(distanceID) ON DELETE CASCADE
);

DESCRIBE Users; 
DESCRIBE Distances; 
DESCRIBE Locations; 
DESCRIBE Methods; 
DESCRIBE Costs;

-- INSERT METHODS --
-- Below, the SQL shows the values from the PDF which will be entered into their respective tables. -- 


INSERT INTO Users (userName, userBudget) VALUES 
("James Bond", 1500),
("Keanu Reeves", 2000),
("Hannibal Lecter", 1200);

-- Inserting sample locations into the Locations table
INSERT INTO Locations (countryTravel, stateTravel) VALUES
("USA", "CA"),
("USA", "NY"),
("USA", "OK");

-- Inserting distances into the Distances table
INSERT INTO Distances (distanceTraveled, travelID) VALUES
(200, 1),
(300, 2),
(1000, 3);

-- Inserting costs into the Costs table
INSERT INTO Costs (totalCost, currency, userID, distanceID) VALUES
(300, "USD", 1, 1),
(500, "USD", 1, 2),
(700, "USD", 2, 3);

-- Inserting distances costs
INSERT INTO distanceCosts (distanceID, costID) VALUES
(1, 1);

-- Inserts transportation methods into the Methods table.
INSERT INTO Methods (carTransport, planeTransport, trainTransport, walkingDistance, userID, locationID) VALUES
("Honda Civic", NULL, NULL, 0, 1, 1),
(NULL, "Boeing 747", NULL, 0, 2, 2),
(NULL, NULL, "VIA Rail", 0, 3, 3);

SET FOREIGN_KEY_CHECKS=1;
COMMIT;
