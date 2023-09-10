//Create entities
db.createCollection("USER");
db.createCollection("ADMIN");
db.createCollection("SALES_REPS");
db.createCollection("CATEGORY");
db.createCollection("PRODUCTS");
db.createCollection("SALES_REPS_PRODUCTS");
db.createCollection("CUSTOMER");
db.createCollection("SELECT_PRODUCTS");
db.createCollection("SELECTED_PRODUCTS");
db.createCollection("PAYMENT");
db.createCollection("FEEDBACK");

// Inserting records
db.USER.insertOne ({id: 4, email: "example@gmail.com", username: "Crown", phone_number: "234568879", address: "23, pluto, planet", gender: "female"});
db.SALES_REPS.insertOne ({id: 15, user_id: 6, firstname: "mongo", lastname: "nosql"});
db.ADMIN.insertOne ({id: 1, user_id: 34, token: "yol354o3432", firstname: "bosset", lastname: "don"});

// Getting Records
db.USER.findOne({id: 3});
db.ADMIN.findOne({token: "yol345o****"});
db.PRODUCTS.findOne({product_name: "Prada"});

// Update Records
db.ADMIN.updateOne({id: 1},
{$set: {token: "yo**********"}});
db.PRODUCTS.updateMany({product_name: "prada"},
  {$set: {size: "38"}});

  // Delete Records
  db.USER.deleteOne ({_id: 1});
  db.ADMIN.deleteOne ({_id: 1});
  db.PRODUCTS.deleteMany ({size: 'big'});