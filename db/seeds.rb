User.create!(username: "ddiggler", city: "Somerville, MA",
             email: "ddiggler@gmail.com", password: 12345678,
             password_confirmation: 12345678, admin: false)

User.create!(username: "joe_smith", city: "Weston, MA",
             email: "joe_smith@gmail.com", password: 12345678,
             password_confirmation: 12345678, admin: false)

nick = User.create!(username: "npendery", city: "Cambridge, MA",
                    email: "npendery@gmail.com", password: 12345678,
                    password_confirmation: 12345678, admin: true)

User.create!(username: "bpendery", city: "Cambridge, MA",
             email: "bpendery@gmail.com", password: 12345678,
             password_confirmation: 12345678, admin: false)

User.create!(username: "dpendery", city: "Cambridge, MA",
             email: "dpendery@gmail.com", password: 12345678,
             password_confirmation: 12345678, admin: false)

user2 = User.create!(username: "mkaiel", city: "Cambridge, MA",
                     email: "mkaiel1@gmail.com", password: 12345678,
                     password_confirmation: 12345678, admin: false)

User.create!(username: "jsimenas", city: "Cambridge, MA",
             email: "jsimenas@gmail.com", password: 12345678,
             password_confirmation: 12345678, admin: false)

user1 = User.create!(username: "alex_p", city: "Southie, MA",
                     email: "alex_p@gmail.com", password: 12345678,
                     password_confirmation: 12345678, admin: false)

User.create!(username: "kels_b", city: "Southie, MA",
             email: "kels_b@gmail.com", password: 12345678,
             password_confirmation: 12345678, admin: false)

user5 = User.create!(username: "jaime_john", city: "Boston, MA",
                     email: "jaime_john@gmail.com", password: 12345678,
                     password_confirmation: 12345678, admin: false)

user4 = User.create!(username: "sah_rahman", city: "Washington, DC",
                     email: "sah_rahman@gmail.com", password: 12345678,
                     password_confirmation: 12345678, admin: false)

User.create!(username: "tim_boate", city: "Baltimore, MD",
             email: "tim_boate@gmail.com", password: 12345678,
             password_confirmation: 12345678, admin: false)

User.create!(username: "sean_lys", city: "Catonsville, MD",
             email: "sean_lys@gmail.com", password: 12345678,
             password_confirmation: 12345678, admin: false)

user3 = User.create!(username: "ol_shep_4", city: "Abingdon, MD",
                     email: "ol_shep_4@gmail.com", password: 12345678,
                     password_confirmation: 12345678, admin: false)

g1 = Group.create!(name: "Boston Beer Boys",
                   description: "Making great beer since 2009",
                   location: "Boston, MA", owner: user1)

g2 = Group.create!(name: "AlterEgo Brewing",
                   description: "Bringing out the wort of us",
                   location: "Cambridge, MA", owner: user2)

g3 = Group.create!(name: "E.A.Poe Brewers",
                   description: "Baltimore's best homebrewing club",
                   location: "Baltimore, MD", owner: user3)

g4 = Group.create!(name: "Nations Finest",
                   description: "Homebrewing in the nation's capital at its
                                 finest!",
                   location: "Washington, DC", owner: user4)

Group.create!(name: "Lager Lovers",
              description: "We love lagers and so should you!\n
                            We only brew delicious lagers because they are
                            worth the two month wait!",
              location: "Washington, DC", owner: user5)

Event.create!(title: "Brewing this weekend!",
              description: "Making a Pale Ale at Bill's house",
              street: "50 Charles Ave", city: "Boston", state: "MA",
              date: "2015/10/15", time: "3:00pm", user: user1, group: g1)

Event.create!(title: "Trying our latest batch",
              description: "Tasting the Apricot Ale at Tim's house",
              street: "130 Fairway Dr", city: "Cambrdige",
              state: "MA", date: "2015/08/10", time: "3:00pm",
              user: user2, group: g2)

Event.create!(title: "Trying the Pumpkin Ale!",
              description: "Popping open our pumpkin ale just in time
                            for Halloween!",
              street: "1234 Mass Ave", city: "Cambrdige",
              state: "MA", date: "2015/10/28",
              time: "9:00pm", user: user1, group: g1)

