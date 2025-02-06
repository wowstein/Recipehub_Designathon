from flask import Flask, render_template, request
import mysql.connector
import os

connection = mysql.connector.connect(host = "localhost",user = "root", password = "root", database = "recipe_db", use_pure = True)
mycursor = connection.cursor()


app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = 'static/uploads/'

credentials_query = "select username, password from users;"
mycursor.execute(credentials_query)
credentials_users = mycursor.fetchall()

#create a username - password dictionary 
datab = {}
for row in credentials_users:
    datab[row[0]] = row[1]

print(datab)

# Fetch user data and create a dictionary
user_query = "SELECT id, username FROM users;"
mycursor.execute(user_query)
user_data = mycursor.fetchall()

# Create a dictionary mapping user_id to username
user_dict = {}
for row in user_data:
    user_dict[row[0]] = row[1]

print(user_dict)

@app.route('/')
def home():
    mycursor = connection.cursor()
    return render_template('index.html')

@app.route('/login')
def login():
    mycursor = connection.cursor()
    return render_template('login.html')


#log in 
@app.route('/sample', methods = ['GET','POST'])
def sample():
    username = request.form["textbox1"]
    pwd = request.form["textbox2"]
    if username not in datab:
        return render_template('login.html',msg = "Invalid username") 
    else:
        if datab[username] != pwd:
            return render_template('login.html',msg = "Invalid password")
        else:
            return render_template('home.html',msg = username)



@app.route('/breakfast')
def breakfast():
    query = f"select * from recipes where category like \"%breakfast\""
    mycursor.execute(query)
    data = mycursor.fetchall()
    return render_template('breakfast.html',sqldata = data)

@app.route('/lunch')
def lunch():
    query = f"select * from recipes where category like \"%lunch\""
    mycursor.execute(query)
    data = mycursor.fetchall()
    return render_template('lunch.html',sqldata = data)

@app.route('/dinner')
def dinner():
    query = f"select * from recipes where category like \"%dinner\""
    mycursor.execute(query)
    data = mycursor.fetchall()
    return render_template('dinner.html',sqldata = data)

@app.route('/desserts')
def desserts():
    query = f"select * from recipes where category like \"%desserts\""
    mycursor.execute(query)
    data = mycursor.fetchall()
    return render_template('desserts.html',sqldata = data)


@app.route('/searchresult', methods=['GET', 'POST'])
def searchresult():
    mycursor = connection.cursor(dictionary=True)
    if request.method == "POST":
        get_rcp = request.form.get("name_rcp")

        # Fetch recipes
        recipe_query = "SELECT * FROM recipes WHERE NAME LIKE %s"
        mycursor.execute(recipe_query, (f"{get_rcp}%",))
        recipe = mycursor.fetchall()  # List of recipes

        # Fetch comments for the first recipe found
        comments = []
        if recipe:
            rcp_id = recipe[0]['id']
            comments_query = "SELECT * FROM comments WHERE recipe_id = %s"
            mycursor.execute(comments_query, (rcp_id,))
            comments = mycursor.fetchall()
            # Replace user_id with username
            for comment in comments:
                comment['username'] = user_dict.get(comment['user_id'], "Unknown User")

        mycursor = connection.cursor()#giving back tuple output for other links to work
        return render_template('searchresult.html', recipe=recipe, comments=comments)


@app.route('/ingredientsearchresult', methods = ['GET','POST'])
def ingredientsearchresult():
    mycursor = connection.cursor(dictionary=True)
    if request.method == "POST":
        get_ing = request.form.get("ing_rcp")

        # Fetch recipes
        recipe_query = "SELECT * FROM recipes WHERE ingredients LIKE %s;"
        mycursor.execute(recipe_query, (f"{get_ing}%",))
        recipe = mycursor.fetchall()  # List of recipes

        # Fetch comments for the first recipe found
        comments = []
        if recipe:
            rcp_id = recipe[0]['id']
            comments_query = "SELECT * FROM comments WHERE recipe_id = %s;"
            mycursor.execute(comments_query, (rcp_id,))
            comments = mycursor.fetchall()
            # Replace user_id with username
            for comment in comments:
                comment['username'] = user_dict.get(comment['user_id'], "Unknown User")

        mycursor = connection.cursor()#giving back tuple output for other links to work
        return render_template('ingredientsearchresult.html', recipe = recipe, comments = comments) 
    
