user1 = User.create!(
  first_name: "Joe",
  last_name: "Shmoe",
  email: "joeshmoe@joe.com",
  password: "password",
  password_confirmation: "password"
)
Presentation.create(title: "How to Be Super Cool",  description: "Nuff Said", user: user1, video: "https://www.youtube.com/watch?v=MkzeOmkOUHM")
Presentation.create(title: "Why Dogs Are Better Than People",  description: "Woof", user: user1)