Event.create!(title: "Brewing this weekend!",
              description: "First time attempting a British Bitter",
              street: "100 Summer St", city: "Catonsville",
              state: "MD", date: "2015/10/30", time: "11:00am",
              user: user3, group: g3)

Event.create!(title: "Brewing at Sahils!",
              description: "Making a Belgian Blone Ale",
              street: "50 D St", city: "Washington",
              state: "DC", date: "2015/10/10",
              time: "1:00pm", user: user4, group: g4)

recipe1 = Recipe.create!(name: "Robust Porter",
               description: "Bold, slightly higher in alcohol, with more
                             assertive hop flavor that you'd expect from the
                             English variation",
               style: "Porter",
               ingredients: "6.5 pounds liquid light malt extract\r\n
                             1 pound liquid Munich malt extract\r\n
                             1 pound Crystal 40L malt, crushed\r\n
                             3/4 pound Chocolate malt, crushed\r\n
                             1/2 pound Black patent malt, crushed\r\n
                             1 ounce Cascade hops—60 minutes\r\n
                             1 ounce Cascade hops—15 minutes\r\n
                             6 gallons of tap water, split\r\n
                             1 Liter starter of liquid American Ale yeast",
               instructions: "1. If possible, place 3 gallons in the refrigerator to cool in a sanitized container.\r\n
                              2. Tie the Crystal 40L malt, the Chocolate malt and the Black Patent malt in a large mesh grain-bag. Place the bag in 3 gallons of water in a 5 gallon pot and immerse the grain.\r\n
                              3. Begin to heat, making sure mesh bag isn’t sitting directly on the bottom of the pot. Remove the grain bag when the temperature reaches 170°.\r\n
                              4. Bring wort to a vigorous boil. As water is heating, slowly add liquid malt extracts, stirring constantly until completely dissolved. When the boil begins, add 1 ounce Cascade hops in a mesh bag.\r\n
                              5. After 45 minutes of boiling has passed, add 1 ounce Cascade in a mesh bag.\r\n
                              6. After total of 60 minutes of boil, remove from heat. Warning: After wort cools below 180°F everything that touches it should be sanitary, and exposure to open air should be limited as much as possible.\r\n
                              7. Cool wort by placing pot in ice bath until it is below 85°F. Transfer to sanitized fermentor (either a carboy or a fermentation bucket). Top off to 5 gallons using refrigerated water. In the image, I'm using a sanitized pitcher to top off my carboy.\r\n
                              8. Use a sanitized auto-siphon racking cane to remove enough wort to take a gravity reading with your hydrometer. Make a note of this number, since we'll be using it to calculate the actual alcohol content when it's done fermenting. Mine came out to 1.064, but yours might differ slightly.\r\n
                              9. Carefully pour yeast into cooled wort (it should be below 70°F), and agitate vigorously. Cover fermentor with a sanitized stopper and airlock. Ferment in dark place, keeping ambient temperature consistent, preferably between 65 and 68°F.\r\n
                              10. Bottle after three to four weeks",
               yielder: "5 gallons", user: nick)