@app.route('/read', methods = ["GET","POST"])
def valueread():
    if request.method == "POST":
        get_name = request.form.get("name")
        get_ingredients = request.form.get("ingredients")
        get_instructions = request.form.get("instructions")
        get_cooking_time = request.form.get("cooking_time")
        get_serving_size = request.form.get("serving_size")
        get_user_id = request.form.get("user_id")
        get_category = request.form.get("category")
        get_image = request.files['image']
        
        
        if get_image:
            image_filename = get_image.filename
            image_path = os.path.join(app.config['UPLOAD_FOLDER'], image_filename)
            get_image.save(image_path)
        else:
            image_filename = None

        query = "insert into recipes(name,ingredients,instructions,cooking_time,serving_size,user_id,category,image) values (%s,%s,%s,%s,%s,%s,%s,%s);"
        
        values = (get_name,get_ingredients,get_instructions,get_cooking_time,get_serving_size,get_user_id,get_category,image_filename)

        mycursor.execute(query,values)
        connection.commit()

        return render_template('home.html')


@app.route('/comment_sub', methods = ["GET","POST"])
def value_read():
    if request.method == "POST":
        get_recipe_id = request.form.get("recipe_id")
        get_user_id = request.form.get("user_id")
        get_comment = request.form.get("comment")
        get_date_posted = request.form.get("date_posted")

        query = "insert into comments(recipe_id,user_id,comment,date_posted) values (%s,%s,%s,%s);"
        
        values = (get_recipe_id,get_user_id,get_comment,get_date_posted)

        mycursor.execute(query,values)
        connection.commit()

        return render_template('home.html')


@app.route('/new_user')
def new_user_registration():
    mycursor = connection.cursor()
    return render_template('new_user.html')
        
@app.route('/user_reg', methods = ["GET","POST"])
def new_user():
    if request.method == "POST":
        get_id = request.form.get("id")
        get_username = request.form.get("username")
        get_email = request.form.get("email")
        get_password = request.form.get("password")

        query = "insert into users(id,username,email,password) values(%s,%s,%s,%s);"
        
        values = (get_id,get_username,get_email,get_password)

        mycursor.execute(query,values)
        connection.commit()

        return render_template('new_user.html')

#featured recipes
@app.route('/pancake', methods=['GET'])
def pancake():
    mycursor = connection.cursor(dictionary=True)
    get_rcp = "banana pancakes"

     # Fetch recipes
    recipe_query = "SELECT * FROM recipes WHERE NAME LIKE %s"
    mycursor.execute(recipe_query, (f"{get_rcp}%",))
    recipe = mycursor.fetchall() 

    comments = []
    if recipe:
        rcp_id = recipe[0]['id']
        comments_query = "SELECT * FROM comments WHERE recipe_id = %s"
        mycursor.execute(comments_query, (rcp_id,))
        comments = mycursor.fetchall()
        # Replace user_id with username
        for comment in comments:
            comment['username'] = user_dict.get(comment['user_id'], "Unknown User")

    mycursor = connection.cursor()#giving back tuple output for other links to work
    return render_template('searchresult.html', recipe=recipe, comments=comments)

@app.route('/vada', methods=['GET'])
def Vada():
    mycursor = connection.cursor(dictionary=True)
    get_rcp = "vada"

     # Fetch recipes
    recipe_query = "SELECT * FROM recipes WHERE NAME LIKE %s"
    mycursor.execute(recipe_query, (f"{get_rcp}%",))
    recipe = mycursor.fetchall() 

    comments = []
    if recipe:
        rcp_id = recipe[0]['id']
        comments_query = "SELECT * FROM comments WHERE recipe_id = %s"
        mycursor.execute(comments_query, (rcp_id,))
        comments = mycursor.fetchall()
        for comment in comments:
            comment['username'] = user_dict.get(comment['user_id'], "Unknown User")
            
    mycursor = connection.cursor()#giving back tuple output for other links to work
    return render_template('searchresult.html', recipe=recipe, comments=comments)

if __name__ == '__main__':

    app.run(port=5001)
