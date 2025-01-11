const PORT = 12000;
const express = require('express');
const path = require('path');
const db = require('./db-connector');
const app = express();
const bodyParser = require('body-parser');

app.use(express.static(path.join(__dirname)));
app.use(bodyParser.json());

// Serve index.html at the root route
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'index.html'));
});

// Register route
app.post('/register', (req, res) => {
    const { username, password } = req.body;
    const query = 'INSERT INTO Users (userName, password) VALUES (?, ?)';
    db.query(query, [username, password], (err, results) => {
      if (err) {
        res.status(500).json({ message: 'Registration failed' });
        return;
      }
      res.status(201).json({ message: 'Registration successful' });
    });
  });
  
// Login route
app.post('/login', (req, res) => {
    const { username, password } = req.body;
    const query = 'SELECT * FROM Users WHERE userName = ? AND password = ?';
    db.query(query, [username, password], (err, results) => {
      if (err || results.length === 0) {
        res.status(401).json({ message: 'Login failed' });
        return;
      }
      res.status(200).json({ userID: results[0].userID });
    });
});
  


// Routes for Users
app.get('/users', (req, res) => {
    db.query('SELECT * FROM Users', (err, results) => {
        if (err) {
            console.error('Error fetching users:', err);
            return res.status(500).json({ error: 'Error fetching users' });
        }
        res.json(results);
    });
});

app.post('/users', (req, res) => {
    const { userID, userName, userBudget } = req.body;

    if (!userID || !userName || !userBudget) {
        return res.status(400).json({ error: 'A UserID, userName and userBudget are required' });
    }

    db.query('INSERT INTO Users (userID, userName, userBudget) VALUES (?, ?, ?)', [userID, userName, userBudget], (err, results) => {
        if (err) {
            console.error('Error inserting user:', err);
            return res.status(500).json({ error: 'Error adding user' });
        }
        res.json({ message: 'User added successfully!', userID: results.insertId });
    });
});

app.put('/users/:id', (req, res) => {
    const { id } = req.params;
    const { userBudget } = req.body;

    if (!userBudget) {
        return res.status(400).json({ error: 'userBudget is required' });
    }

    db.query('UPDATE Users SET userBudget = ? WHERE userID = ?', [userBudget, id], (err, results) => {
        if (err) {
            console.error('Error updating user:', err);
            return res.status(500).json({ error: 'Error updating user' });
        }
        console.log('Update Results:', results); // Log the results
        res.json({ message: 'User updated successfully!' });
    });
});

app.delete('/users/:id', (req, res) => {
    const { id } = req.params;

    db.query('DELETE FROM Users WHERE userID = ?', [id], (err, results) => {
        if (err) {
            console.error('Error deleting user:', err);
            return res.status(500).json({ error: 'Error deleting user' });
        }
        console.log('Delete Results:', results); // Log the results
        res.json({ message: 'User deleted successfully!' });
    });
});




// Routes for Costs
app.get('/costs', (req, res) => {
    db.query('SELECT * FROM Costs', (err, results) => {
        if (err) {
            console.error('Error fetching costs:', err);
            return res.status(500).json({ error: 'Error fetching costs' });
        }
        res.json(results);
    });
});

app.post('/costs', (req, res) => {
    const { totalCost, currency, userID, distanceID } = req.body;

    if (!totalCost || !currency || !userID || !distanceID) {
        return res.status(400).json({ error: 'All fields (totalCost, currency, userID, distanceID) are required' });
    }

    db.query('INSERT INTO Costs (totalCost, currency, userID, distanceID) VALUES (?, ?, ?, ?)', [totalCost, currency, userID, distanceID], (err, results) => {
        if (err) {
            console.error('Error inserting cost:', err);
            return res.status(500).json({ error: 'Error adding cost' });
        }
        res.json({ message: 'Cost added successfully!', costID: results.insertId });
    });
});

app.put('/costs/:id', (req, res) => {
    const { id } = req.params;
    const { totalCost, currency, userID, distanceID } = req.body;

    if (!totalCost || !currency || !userID || !distanceID) {
        return res.status(400).json({ error: 'All fields (totalCost, currency, userID, distanceID) are required' });
    }

    db.query('UPDATE Costs SET totalCost = ?, currency = ?, userID = ?, distanceID = ? WHERE costID = ?', 
        [totalCost, currency, userID, distanceID, id], 
        (err, results) => {
     if (err) {
         console.error('Error updating cost:', err);
         return res.status(500).json({ error: 'Error updating cost' });
     }
     console.log('Update Results:', results); // Log the results
     res.json({ message: 'Cost updated successfully!' });
 });
});