recipe2 = Recipe.create!(name: "Sorachi Ace and Simcoe IPA",
               description: "This IPA is a pale to amber in color with a thick white head. It has strong citrus, pine and floral hop aromas and flavors to match, along with a lingering bitterness and solid malt character.",
               style: "India Pale Ale",
               ingredients: "9 pounds Light liquid malt extract\r\n
                             0.75 pounds Crystal 20L malt, crushed\r\n
                             1 ounce Magnum hops - 60 minutes\r\n
                             1 ounce Simcoe hops - 15 minutes\r\n
                             1 ounce Sorachi Ace hops - 15 minutes\r\n
                             1 ounce Simcoe hops - 0 minutes (flame out)\r\n
                             1 ounce Sorchi Ace hops - 0 minutes (flame out)\r\n
                             11.5 gram package Safale US-05\r\n
                             1 ounce Simcoe hops - for dry hopping in Secondary\r\n
                             1 ounce Sorachi Ace hops - for dry hopping in Secondary",
               instructions: "1. Tie the Crystal 20L in a large mesh bag. Place the bag in 3 gallons of water in a 7.5 gallon pot and immerse the grain.\r\n
                              2. Begin to heat, making sure mesh bag isn’t sitting directly on the bottom of the pot. Remove the grain bag when the temperature reaches 170°F.\r\n
                              3. Add another 3.5 gallons of water. Bring wort to a vigorous boil. As water is heating, slowly add 9 pounds of light liquid malt extract, stirring constantly until completely dissolved. When the boil begins, add 1 ounce Magnum hops in a mesh bag.\r\n
                              4. After 45 minutes of boiling has passed, add 1 ounce Sorachi Ace and 1 ounce Simcoe hops in a mesh bag.\r\n
                              5. After total of 60 minutes of boil, add 1 ounce Sorachi Ace and 1 ounce Simcoe hops in a mesh bag, cover remove from heat. Warning: After wort cools below 180°F everything that touches it should be sanitary, and exposure to open air should be limited as much as possible.\r\n
                              6. Cool wort by placing pot in ice bath or using a wort chiller until it is below 70°F. Transfer to sanitized fermentor (either a carboy or a fermentation bucket). Top off to make 5 gallons using refrigerated water.\r\n
                              7. Use a sanitized auto-siphon racking cane to remove enough wort to take a gravity reading with your hydrometer. Make a note of this number, since you will be using it to calculate the actual alcohol content when it's done fermenting. The reading should be around 1.067.\r\n
                              8. Carefully pour yeast into cooled wort (it should be below 70°F), and agitate vigorously (or aerate). Cover fermentor with a sanitized stopper and airlock. Ferment in dark place, keeping ambient temperature consistent, preferably between 64° and 67°F.\r\n
                              9. After 2 to 3 weeks when primary fermentation is complete (take at least two consistent gravity readings), transfer to a secondary carboy for conditioning, add 1 ounce Sorachi Ace and 1 ounce Simcoe hops for dry hopping and store as cool as possible.\r\n
                              10. Bottle after another one to two weeks using enough priming sugar for a medium level of carbonation.",
               yielder: "5 gallons", user: nick)

recipe3 = Recipe.create!(name: "Belgian Tripel",
               description: "The Trappist monks of Westmalle Abbey have produced the Tripel as their premier beer style for over 70 years. This pale, strong beer of is recognized by its fruit and spice aromas and sweet malt flavor that seems to quickly dissipate from the tongue.",
               style: "Belgian and French Ale",
               ingredients: "9 pounds Pilsner malt extract\r\n
                             1 pound light Belgian candy sugar\r\n
                             1 pound Carapils malt, crushed\r\n
                             2 ounces Hallertau hops - 60 minutes\r\n
                             6 gallons of tap water, split\r\n
                             2 Liter starter of liquid Belgian Ale yeast (Whitelabs WLP500 or Wyeast 1214)",
               instructions: "1. If possible, place 3 gallons in the refrigerator to cool in a sanitized container.
                              2. Tie the Carapils malt in a large mesh grain bag or hop bag. Place the bag in 3 gallons of water in a 5 gallon pot and immerse the grain.
                              3. Begin to heat, making sure mesh bag isn’t sitting directly on the bottom of the pot. Remove the grain bag when the temperature reaches 170°.
                              4. Bring wort to a vigorous boil. As water is heating, slowly add 2 pounds of Pilsner liquid malt extract, stirring constantly until completely dissolved. When the boil begins, add 2 ounces Hallertau hops in a mesh bag.
                              5. After 45 minutes of boiling has passed, add remaining 7 pounds of Pilsner liquid malt extract and 1 pound of Belgian candy sugar, stirring constantly until completely dissolved.
                              6. After total of 60 minutes of boil, remove from heat. Warning: After wort cools below 180°F everything that touches it should be sanitary, and exposure to open air should be limited as much as possible.
                              7. Cool wort by placing pot in ice bath until it is below 85°F. Transfer to sanitized fermentor (either a carboy or a fermentation bucket). Top off to make 5 gallons using refrigerated water.
                              8. Use a sanitized auto-siphon racking cane to remove enough wort to take a gravity reading with your hydrometer. Make a note of this number, since you will be using it to calculate the actual alcohol content when it's done fermenting. The reading should be around 1.075.
                              9. Carefully pour yeast into cooled wort (it should be below 70°F), and agitate vigorously. Cover fermentor with a sanitized stopper and airlock. Ferment in dark place, keeping ambient temperature consistent, preferably between 68 and 70°F.
                              10. After primary fermentation is complete (take at least two consistent gravity readings), transfer to a secondary carboy for conditioning as discussed here and store as cool as possible.
                              11. Bottle after another four to six weeks using enough priming sugar for a high level of carbonation",
               yielder: "5 gallons", user: nick)

