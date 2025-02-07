create database recipe_db;
use recipe_db;



create table recipes(
id int Primary Key,
name varchar(90),
ingredients mediumtext,
instructions longtext,
cooking_time varchar(30),
serving_size int, 
user_id int,
category varchar(30)
);

insert into recipes(id,name,ingredients,instructions,cooking_time,serving_size,user_id,category) values 
(1,"Waffles","Flour – Just plain / all purpose flour. You can substitute the flour and baking powder with self raising flour (which has baking powder built in) and it works fine, but it is not quite as soft inside. That’s just the case with anything you make using self raising flour rather than flour + baking powder.

Baking powder – On baking powder, if yours has sat unused in the back of your pantry for months and months, check it is still alive else you may end up with dense waffles!

Sugar – Caster/superfine sugar is safest because it’s smaller grains so you know it will easily dissolve. However, regular/granulated sugar is fine to use too.

Eggs – At room temperature, so they incorporate easily into the batter. Use large eggs which are ~55g / 2 oz each, an industry standard so the eggs will be labelled “large eggs” on the carton. More on eggs for baking here.

Milk – Full fat please! Lower fat in light milk will make the inside of the waffles drier. Warm it slightly so it’s not fridge cold, else it can bring down the temperature of the batter too much and cause the butter to solidify when mixed through. Just use the microwave (30 seconds) or stove.

Butter – For flavour! Melt then cool slightly so it’s not piping hot.

Salt – Just a touch, to bring out the flavours. This is good general practice for all (well, most!) sweet baking recipes.

Vanilla – For flavour!","Whisk dry ingredients – flour, baking powder, sugar and salt. Just whisk to mix them up.

Whisk in wet – put the milk, eggs and vanilla in first and whisk to combine. Once incorporated, add the butter then whisk until lump free.

Batter – The batter is thicker than a pancake batter (which should be thin enough to spread in a pan) but thinner than a muffin batter (which semi-mounds in muffin tins).

Recommended overnight or 2 hr resting – for the tastiest waffles, rest the batter overnight in the fridge or for at least 2 hours. This makes the flour grains absorb the liquid so it makes the inside of the waffles softer. And if you rest overnight, the batter develops more flavour – in the same way overnight bread and pizza dough does!","2 hrs 25 mins",5,100,"breakfast"),
(2,"Banana pancakes","2 cups all purpose flour
 1 teaspoon baking powder
 ½ teaspoon baking soda
 1 teaspoon cinnamon
 ½ teaspoon vanilla extract
 ¼ teaspoon salt
 2 eggs
 2 tablespoons brown sugar
 2 tablespoons melted butter
 2 cups buttermilk or as needed, see notes for substitute
 1 cup mashed bananas about 3 medium bananas","Combine flour, baking powder, baking soda, and cinnamon in a bowl. Whisk well-this is in place of sifting and creates a fluffy pancake.
Combine egg, brown sugar, milk, melted butter and mashed banana in a separate bowl.
Add the banana mixture to the dry ingredients. Stir with a spoon just until combined the ingredients are mixed; the batter should be lumpy. Let the batter rest for 5 minutes.
Preheat a large nonstick skillet or griddle to medium heat.
Add 1 teaspoon oil to the pan and use a paper towel to spread it over the pan. Pour ¼ cup of the batter onto the hot pan. Repeat, allowing ½-inch spave between the pancakes.
Once small bubbles form on top and begin to pop, use a spatula to flip the pancakes over. Cook for 1 minute more.","25 mins",4,101,"breakfast");

select * from recipes;

create table users(
id int Primary Key,
username varchar(30),
email varchar(30),
password varchar(40)
);

insert into users(id,username,email,password) values
(100, "Anto","antowiz@gmail.com","sigma911"),
(101, "Rita","rita323@gmail.com","queenofpeace");

select * from users;

create table comments(
id int Primary Key,
recipe_id int,
user_id int,
comment mediumtext,
date_posted varchar(40)
);

insert into comments(id,recipe_id,user_id,comment,date_posted) values
(1,1,101,"made this gem...tastes delicious..Thanks for the recipe!!!","12/2/24"),
(2,2,100,"mmmm...delicious!!!","31/3/24");

select * from comments;

insert into recipes(id,name,ingredients,instructions,cooking_time,serving_size,user_id,category) values 
(3,"Chicken Biriyani","Marinade Ingredients
▢1 pound chicken drumsticks (4) skin removed
▢1 pound boneless skinless chicken thighs cut in half
▢2 teaspoon biryani masala
▢1 tablespoon ginger paste
▢1 tablespoon garlic paste
▢2 teaspoons kosher salt
▢1 tablespoon kashmiri red chili powder
▢½ teaspoon ground turmeric
▢¼ cup fresh mint leaves chopped
▢2 tablespoon lemon juice
▢¾ cup plain yogurt
Crispy Fried Onions
▢4 tablespoons ghee
▢1 large yellow onion thinly sliced
Rice Ingredients
▢2 tablespoons ghee
▢2½ cups Extra long grain Basmati rice
▢1 teaspoon black cumin seeds - shah jeera
▢2 bay leaves - tamal patra
▢1 star anise
▢4 green cardamom pods
▢8 cloves
▢1½ tablespoons kosher salt
Garnish
▢¼ cup chopped cilantro
▢½ teaspoon saffron
▢2 tablespoons milk warm","Marinate Chicken
Make the marinade by mixing yogurt, ginger, garlic, turmeric, red chili powder, garam masala, salt, mint leaves, and lemon juice.
Add chicken and coat evenly with the marinade. Keep in the refrigerator for at least 30 minutes. Note: You can also marinate the chicken overnight in teh refrigerator.
Soak saffron in warm milk, reserve.
Rinse & Soak Rice
Rinse and drain the basmati rice 2 to 3 times. Add 4 cups of water and let it soak for 20 minutes.
Fry Onions
While the rice is soaking, add ghee to a heavy-bottomed pan and add onions. On medium heat, fry the onions stirring frequently until they become light golden brown and start to crisp up - about 15 to 20 minutes.
Remove the fried onions from the pan, leaving the excess ghee behind as we will use this pan to cook the chicken. Add one fourth of the fried onions to the marinated chicken and give a quick mix.
Parboil Rice
In a medium pot add 8 cups of water. Add cumin seeds, bay leaves, star anise, cardamom, cloves, and salt to the rice and bring it to boil on high heat.
Drain the soaked rice and add it to the boiling water. Bring the rice to a full boil on high heat. Lower the heat to medium and cook uncovered for 5 to 6 minutes or until the rice is about 90% cooked. Drain the rice promptly and reserve.
Cook chicken
To the pan with the remaining ghee, add the marinated chicken. Cook on medium heat for 8 to 10 minutes, turning halfway through.
Layer and cook Biryani on Dum
Carefully layer the partially cooked rice over the chicken. Top with caramelized onions and saffron-infused milk.
Cover the pot and seal it with aluminum foil, then place some weight over the lid. Cook on low heat for 20 minutes, this is the steam or \"Dum\" cooking step. Turn the heat off and wait another 10 minutes before opening the pot.
Garnish with cilantro. Before serving allow the biryani to sit uncovered for 5 minutes. Gently fluff the rice using a fork or a silicone spatula. This will help the delicate rice grains to firm up a bit preventing them from breaking. Serve with Raita and lemon wedges.","1 hrs 30 mins",6,102,"lunch"),
(4,"Caesar salad"," Dressing:

3 anchovy fillets

2 cloves garlic, finely chopped

½ lemon, juiced

2 tablespoons red wine vinegar

1 large egg yolk

1 tablespoon Dijon mustard

1 dash Worcestershire sauce

¼ cup olive oil

salt and ground black pepper to taste

Salad:

½ head romaine lettuce, chopped

¼ cup grated Parmesan cheese

2 tablespoons croutons
","Make the croutons. Tear sourdough or ciabatta into rough 1/2-inch pieces. Toss with grated garlic, olive oil, and a little grated Parmesan cheese. Bake until golden-brown and crispy.
Make the dressing. Combine lemon juice, anchovies, egg yolks, garlic, Worcestershire sauce, Dijon mustard, and pepper in a blender. With the blender running on high speed, slowly stream in olive oil until thick and creamy. Transfer to a bowl and stir in some Parmesan.
Assemble the salad. In a large bowl, combine chopped romaine lettuce, Parmesan, dressing, and half of the croutons. Toss to evenly coat. Garnish with remaining croutons and more Parmesan. ","30 mins", 4,103,"dinner"),
(5,"Cheesecake", "Graham Cracker Crust
▢1 ½ cups graham cracker crumbs (170g)
▢2 Tablespoons sugar
▢1 Tablespoon brown sugar (can substitute white)
▢7 Tablespoons butter melted
Cheesecake
▢32 oz cream cheese² softened to room temperature (910g)
▢1 cup sugar (200g)
▢⅔ cups sour cream (160g)
▢1 ½ teaspoons vanilla extract
▢⅛ teaspoon salt
▢4 large eggs room temperature, lightly beaten ","Instructions
Preheat oven to 325F (160C).
Prepare Graham Cracker crust first by combining graham cracker crumbs, sugar, and brown sugar, and stirring well. Add melted butter and use a fork to combine ingredients well.
1 ½ cups graham cracker crumbs,2 Tablespoons sugar,1 Tablespoon brown sugar,7 Tablespoons butter
Pour crumbs into a 9” Springform pan and press firmly into the bottom and up the sides of your pan. Set aside.
Cheesecake
In the bowl of a stand mixer or in a large bowl (using a hand mixer) add cream cheese and stir until smooth and creamy (don’t over-beat or you’ll incorporate too much air).
32 oz cream cheese²
Add sugar and stir again until creamy.
1 cup sugar
Add sour cream, vanilla extract, and salt, and stir until well-combined. If using a stand mixer, make sure you pause periodically to scrape the sides and bottom of the bowl with a spatula so that all ingredients are evenly incorporated.
⅔ cups sour cream,1 ½ teaspoons vanilla extract,⅛ teaspoon salt
With mixer on low speed, gradually add lightly beaten eggs, one at a time, stirring just until each egg is just incorporated. Once all eggs have been added, use a spatula to scrape the sides and bottom of the bowl again and make sure all ingredients are well combined.
4 large eggs
Pour cheesecake batter into prepared springform pan. To insure against leaks, place pan on a cookie sheet that’s been lined with foil.
Transfer to the center rack of your oven and bake on 325F (160C) for 50-60 minutes (or longer as needed, see note 3). Edges will likely have slightly puffed and may have just begun to turn a light golden brown and the center should spring back to the touch but will still be Jello-jiggly. Don't over-bake or the texture will suffer, which means we all suffer.
Remove from oven and allow to cool on top of the oven⁴ for 10 minutes. Once 10 minutes has passed, use a knife to gently loosen the crust from the inside of the springform pan (this will help prevent cracks as your cheesecake cools and shrinks). Do not remove the ring of the springform pan.
Allow cheesecake to cool another 1-2 hours or until near room temperature before transferring to refrigerator and allowing to cool overnight or at least 6 hours. I remove the ring of the springform pan just before serving then return it to the pan to store. Enjoy! "," 7 hrs 35 mins",12,100,"desserts");