app.delete('/costs/:id', (req, res) => {
    const { id } = req.params;

    db.query('DELETE FROM Costs WHERE costID = ?', [id], (err, results) => {
        if (err) {
            console.error('Error deleting cost:', err);
            return res.status(500).json({ error: 'Error deleting cost' });
        }
        console.log('Delete Results:', results); // Log the results
        res.json({ message: 'Cost deleted successfully!' });
    });
});



// Routes for Distances
app.get('/distances', (req, res) => {
    db.query('SELECT * FROM Distances', (err, results) => {
        if (err) {
            console.error('Error fetching distances:', err);
            return res.status(500).json({ error: 'Error fetching distances' });
        }
        res.json(results);
    });
});

// Add a new distance
app.post('/distances', (req, res) => {
    const { distance_traveled, travel_id } = req.body;

    if (!distance_traveled || !travel_id) {
        return res.status(400).json({ error: 'Both distance_traveled and travel_id are required' });
    }

    db.query(
        'INSERT INTO Distances (distanceTraveled, travelID) VALUES (?, ?)',
        [distance_traveled, travel_id],
        (err, results) => {
            if (err) {
                console.error('Error inserting distance:', err);
                return res.status(500).json({ error: 'Error adding distance' });
            }
            res.json({ message: 'Distance added successfully!', distanceID: results.insertId });
        }
    );
});

// Update a distance
app.put('/distances/:id', (req, res) => {
    const { id } = req.params;
    const { distance_traveled, travel_id } = req.body;

    db.query(
        'UPDATE Distances SET distanceTraveled = ?, travelID = ? WHERE distanceID = ?',
        [distance_traveled, travel_id, id],
        (err, results) => {
            if (err) {
                console.error('Error updating distance:', err);
                return res.status(500).json({ error: 'Error updating distance' });
            }
            res.json({ message: 'Distance updated successfully!' });
        }
    );
});


// Delete a distance
app.delete('/distances/:id', (req, res) => {
    const { id } = req.params;

    db.query('DELETE FROM Distances WHERE distanceID = ?', [id], (err, results) => {
        if (err) {
            console.error('Error deleting distance:', err);
            return res.status(500).json({ error: 'Error deleting distance' });
        }
        if (results.affectedRows === 0) {  
            return res.status(404).json({ error: 'Distance not found' });
        }
        res.json({ message: 'Distance deleted successfully!' });
    });
});




// Get all locations
app.get('/locations', (req, res) => {
    db.query('SELECT * FROM Locations', (err, results) => {
        if (err) {
            console.error('Error fetching locations:', err);
            return res.status(500).json({ error: 'Error fetching locations' });
        }
        res.json(results);
    });
});

// Add a new location
app.post('/locations', (req, res) => {
    const { locationID, countryTravel, stateTravel } = req.body;

    // Validate input fields
    if (!locationID || !countryTravel || !stateTravel) {
        return res.status(400).json({ error: 'Missing required fields' });
    }

    const query = 'INSERT INTO Locations (locationID, countryTravel, stateTravel) VALUES (?, ?, ?)';
    db.query(query, [locationID, countryTravel, stateTravel], (err, result) => {
        if (err) {
            console.error('Error adding location:', err);
            return res.status(500).json({ error: 'Database error' });
        }
        res.status(200).json({ message: 'Location added successfully' });
    });
});

// Update a location
app.put('/locations/:id', (req, res) => {
    const { id } = req.params;  // id corresponds to locationID
    const { countryTravel, stateTravel } = req.body;

    // Validate input fields
    if (!countryTravel || !stateTravel) {
        return res.status(400).json({ error: 'Missing required fields' });
    }

    // First, check if the location exists
    db.query('SELECT * FROM Locations WHERE locationID = ?', [id], (err, results) => {
        if (err) {
            console.error('Error checking location existence:', err);
            return res.status(500).json({ error: 'Database error' });
        }
        if (results.length === 0) {
            return res.status(404).json({ error: 'Location not found' });
        }

        // Proceed with the update if the location exists
        db.query(
            'UPDATE Locations SET countryTravel = ?, stateTravel = ? WHERE locationID = ?',
            [countryTravel, stateTravel, id],
            (err, results) => {
                if (err) {
                    console.error('Error updating location:', err);
                    return res.status(500).json({ error: 'Error updating location' });
                }
                res.json({ message: 'Location updated successfully!' });
            }
        );
    });
});