recipe4 = Recipe.create!(name: "Dry Stout",
               description: "While I've heard some people say dark beers are not for summertime, for me nothing pairs better with a grilled steak than a Dry Irish Stout. The low final gravity of the Dry Stout creates a light finish on the tongue, while the roasted coffee flavors complement food cooked over charcoal.",
               style: "Stout",
               ingredients: "5.25 pounds Maris Otter Pale Malt, crushed\r\n
                             1.5 pounds Flaked Barley, crushed\r\n
                             0.9 pounds Black Roasted Barley (500L), crushed\r\n
                             1.25 ounces Kent Goldings hops - 60 minutes\r\n
                             1 package Dry English Ale yeast, either White Labs WLP007 or WLP1098",
               instructions: "1. Line the 7.5 gallon kettle with the mesh bag, fill with 2.5 gallons of tap water and bring to 161°F. Remove from heat.\r\n
                              2. Mash-in by slowly adding all 7.65 pounds of grain into the water and inside the bag. Stir for 2 minutes to prevent balls of grain from clumping together, creating a consistent mash. The temperature should equalize to about 150°F.\r\n
                              3. Cover the mash, only uncovering to briefly stir every 20 minutes. Heat 3 more gallons of water to 185°F.\r\n
                              4. After 60 minutes, mash-out by carefully pouring the 185°F water into the mash, stirring to equalize temperature to about 170°F.\r\n
                              5. Slowly raise the grain bag out of the liquid, allowing the wort to drain from the grain. Hold the grain bag above the kettle for 5 to 10 minutes as the wort drains. Top the wort off with water to 6 gallons.\r\n
                              6. Bring wort to a vigorous boil. When the boil begins, add 1.25 ounce Kent Goldings hops in a mesh bag.\r\n
                              7. After total of 60 minutes of boil, remove from heat. Warning: After wort cools below 180°F everything that touches it should be sanitary, and exposure to open air should be limited as much as possible.\r\n
                              8. Cool wort by placing pot in ice bath or by using a wort chiller until it is below 70°F. Transfer to sanitized fermentor (either a carboy or a fermentation bucket).\r\n
                              9. Use a sanitized auto-siphon racking cane to remove enough wort to take a gravity reading with your hydrometer. Make a note of this number, since you will be using it to calculate the actual alcohol content when it's done fermenting. The reading should be around 1.040.\r\n
                              10. Carefully pour yeast into cooled wort (it should be below 70°F), and agitate vigorously. Cover fermentor with a sanitized stopper and airlock. Ferment in dark place, keeping ambient temperature consistent, preferably between 65 and 68°F.\r\n
                              11. Bottle after 2 to 3 weeks when fermentation is complete, using enough priming sugar for a medium to low level of carbonation.",
               yielder: "6 gallons", user: user2)

