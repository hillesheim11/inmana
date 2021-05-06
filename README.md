# 🔗 Inmana
<!--ts-->
   * [About](#about)
   * [Environment settings](#environment-settings)
   * [Installation](#installation)
   * [Usage](#usage)
      * [Create users](#create-users)
      * [Create supplies](#create-supplies)
      * [Show supplies](#show-supplies)
      * [Send expiration notifications](#send-expiration-notifications)
      * [Sent emails viewer](#sent-emails-viewer)
   * [Tests](#tests)
   * [Technologies](#technologies)
   * [Author](#author)
<!--te-->

## About
Loss prevention with intelligent expiration date management.

This project was created during the [Next Level Week](https://nextlevelweek.com) 5th edition.

## Environment settings
To run the application install [Elixir and Earlang](https://elixir-lang.org/install.html#install), [Phoenix](https://hexdocs.pm/phoenix/installation.html#phoenix) and [Postgres](https://www.postgresql.org/download/).

## Installation
Get the repository:

```bash
git clone https://github.com/hillesheim11/inmana.git
```
</br>

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate the database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000/dashboard`](http://localhost:4000) from your browser, for phoenix information.

## Usage

### Create users
First, to use de API correctly, you need to create a user/restaurant. To do this, we'll pass the user's name and email to the following route, http://<a></a>localhost:4000/api/restaurants.
```bash
curl -i -X POST -H "Content-Type: application/json" \
-d '{"name": "Restaurant Inmana", "email": "contact@inmana.com"}' \
http://localhost:4000/api/restaurants
```
</br>

After execute the command you'll get the respoonse below
```bash
{
  "message":"Restaurant created!",
  "restaurant": {
      "email":"contact@inmana.com",
      "name":"Restaurant Inmana",
      "id":"1ce94f7d-dd95-48f4-96b0-1026bd0cae4d"
  }
}   
```
</br>

If the email already exists in your database, you may see the following response
```bash
{
  "message": {
    "email": [
      "has already been taken"
    ]
  }
}
```
Now we can create and add a supply to the restaurant.

### Create supplies
If you already created a restaurant, we now may create a supply to the restaurant. With the id created in the route before, we will pass to the supply's route the description, expiration date and who is responsible.
```bash
curl -i -X POST -H "Content-Type: application/json" -d \
'{"restaurant_id": "1ce94f7d-dd95-48f4-96b0-1026bd0cae4d", "description": "Tomato sauce one kilo",
"expiration_date": "2021-06-20", "responsible": "Lucas Hillesheim"}' http://localhost:4000/api/supplies
```
</br>

Reponse when the supply is created
```bash
{
  "message":"Supply created!",
  "supply": {
    "description":"Tomato sauce one kilo",
    "expiration_date":"2021-06-20",
    "responsible":"Lucas Hillesheim",
    "restaurant_id":"1ce94f7d-dd95-48f4-96b0-1026bd0cae4d",
    "id":"ff6fc8da-b4cb-420b-b474-2d7289f7c0ed"
  }
} 
```
</br>

Response error
```bash
{
  "message": {
    "description": [
      "can't be blank"
    ],
    "expiration_date": [
      "is invalid"
    ],
    "responsible": [
      "should be at least 3 character(s)"
    ]
  }
}
```
Let's know see the supply added

### Show supplies
After you insert a supply, you can list that supply informing the id in the route below
```bash
curl -i -X GET -H "Content-Type: application/json" \
http://localhost:4000/api/supplies/ff6fc8da-b4cb-420b-b474-2d7289f7c0ed
```
</br>

Ok
```bash
{
  "supply":{
    "description":"Tomato sauce one kilo",
    "expiration_date":"2021-06-20",
    "responsible":"Lucas Hillesheim",
    "restaurant_id":"1ce94f7d-dd95-48f4-96b0-1026bd0cae4d",
    "id":"ff6fc8da-b4cb-420b-b474-2d7289f7c0ed"
  }
}  
```
</br>

Error
```bash
{
  "message":"Supply not found"
} 
```
### Send expiration notifications

This is the real motive the application exists. By default, after the server is running, it will send to every restaurant, a notification with their supplies expiration date that will expire in the current week. This is scheduled to happen every 7 days. *You can access [this file](lib/inmana/supplies/scheduler.ex) and change the interval if you want.

### Sent emails viewer

Accessing the route http://localhost:4000/sent_emails, you may see the page below. Every time the e-mails is sent,  you can reload the page, an see the e-mail's informations.
</br>

Before send
![image](https://user-images.githubusercontent.com/62484542/116949408-7251e000-ac58-11eb-809b-89b028ccc5ad.png)

After sent
![image](https://user-images.githubusercontent.com/62484542/116950399-46842980-ac5b-11eb-86da-8853a85f1903.png)

## Tests

It was created 19 tests to this API. Run it with `mix test` on the terminal.

## Technologies

The tools below was used in this project
- [Elixir](https://elixir-lang.org)
- [Phoenix](https://www.phoenixframework.org)
- [Bamboo](https://github.com/thoughtbot/bamboo)
- [ExCoveralls](https://github.com/parroty/excoveralls)

## Author

<div>
 <img src="https://avatars.githubusercontent.com/u/62484542?v=50" width="100px"/>
</div>
<div>
 <sub><b>Lucas Hillesheim</b></sub>
</div>

Done with ❤️ by Lucas Hillesheim 👋🏽 Contact!

[![Linkedin Badge](https://img.shields.io/badge/-Lucas-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/lucas-hillesheim/)](https://www.linkedin.com/in/lucas-hillesheim/) 
[![Gmail Badge](https://img.shields.io/badge/-lucashillesheim11@gmail.com-c14438?style=flat-square&logo=Gmail&logoColor=white&link=mailto:lucashillesheim11@gmail.com)](mailto:lucashillesheim11@gmail.com)
