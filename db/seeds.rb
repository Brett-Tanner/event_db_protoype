User.destroy_all

User.create([
  {
    name: "カレン福原",
    phone: "07042159870",
    role: 0,
    email: "karen_supe@gmail.com",
    password: "password",
    password_confirmation: "password"
  },
  {
    name: "結衣田中",
    phone: "07042159871",
    role: 0,
    email: "random@gmail.com",
    password: "password",
    password_confirmation: "password"
  },
  {
    name: "所平小谷",
    phone: "07042159872",
    role: 0,
    email: "baseball@gmail.com",
    password: "password",
    password_confirmation: "password"
  },
  {
    name: "ミノル",
    phone: "07042159873",
    role: 1,
    email: "okurayama@gmail.com",
    password: "password",
    password_confirmation: "password"
  },
  {
    name: "ひらがな",
    phone: "07042159874",
    role: 1,
    email: "test@gmail.com",
    password: "password",
    password_confirmation: "password"
  },
  {
    name: "admin",
    phone: "07042159875",
    role: 2,
    email: "admin@gmail.com",
    password: "adminpass",
    password_confirmation: "adminpass"
  }
])

puts "Created 3 parents, 2 SMs and an Admin"