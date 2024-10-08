hobbies = ["Lesen", "Schwimmen", "Kochen", "Fußball", "Tanzen", "Reisen", "Programmieren", "Fotografie", "Musik", "Yoga"]
hobby_records = hobbies.map { |hobby| Hobby.create!(name: hobby) }

User.create!([
               {
                 email: "anna@example.com",
                 password: "password",
                 password_confirmation: "password",
                 name: "Anna Müller",
                 location: "Berlin",
                 hobbies: [hobby_records[0], hobby_records[2], hobby_records[6]] # Lesen, Kochen, Programmieren
               },
               {
                 email: "ben@example.com",
                 password: "password",
                 password_confirmation: "password",
                 name: "Ben Schulz",
                 location: "Berlin",
                 hobbies: [hobby_records[1], hobby_records[4], hobby_records[5]] # Schwimmen, Tanzen, Reisen
               },
               {
                 email: "carla@example.com",
                 password: "password",
                 password_confirmation: "password",
                 name: "Carla Wagner",
                 location: "Hamburg",
                 hobbies: [hobby_records[2], hobby_records[7], hobby_records[8]] # Kochen, Fotografie, Musik
               },
               {
                 email: "dave@example.com",
                 password: "password",
                 password_confirmation: "password",
                 name: "Dave Meier",
                 location: "München",
                 hobbies: [hobby_records[6], hobby_records[7], hobby_records[9]] # Programmieren, Fotografie, Yoga
               },
               {
                 email: "eva@example.com",
                 password: "password",
                 password_confirmation: "password",
                 name: "Eva Fischer",
                 location: "Stuttgart",
                 hobbies: [hobby_records[0], hobby_records[3], hobby_records[8]] # Lesen, Fußball, Musik
               },
               {
                 email: "frank@example.com",
                 password: "password",
                 password_confirmation: "password",
                 name: "Frank Becker",
                 location: "Hamburg",
                 hobbies: [hobby_records[1], hobby_records[5], hobby_records[9]] # Schwimmen, Reisen, Yoga
               }
             ])
