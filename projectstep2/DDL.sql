-- Team members: Seth Baker & Aleksis Livshits  --

-- Citation:
-- From CS340 - Project Step 2 Draft: Normalized Schema + DDL with Sample Data
-- Source URL: https://canvas.oregonstate.edu/courses/1976520/assignments/9783693?module_item_id=24719057

SET FOREIGN_KEY_CHECKS=0;
SET AUTOCOMMIT = 0;

-- Citation:
-- Based on CREATE/INSERT table function from CS340 - Activity 1: Creating a Customer Object Table
-- Source URL: https://canvas.oregonstate.edu/courses/1976520/pages/activity-1-creating-a-customer-object-table?module_item_id=24719034

CREATE OR REPLACE TABLE Users (
    userID int AUTO_INCREMENT UNIQUE NOT NULL,
    userName varchar(255) NOT NULL,
    userBudget varchar(255),
	PRIMARY KEY (userID)
);

CREATE OR REPLACE TABLE Distances (
    distanceID int AUTO_INCREMENT UNIQUE NOT NULL,
    distanceTraveled decimal NOT NULL,
    travelID varchar(255) NOT NULL,
	PRIMARY KEY (distanceID)
);

CREATE OR REPLACE TABLE Costs (
    costID int AUTO_INCREMENT UNIQUE NOT NULL,
    totalCost: decimal, not NULL,
    currency varchar(255) NOT NULL,
    userID int UNIQUE NOT NULL,
    distanceID int UNIQUE NOT NULL
	PRIMARY KEY (costID), 
	FOREIGN KEY (userID) REFERENCES Users(userID),
    FOREIGN KEY (distanceID) REFERENCES Distance(distanceID)
);

CREATE OR REPLACE TABLE Locations (
    locationID int AUTO_INCREMENT UNIQUE NOT NULL,
    countryTravel varchar(255),
    stateTravel varchar(255), 
	PRIMARY KEY (locationID),
    FOREIGN KEY (methodID) REFERENCES Methods(methodID),
);

CREATE OR REPLACE TABLE Methods (
	methodID int auto_increment UNIQUE NOT NULL, 
	countryTravel varchar(255), 
	stateTravel varchar(255),
	PRIMARY KEY (locationID),
	FOREIGN KEY (userID) REFERENCES Users(userID),
	FOREIGN KEY (locationID) REFERENCES Locations(locationID)
);

DESCRIBE Users; 
DESCRIBE Distances; 
DESCRIBE Costs;
DESCRIBE Locations;
DESCRIBE Methods;