// Delete a location
app.delete('/locations/:id', (req, res) => {
    const { id } = req.params;  // id corresponds to locationID

    db.query('DELETE FROM Locations WHERE locationID = ?', [id], (err, results) => {
        if (err) {
            console.error('Error deleting location:', err);
            return res.status(500).json({ error: 'Error deleting location' });
        }
        if (results.affectedRows === 0) {
            return res.status(404).json({ error: 'Location not found' });
        }
        res.json({ message: 'Location deleted successfully!' });
    });
});




// GET all methods
app.get('/methods', (req, res) => {
    db.query('SELECT methodID, carTransport, planeTransport, trainTransport, walkingDistance, userID, locationID FROM Methods', (err, results) => {
        if (err) return res.status(500).send(err);
        res.json(results);
    });
});

// GET single method by ID
app.get('/methods/:id', (req, res) => {
    const query = 'SELECT * FROM Methods WHERE methodID = ?';
    db.query(query, [req.params.id], (err, results) => {
        if (err) return res.status(500).send(err);
        if (results.length === 0) return res.status(404).send('Method not found');
        res.json(results[0]); // Send the first (and only) result
    });
});

// POST create a new method
app.post('/methods', (req, res) => {
    console.log('Request body:', req.body); // Log received data
    const { carTransport, planeTransport, trainTransport, walkingDistance, userID, locationID } = req.body;

    // Ensure all required fields are provided
    if (!carTransport || !planeTransport || !trainTransport || !walkingDistance || !userID || !locationID) {
        return res.status(400).json({ message: 'Missing required fields' });
    }

    const query = `
        INSERT INTO Methods (carTransport, planeTransport, trainTransport, walkingDistance, userID, locationID)
        VALUES (?, ?, ?, ?, ?, ?)
    `;
    
    db.query(query, [carTransport, planeTransport, trainTransport, walkingDistance, userID, locationID], (err, results) => {
        if (err) {
            console.error('Database error:', err); // Log database error
            return res.status(500).send(err);
        }

        // Check if insert was successful and return the methodID
        if (results && results.insertId) {
            res.status(201).json({
                message: 'Method added successfully!',
                methodID: results.insertId
            });
        } else {
            res.status(500).json({ message: 'Error inserting method.' });
        }
    });
});

// PUT update a method
app.put('/methods/:id', (req, res) => {
    const { carTransport, planeTransport, trainTransport, walkingDistance } = req.body;
    const query = 'UPDATE Methods SET carTransport = ?, planeTransport = ?, trainTransport = ?, walkingDistance = ? WHERE methodID = ?';
    db.query(query, [carTransport, planeTransport, trainTransport, walkingDistance, req.params.id], (err, results) => {
        if (err) return res.status(500).send(err);
        if (results.affectedRows === 0) return res.status(404).send('Method not found');
        res.json({
            methodID: req.params.id,
            carTransport, planeTransport, trainTransport, walkingDistance
        });
    });
});

// DELETE a method
app.delete('/methods/:id', (req, res) => {
    const query = 'DELETE FROM Methods WHERE methodID = ?';
    db.query(query, [req.params.id], (err, results) => {
        if (err) return res.status(500).send(err);
        res.json(results);
    });
});

// GET: Fetch all distance-cost associations
app.get('/distanceCosts', async (req, res) => {
    try {
        const [results] = await db.query('SELECT * FROM distanceCosts');
        res.status(200).json(results);
    } catch (error) {
        console.error('Error fetching distance costs:', error);
        res.status(500).json({ error: 'Failed to fetch distance costs' });
    }
});

// POST: Add a new distance-cost association
app.post('/distanceCosts', async (req, res) => {
    const { distanceID, costID } = req.body;
    if (!distanceID || !costID) {
        return res.status(400).json({ error: 'distanceID and costID are required' });
    }

    try {
        // Check if the distanceID exists in the Distances table
        const [[distanceCheck]] = await db.query('SELECT distanceID FROM Distances WHERE distanceID = ?', [distanceID]);
        if (!distanceCheck) {
            return res.status(400).json({ error: 'Invalid distanceID' });
        }

        // Check if the costID exists in the Costs table
        const [[costCheck]] = await db.query('SELECT costID FROM Costs WHERE costID = ?', [costID]);
        if (!costCheck) {
            return res.status(400).json({ error: 'Invalid costID' });
        }

        // If both IDs are valid, insert the association
        const query = 'INSERT INTO distanceCosts (distanceID, costID) VALUES (?, ?)';
        const [result] = await db.query(query, [distanceID, costID]);
        res.status(201).json({ message: 'Association added successfully', result });
    } catch (error) {
        console.error('Error adding distance cost:', error);
        res.status(500).json({ error: 'Failed to add distance cost' });
    }
});

