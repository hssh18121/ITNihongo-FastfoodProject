# Notes for this project

## Project's functionality description
- User: loggin in, view the products, buy the products, change account information, change password, view the order's history
- Admin: managing products, users, categories, receipts infomation

## How to run the project on paiza.cloud 
- Sign in with your paiza account 
- Create a new ruby on rails server
- In the terminal, run git clone https://github.com/hssh18121/ITNihongo-FastfoodProject.git
- Next, run bundle install, and then rails db:migrate

## Notable routes - to test the function of this project:  
### Logging into the app: 
- "/register": register
- "/login": login

### User's routes: 
- "/": Home(root) page
- "/products": Main page, show the list of products available on the website 
- "/products/{id}": Show the detailed information of the respective product's id
- "/favourites": Show the list of user's favourite products
- "/cart": Show products that have been added to cart
- "/checkout/{receipt_id}": Notifying checkout successfully
- "/user_receipts": Show user's order history

### Admin's routes (UI hasn's been implemented yet): 
#### crud categories & products & users & user_receipts
- "/" - for show all, "/new" - for create new, "/{id}/edit" for edit
- ***Note: A new product couldn't be created without a category, so make sure to create a category first"***

## To-do tasks: 
- Implement UI for the admin page 
- Specifying user and admin role (by default right now, every user is set to become admin after registering)
- Refactor the source code, since everything is extremely chaotic right now :)
- Fix the pop-up modal bug, which means re-writing a bit of javascript (pop-up modal sometimes does not show up when first rendering a page, need to refresh to make it work normally)
- Could not preview the invoice pdf when running on paiza, because the gem "poppler" could not be installed for some reasons

### Recommended: 
- Read the routes.rb file for the full version of routes definition in this project, and try to read the (very messy) code to understand what is going on :D 
- Use the command rails console to alter the data directly in the terminal
- Use the command rails routes --expanded to see a clearer version of routes list





