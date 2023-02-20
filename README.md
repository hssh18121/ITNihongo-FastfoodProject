# Notes for this project

## Project's main functionality description
- User: loggin in, view the products, add product to cart, add to favourite, checkout, change account information, view orders history
- Admin: managing products, categories, update orders status

## How to run the project on paiza.cloud 
- Sign in with your paiza account 
- Create a new ruby on rails server
- In the terminal, run ```git clone https://github.com/hssh18121/ITNihongo-FastfoodProject.git```
- In order to avoid bugs related to "poppler" gem, run these command: ```sudo apt-get update``` and then ```sudo apt -y install libpoppler-glib-dev```
- Next, run ```bundle install```, and then ```rails db:migrate```
- Run ```rails s```, and if you encounter error, add ```config.hosts << ...``` in your ```config/environments/development.rb``` file

## Notable routes - to test the function of this project:  
### Logging into the app: 
- ```/register``` : register
- ```/login``` : login

### User's routes: 
- ```/``` : Home(root) page
- ```/products``` : Main page, show the list of products available on the website 
- ```/products/{id}``` : Show the detailed information of the respective product's id
- ```/favourites``` : Show the list of user's favourite products
- ```/cart``` : Show products that have been added to cart
- ```/checkout/{receipt_id}``` : Notify checkout successfully
- ```/user_receipts``` : Show user's order history
- ```/manage_account``` : Make change to user's profile
- ```/change_password``` : Change user's password

### Admin's routes: 
#### manage categories & products & orders
- ```/manage-categories``` : CRUD category
- ```/manage-products``` : CRUD product
- ```/manage-orders``` : Set new status for user orders
> - ***Note1: A new product couldn't be created without a category, so make sure to create a category first***
> - ***Note2: In order to create an admin account, create a normal account and then set admin field to true in rails console***

## To-do tasks: 
- Render pdf receipt function crashes whenever the receipt's info contains Vietnamese characters => need to fix this bug
- Specifying user and admin role (the default role is user, you could set an account to become admin by using the rails console)

### Recommended: 
- Read the routes.rb file for the full version of routes definition in this project
- Use the command rails console (rails c) to alter the data directly in the terminal