recipe5 = Recipe.create!(name: "Mosaic SMaSH IPA",
               description: "One great way to get a handle on what each ingredient adds to a beer is to try to brew a SMaSH (Single Malt and Single Hop) beer. By focusing on just two ingredients, you can filter out the other 'noise' and learn your Centennials from your Chinooks and your Munich malt from your Vienna.",
               style: "India Pale Ale",
               ingredients: "12 pounds Golden Promise malt\r\n
                             1 ounce Mosaic hops, 12.3% AA (first wort hop)\r\n
                             1 1/2 ounces Mosaic hops, 12.3% AA (15 minutes)\r\n
                             1 tablet Whirlfloc (15 minutes)\r\n
                             1/2 teaspoon Wyeast yeast nutrient blend (10 minutes)\r\n
                             1 1/2 ounces Mosaic hops, 12.3% AA (0 minutes)\r\n
                             Wyeast 1056 American Ale yeast\r\n
                             2 ounces Mosaic hops, 12.3% AA (dry hop; 5-6 days in secondary)",
               instructions: "1. Heat 15 quarts tap water to 164°F and add to mash tun.\r\n
                              2. Mash-in slowly, adding all grains to the mash tun while stirring to prevent clumping. The mash temperature should equalize to 152°F.\r\n
                              3. In a separate container, heat 8.4 quarts tap water to 202°F.\r\n
                              4. Mash out by adding 8.4 quarts of 202°F tap water to mash tun, while stirring, after allowing the mash to rest for 60 minutes. Temperature should equalize to approximately 168°F.\r\n
                              5. Leave at mash out temperature for 15 minutes. In a separate container, heat 2.8 gallons tap water to 172°F.\r\n
                              6. Slowly drain off wort and add back to mash tun, recirculating until the wort runs clear and free of grain particles.\r\n
                              7. Drain mash tun to boil kettle, sparging with 2.8 gallons of 172°F tap water. Add first wort hops once the kettle is full.\r\n
                              8. After all mash runnings are collected, record preboil gravity. Bring wort to boil.\r\n
                              9. Allow wort to boil 60 minutes, adding hops, Whirlfloc and yeast nutrients as noted above.\r\n
                              10. Chill wort and transfer to a sanitized carboy or bucket with an airlock. Aerate by shaking or oxygenate with an oxygenation stone.\r\n
                              11. Pitch yeast and allow to ferment at 66°F to 68°F.\r\n
                              12. Once the gravity is within a few points of your target final gravity (about 1.014), rack beer to second sanitized carboy or bucket with dry hops in a sanitized hop sack and allow to condition for 5 to 6 days.\r\n
                              13. Bottle or keg at 2.6 volumes.",
               yielder: "5 gallons", user: nick)

recipe6 = Recipe.create!(name: "American Wheat Ale",
               description: "Summer is just around the corner and it's the perfect time to brew light, refreshing beers. American Wheat ale fits this bill perfectly with its hop crispness, smooth texture and moderate alcohol content.",
               style: "American Ale",
               ingredients: "3 pounds Two-Row malt, crushed\r\n
                             4 pounds Malted Wheat, crushed\r\n
                             0.6 pounds Munich malt, crushed\r\n
                             1 ounce Magnum hops - 60 minutes\r\n
                             1/2 ounces Sorachi Ace hops - 15 minutes\r\n
                             1/2 ounces Sorachi Ace hops - 5 minutes\r\n
                             1 Liter starter of American Ale yeast, either White Labs WLP051 or Wyeast 1272",
               instructions: "1. Line the 7.5 gallon kettle with the mesh bag, fill with 2.5 gallons of tap water and bring to 165°F. Remove from heat.\r\n
                              2. Mash-in by slowly adding all 7.6 pounds of grain into the water and inside the bag. Stir for 2 minutes to prevent balls of grain from clumping together, creating a consistent mash. The temperature should equalize to about 154°F.\r\n
                              3. Cover the mash, only uncovering to briefly stir every 20 minutes. Heat 3 more gallons of water to 185°F.\r\n
                              4. After 60 minutes, mash-out by carefully pouring the 185°F water into the mash, stirring to equalize temperature to about 170°F.\r\n
                              5. Slowly raise the grain bag out of the liquid, allowing the wort to drain from the grain. Hold the grain bag above the kettle for 5 to 10 minutes as the wort drains. Top the wort off with water to 6 gallons.\r\n
                              6. Bring wort to a vigorous boil. When the boil begins, add 1 ounce Magnum hops in a mesh bag.\r\n
                              7. After boiling for 45 minutes, add 1/2 ounces Sorachi Ace hops in a mesh bag.\r\n
                              8. After boiling a for a total of 55 minutes, add 1/2 ounce Sorachi Ace hops in a mesh bag.\r\n
                              9. After total of 60 minutes of boil, remove from heat. Warning: After wort cools below 180°F everything that touches it should be sanitary, and exposure to open air should be limited as much as possible.\r\n
                              10. Cool wort by placing pot in ice bath or by using a wort chiller until it is below 70°F. Transfer to sanitized fermentor (either a carboy or a fermentation bucket).\r\n
                              11. Use a sanitized auto-siphon racking cane to remove enough wort to take a gravity reading with your hydrometer. Make a note of this number, since you will be using it to calculate the actual alcohol content when it's done fermenting. The reading should be around 1.043.\r\n
                              12. Carefully pour yeast into cooled wort (it should be below 70°F), and agitate vigorously. Cover fermentor with a sanitized stopper and airlock. Ferment in dark place, keeping ambient temperature consistent, preferably between 65 and 68°F.\r\n
                              13. Bottle after 1 to 2 weeks when fermentation is complete, using enough priming sugar for a medium level of carbonation.",
               yielder: "5 gallons", user: user1)

