-- Team members: Seth Baker & Aleksis Livshits  --

-- INSERT and SELECT Methods for Each Table 

-- SELECT for Users
SELECT * from Users;

-- INSERT into Users
INSERT INTO Users(userName, userBudget) VALUES (:userName, :userBudget);

-- SELECT for Distances
SELECT * from Distances;

-- INSERT into Distances
INSERT INTO Distances(distanceID, distanceTraveled, travelID) VALUES (:distanceID, :distanceTraveled, :travelID);

-- INSERT into Costs
INSERT INTO Costs (totalCost, currency, userID, distanceID) VALUES (:totalCost, :currency, :userID, :distanceID)

-- SELECT for Locations
SELECT * from Locations;

-- INSERT into Locations
INSERT INTO Locations(locationID, countryTravel, stateTravel) VALUES (:locationID, :countryTravel, :stateTravel);

-- SELECT for Methods
SELECT * from Methods;

-- INSERT into Methods
INSERT INTO Methods (carTransport, planeTransport, trainTransport, walkingDistance, userID, locationID) VALUES (:carTransport, :planeTransport, :trainTransport, :walkingDistance, :userID, :locationID)

-- UPDATE Methods

UPDATE Users
SET userBudget = :userBudget,
WHERE userID = :userID;

UPDATE Distances 
SET distanceTraveled = :distanceTraveled,
WHERE distanceID = :distanceID;

UPDATE Locations
SET countryTravel = :countryTravel AND stateTravel = :stateTravel,
WHERE locationID = :locationID;

UPDATE Methods
SET carTransport = :carTransport,
WHERE methodID = :methodID;

UPDATE Costs
SET totalCost = :totalCost 
WHERE costID = :costID;

-- 

-- DELETE a User or Location
DELETE FROM Users WHERE userName = :userName;

DELETE FROM Distances WHERE distanceTraveled = :distanceTraveled;

DELETE FROM Methods WHERE carTransport = :carTransport, planeTransport = :planeTransport, trainTransport = :trainTransport, walkingDistance = :walkingDistance;

DELETE FROM Costs WHERE totalCost = :totalCost;

DELETE FROM Locations WHERE countryTravel = :countryTravel;

-- Retrieve Distances Traveled by Each User Example:
SELECT U.userName, D.distanceTraveled FROM Users U JOIN Costs C ON U.userID = C.userID JOIN Distances D ON C.distanceID = D.distanceID;

-- Calculate Total Costs for Each User Example:
SELECT U.userName, SUM(C.totalCost) AS TotalCost FROM Users U JOIN Costs C ON U.userID = C.userID GROUP BY U.userName;

-- Listing all transportation methods used by the users example:
SELECT U.userName, M.carTransport, M.planeTransport, M.trainTransport FROM Users U JOIN Methods M ON U.userID = M.userID;