// PUT: Update an existing distance-cost association
app.put('/distanceCosts/:distanceID/:costID', async (req, res) => {
    const { distanceID, costID } = req.params;
    const { newDistanceID, newCostID } = req.body;

    if (!newDistanceID || !newCostID) {
        return res.status(400).json({ error: 'newDistanceID and newCostID are required' });
    }

    try {
        const query = `
            UPDATE distanceCosts
            SET distanceID = ?, costID = ?
            WHERE distanceID = ? AND costID = ?`;
        const [result] = await db.query(query, [newDistanceID, newCostID, distanceID, costID]);
        if (result.affectedRows === 0) {
            return res.status(404).json({ error: 'No matching association found' });
        }
        res.status(200).json({ message: 'Association updated successfully', result });
    } catch (error) {
        console.error('Error updating distance cost:', error);
        res.status(500).json({ error: 'Failed to update distance cost' });
    }
});

// DELETE: Remove a distance-cost association
app.delete('/distanceCosts/:distanceID/:costID', async (req, res) => {
    const { distanceID, costID } = req.params;

    try {
        const query = 'DELETE FROM distanceCosts WHERE distanceID = ? AND costID = ?';
        const [result] = await db.query(query, [distanceID, costID]);
        if (result.affectedRows === 0) {
            return res.status(404).json({ error: 'No matching association found' });
        }
        res.status(200).json({ message: 'Association deleted successfully', result });
    } catch (error) {
        console.error('Error deleting distance cost:', error);
        res.status(500).json({ error: 'Failed to delete distance cost' });
    }
});



// GET: Fetch all location-method associations
app.get('/locationMethods', async (req, res) => {
    try {
        const [results] = await db.query(`
            SELECT locationMethods.locationID, locationMethods.methodID, 
                   Locations.countryTravel, Locations.stateTravel, 
                   Methods.carTransport, Methods.planeTransport, Methods.trainTransport 
            FROM locationMethods
            JOIN Locations ON locationMethods.locationID = Locations.locationID
            JOIN Methods ON locationMethods.methodID = Methods.methodID
        `);
        res.status(200).json(results);
    } catch (error) {
        console.error('Error fetching location-methods:', error);
        res.status(500).json({ error: 'Failed to fetch location-methods' });
    }
});

// POST: Add a new location-method association
app.post('/locationMethods', async (req, res) => {
    const { locationID, methodID } = req.body;
    if (!locationID || !methodID) {
        return res.status(400).json({ error: 'locationID and methodID are required' });
    }

    try {
        const query = 'INSERT INTO locationMethods (locationID, methodID) VALUES (?, ?)';
        const [result] = await db.query(query, [locationID, methodID]);
        res.status(201).json({ message: 'Location-method association added successfully', result });
    } catch (error) {
        console.error('Error adding location-method:', error);
        res.status(500).json({ error: 'Failed to add location-method' });
    }
});


// DELETE: Remove a location-method association
app.delete('/locationMethods', async (req, res) => {
    const { locationID, methodID } = req.query;

    if (!locationID || !methodID) {
        return res.status(400).json({ error: 'locationID and methodID are required' });
    }

    try {
        const query = 'DELETE FROM locationMethods WHERE locationID = ? AND methodID = ?';
        const [result] = await db.query(query, [locationID, methodID]);
        if (result.affectedRows === 0) {
            return res.status(404).json({ error: 'No matching location-method found' });
        }
        res.status(200).json({ message: 'Location-method association deleted successfully', result });
    } catch (error) {
        console.error('Error deleting location-method:', error);
        res.status(500).json({ error: 'Failed to delete location-method' });
    }
});


// Start Server
app.listen(PORT, function () {
    console.log(`Express started on http://classwork.engr.oregonstate.edu:12000${PORT}; press Ctrl-C to terminate.`);
});