recipe7 = Recipe.create!(name: "Berliner Weisse",
               description: "Light, tart, and cloudy, Berliner Weisse is a style that has very few contemporaries in the beer world. It's a sessionable beer—most style guides put it at a maximum 3.8% ABV—with a dry finish and essentially no hop character. Don't be fooled, though, because these light ales pack a real punch in the flavor department.",
               style: "German Wheat and Rye Beer",
               ingredients: "3.25 pounds German Pilsner Malt\r\n
                            3.25 pounds German wheat malt\r\n
                            0.5 pounds rice hulls\r\n
                            0.75 ounces Hallertauer hops (added to mash)\r\n
                            1 package Safale US-05\r\n
                            2 packages Lactobacillus (Wyeast 5535 or Whte Labs WLP677)",
               instructions: "1. Line the 7.5 gallon kettle with mesh grain bag, fill with 2.1 gallons tap water and bring to 159°F. Remove from heat.\r\n
                              2. Mash-in by slowly adding Pilsner and wheat malt into the bag. Stir for 2 minutes to prevent grain from clumping together. The temperature should equalize to about 149°F\r\n
                              3. Remove 3 quarts of the mash for the decoction, including a good mixture of both the grain and liquid. Add the Hallertauer hops to mixture and boil in a separate pot for 15 minutes. Stir frequently, and as foam rises to the top, skim and discard.\r\n
                              4. Add the entire decoction back into the mash. In a separate container, heat 3.7 gallons of water to 185°F.\r\n
                              5. After about 60 total minutes of mashing, mash-out by carefully pouring the 185°F water into the mash, stirring to equalize temperature to about 170°F.\r\n
                              6. Slowly raise grain bag out of the liquid, allowing wort to drain from the grain. Hold grain bag above the kettle for 5 to 10 minutes as the wort drains.\r\n
                              7. DO NOT BOIL. Cool the wort to under 80°F and transfer to a sanitized fermentation vessel.\r\n
                              8. Use a sanitized auto-siphon racking cane to remove enough wort to take a gravity reading with your hydrometer. Make a note of this number, since you will be using it to calculate the actual alcohol content when it's done fermenting. The reading should be around 1.035. Cover fermentor with a sanitized stopper and airlock.\r\n
                              9. Add 1 package of Safale US-05 and 2 packages of Lactobacillus. Ferment for 3 to 5 days at a temperature around 75°F.\r\n
                              10. Condition by allowing the beer to rest for at least a month. Taste samples weekly to determine sour flavor development.\r\n
                              11. Bottle when desired level of sourness and flavor have developed, up to 6 months, using enough priming sugar for a high level of carbonation.",
               yielder: "5 gallons", user: nick)

