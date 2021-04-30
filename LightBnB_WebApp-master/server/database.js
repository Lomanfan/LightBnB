const properties = require('./json/properties.json');
const users = require('./json/users.json');
const { Pool } = require('pg');

//Connect to the Lightbnb database
// psql -h localhost -p 3000 -U vagrant lightbnb
const pool = new Pool({            
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'lightbnb'
});

/// Users
/**
 * Get a single user from the database given their email.
 * @param {String} email The email of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithEmail = function(email) {
  // let user;
  // for (const userId in users) {
  //   user = users[userId];
  //   if (user.email.toLowerCase() === email.toLowerCase()) {
  //     break;
  //   } else {
  //     user = null;
  //   }
  // }
  // return Promise.resolve(user);
  return pool.query(`SELECT * FROM users
  WHERE email = $1`, [email])
  .then(res => res.rows.length > 0 ? res.rows[0] : null);
}
exports.getUserWithEmail = getUserWithEmail;

/**
 * Get a single user from the database given their id.
 * @param {string} id The id of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithId = function(id) {
  // return Promise.resolve(users[id]);
  return pool.query(`SELECT * FROM users 
  WHERE id = $1`, [id])
  .then(res => res.rows.length > 0 ? res.rows[0] : null)
  .catch((err) => {
    console.log("getUserWithIdFromDB",err.message);
  })
}
exports.getUserWithId = getUserWithId;

/**
 * Add a new user to the database.
 * @param {{name: string, password: string, email: string}} user
 * @return {Promise<{}>} A promise to the user.
 */
const addUser =  function(user) {
  // const userId = Object.keys(users).length + 1;
  // user.id = userId;
  // users[userId] = user;
  // return Promise.resolve(user);
  return pool.query(`INSERT INTO users (name, email, password) 
  VALUES ($1, $2, $3) RETURNING *;`,[user.name, user.email, user.password])
  .then(res => res.rows[0])
  .catch((err) => {
    console.log("addUserToDB",err.message);
  })
}
exports.addUser = addUser;

/// Reservations

/**
 * Get all reservations for a single user.
 * @param {string} guest_id The id of the user.
 * @return {Promise<[{}]>} A promise to the reservations.
 */
const getAllReservations = function(guest_id, limit = 10) {
  // return getAllProperties(null, 2);
  return pool.query(`SELECT properties.id, title, cost_per_night, reservations.start_date, AVG(property_reviews.rating) as average_rating
  FROM reservations
  JOIN properties ON properties.id = property_id
  JOIN property_reviews ON properties.id = property_reviews.property_id
  WHERE reservations.guest_id = $1
        AND reservations.end_date < now()::date
  GROUP BY properties.id, reservations.id
  ORDER BY start_date
  LIMIT $2;`, [guest_id, limit])
  .then(res => res.rows)
  .catch((err) => {
    console.log("getAllReservationFromDB",err.message);
  })
}
exports.getAllReservations = getAllReservations;

/// Properties
/**
 * Get all properties.
 * @param {{}} options An object containing query options.
 * @param {*} limit The number of results to return.
 * @return {Promise<[{}]>}  A promise to the properties.
 */
const getAllProperties = function(options, limit = 10) {
  const queryParams = [];

  let queryString = `
  SELECT properties.*, avg(property_reviews.rating) as average_rating
  FROM properties
  JOIN property_reviews ON properties.id = property_id
  WHERE TRUE`;

  if(options.city) {
    queryParams.push(`%${options.city}%`);
    queryString += ` AND city LIKE $${queryParams.length} `;
  }

  if(options.owner_id) {
    console.log("owner_id", options.owner_id);
    queryParams.push(`${options.owner_id}`);
    queryString += ` AND owner_id = $${queryParams.length} `;
  }

  if(options.minimum_price_per_night && options.maximum_price_per_night) {
    queryParams.push(parseInt(options.minimum_price_per_night) * 100);
    queryParams.push(parseInt(options.maximum_price_per_night) * 100);
    queryString += ` AND cost_per_night BETWEEN $${queryParams.length-1} AND $${queryParams.length} `;
  }

  queryString += ` GROUP BY properties.id, property_reviews.rating `;
  if(options.minimum_rating) {
    queryParams.push(parseInt(options.minimum_rating));
    queryString += ` HAVING avg(property_reviews.rating) >= $${queryParams.length} `;
  }

  queryString += ` ORDER BY cost_per_night `;

  queryParams.push(limit);
  queryString += ` LIMIT $${queryParams.length};`;

  // console.log({queryString, queryParams});
  return pool.query(queryString, queryParams).then((res) => {console.log("-----------------",res.rows); return res.rows});
};

exports.getAllProperties = getAllProperties;


/**
 * Add a property to the database
 * @param {{}} property An object containing all of the property details.
 * @return {Promise<{}>} A promise to the property.
 */
const addProperty = function(property) {
  const propertyId = Object.keys(properties).length + 1;
  property.id = propertyId;
  properties[propertyId] = property;
  return Promise.resolve(property);
}
exports.addProperty = addProperty;
