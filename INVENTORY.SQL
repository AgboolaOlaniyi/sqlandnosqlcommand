db.createCollection("users");
db.createCollection("sales_people");
db.createCollection("admins");
db.createCollection("customers");
db.createCollection("payment");
db.createCollection("products");
db.createCollection("orders");

// TO INSERT RECORDS INTO ENTITIES(COLLECTIONS)
db.users.insertMany([
    {
            "username": " agbo123",
            "password": "neyo4top69",
            "email": "neyo4top@gmail.com",
            "phone_number": "08083683768",
            "address": "13, Olisa adeniyi st, Lagos, Nigeria",
            "gender": "male"
          },

     {
     
        "username": "fajana123",
        "password": "faja169",
        "email": "fajananik@gmail.com",
        "phone_number": "09152737201",
        "address": "13, Olisa adeniyi st, Abule egba, Lagos, Nigeria",
        "gender": "female"
      },
      {
        "username": "taiwo567",
        "password": "taiwo123",
        "email": "taiwoadeboye@gmail.com",
        "phone_number": "08033685767",
        "address": "15, Badmus Orioye st, Abule egba, Lagos, Nigeria",
        "gender": "female"
      }
    
    ]);
          db.customers.insertMany([
            {
                    "lastName": "Agboola",
                    "firstName": "Olaniyi",
                    "country": "Nigeria",
                    "city": "Lagos",
                    "region": "Abule egba",
                    "postal_code": "10001"
                  },
                  {
                    "lastName": "Fajana",
                    "firstName": "adenike",
                    "country": "Nigeria",
                    "city": "Lagos",
                    "region": "Pusola",
                    "postal_code": "1003"
                  },
         ]);

         db.admins.insertMany([
            {
                "firstName": "Ayobami",
                "lastName": "Agboola"
              },
              {
                "firstName": "Kolade",
                "lastName": "Kayode"
              },
         ]);
         db.sales_people.insertMany([
            {
                "firstName": "Victor",
                "lastName": "John"
              },

              {
                "firstName": "Micheal",
                "lastName": "Adebayo"
              },
         ]);
         db.orders.insertMany([
            {
                "shipCountry": "Nigeria",
                "shipCity": "Lagos",
                "shipRegion": "Abule-egba",
                "shipAddress": "13 Olisa Adeniyi street",
                "shipPostalCode": "10001",
                "quantityOnOrder": "2"
              },
              {
                "shipCountry": "Nigeria",
                "shipCity": "Akure",
                "shipAddress": "75 Alagbaka street",
                "shipPostalCode": "000843",
                "quantityOnOrder": "3"
              },
            ]);
            db.products.insertMany([
                {
                        "name": "spaghetti",
                        "price": "700",
                        "size": "small",
                        "description": "One packet of spagehetti"
                      },
                 {
                        "name": "flour",
                        "price": "1000",
                        "size": "medium",
                        "description": "A bag of flour"
                      },
                      {
                
                        "name": "Indomie",
                        "price": "1800",
                        "size": "large",
                        "descritption": "Two packet of Indomie"
                      },
                    ]);

    //TO EXECUTE THE RELATIONSHIP BETEWEEN THE ENTITIES(COLLECTIONS).

//FOR ADMINS
db.admins.aggregate([
    {
      $lookup: {
        from: "users",
        localField: "_id",
        foreignField: "users_id",
        as: "user",
      },
    },
  ]);
  
  //FOR CUSTOMERS
  db.customers.aggregate([
    {
      $lookup: {
        from: "users",
        localField: "_id",
        foreignField: "users_id",
        as: "user",
      },
    },
  ]);
  
  //FOR SALES_PEOPLE
  db.sales_people.aggregate([
    {
      $lookup: {
        from: "users",
        localField: "_id",
        foreignField: "users_id",
        as: "user",
      },
    },
  ]);
  
  //FOR ORDERS
  db.orders.aggregate([
    {
      $lookup: {
        from: "customers",
        localField: "_id",
        foreignField: "customers_id",
        as: "customer",
      },
    },
    {
      $lookup: {
        from: "sales_people",
        localField: "_id",
        foreignField: "sales_people_id",
        as: "sales_person",
      },
    },
  ]);
  
  //FOR PRODUCTS
  db.products.aggregate([
    {
      $lookup: {
        from: "sales_people",
        localField: "_id",
        foreignField: "sales_people_id",
        as: "sales_person",
      },
    },
  ]);  
  db.orders_products.aggregate([
    {
      $lookup: {
        from: "orders",
        localField: "_id",
        foreignField: "orders_id",
        as: "order",
      },
    },
    {
      $lookup: {
        from: "products",
        localField: "_id",
        foreignField: "products_id",
        as: "product",
      },
    },
  ]);
  
  // TO GET RECORDS FROM THE ENTITIES
  
  db.products.find()
  
  db.categories.findOne({_id:""})
  
  // TO UPDATE RECORDS FROM THE ENTITIES
  
  db.users.update({_id:""}, {$set:{address:""}})
  
  db.customers.update({_id:""}, {$set:{firstName:""}})
  
  // TO DELETE RECORDS FROM THE ENTITIES 
  
  db.products.deleteOne({_id:""})
  
  db.orders.deleteOne({_id:""})