recipe8 = Recipe.create!(name: "Czech Pilsner",
               description: "The Czech Pilsner, or sometimes known as the Bohemian Pilsner, is light straw to golden color and crystal clear. Hops are very prevalent usually with a spicy bitterness and or a spicy floral flavor and aroma, notably one of the defining characteristics of the Saaz hop.",
               style: "Pilsner",
               ingredients: "7 pounds pilsner malt, crushed\r\n
                            8 gallons of water split - blend 4 gallons tap water and 4 gallons distilled water\r\n
                            1.5 pounds extra light dry malt extract\r\n
                            1.5 ounces Saaz hops - 90 minutes\r\n
                            1 ounce Saaz hops - 20 minutes\r\n
                            1.5 ounces Saaz hops - 5 minutes\r\n
                            1 ounce Saaz hops - 0 minutes (flame out)\r\n
                            Two 11.5 gram packages of dry lager yeast (Saflager S-23)",
               instructions: "1. Line the 7.5 gallon kettle with the mesh bag, fill with 2.5 gallons of tap water and bring to 157°F. Remove from heat.\r\n
                              2. Mash-in by slowly adding 7 pounds of pilsner malt into the water and inside the bag. Stir for 2 minutes to prevent balls of grain from clumping together, creating a consistent mash. The temperature should equalize to about 148°F.\r\n
                              3. Cover the mash, only uncovering to briefly stir every 20 minutes. Heat 3 more gallons of water to 190°F.\r\n
                              4. After 60 minutes, mash-out by carefully pouring the 190°F water into the mash, stirring to equalize temperature to about 170°F.\r\n
                              5. Slowly raise the grain bag out of the liquid, allowing the wort to drain from the grain. Hold the grain bag above the kettle for 5 to 10 minutes as the wort drains. Top the wort off with water to 6.5 gallons and add 1.5 pounds extra light dry malt extract.\r\n
                              6. Bring wort to a vigorous boil. When the boil begins, add 1.5 ounce Saaz hops in a mesh bag.\r\n
                              7. After boiling for 70 minutes, add 1 ounce Saaz hops in a mesh bag.\r\n
                              8. After boiling for 85 minutes, add 1.5 ounce Saaz hops in a mesh bag.\r\n
                              9. After total of 90 minutes of boil, remove from heat and add 1 ounce Saaz hops in a mesh bag. Warning: After wort cools below 180°F everything that touches it should be sanitary, and exposure to open air should be limited as much as possible.\r\n
                              10. Cool wort by placing pot in ice bath or by using a wort chiller until it is below 70°F. Transfer to sanitized fermentor (either a carboy or a fermentation bucket) and place in a temperature controlled refrigerator set to 48°F.\r\n
                              11. Use a sanitized auto-siphon racking cane to remove enough wort to take a gravity reading with your hydrometer. Make a note of this number, since you will be using it to calculate the actual alcohol content when it's done fermenting. The reading should be around 1.054. Cover fermentor with a sanitized stopper and airlock.\r\n
                              12. After wort cools to 50°F, agitate vigorously for at least 5 minutes. Add two 11.5 gram packages of Saflager S-23 yeast.\r\n
                              13. Ferment for at least 3 weeks at 48°F\r\n
                              14. After fermentation is complete, rack to a sanitized secondary carboy and allow the beer to raise to room temperature for 12 hours for a diacetyl rest.\r\n
                              15. Lager for 4 to 6 weeks by placing carboy in a temperature controlled refrigerator set to 35°F.\r\n
                              16. Bottle after lagering is complete, using enough priming sugar for a medium level of carbonation.",
               yielder: "5 gallons", user: nick)

Review.create!(title: "Love it!", rating: 5, recipe: recipe1, user: user1)

Review.create!(title: "Too dark for me", rating: 3, recipe: recipe1, user: user2)

Review.create!(title: "Chocolatey goodness", rating: 4, recipe: recipe1, user: user3)

Review.create!(title: "So hoppy!", rating: 5, recipe: recipe2, user: user1)

Review.create!(title: "Bitterness", description: "Really like the flavor, would make it a little more bitter though", rating: 4, recipe: recipe2, user: user3)

Review.create!(title: "Great wheat flavor", rating: 4, recipe: recipe6, user: user1)
