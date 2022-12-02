User.destroy_all
School.destroy_all
Child.destroy_all

User.create([
  {
    name: "admin",
    phone: "07042159875",
    role: 2,
    email: "admin@gmail.com",
    password: "adminpass",
    password_confirmation: "adminpass"
  }
])

puts "Created Admin"


School.create([
  {
    name: "Okurayama",
    address: "1 Okurayama St, Okurayama, Yokohama",
    phone: "00000000000"
  },
  {
    name: "Musahi-Shinjo",
    address: "1 Musashi St, Shinjo, Kawasaki",
    phone: "00000000000"
  },
  {
    name: "Mizonokuchi",
    address: "So much closer to my place",
    phone: "00000000000"
  }
])

puts "Created 3 schools"

okurayama = School.find_by(name: "Okurayama")
okurayama.users = User.create([
  {
    name: "ミノル",
    phone: "07042159873",
    role: 1,
    email: "okurayama@gmail.com",
    password: "password",
    password_confirmation: "password"
  },
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
  }
])

shinjo = School.find_by(name: "Musahi-Shinjo")
shinjo.users = User.create([
  {
    name: "ひらがな",
    phone: "07042159874",
    role: 1,
    email: "test@gmail.com",
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
    name: "サクラ",
    phone: "07042159873",
    role: 0,
    email: "okurayanna@gmail.com",
    password: "password",
    password_confirmation: "password"
  }
])

mizonokuchi = School.find_by(name: "Mizonokuchi")
mizonokuchi.users = User.create([
  {
    name: "Koki",
    phone: "07042159854",
    role: 1,
    email: "monzen@gmail.com",
    password: "password",
    password_confirmation: "password"
  },
  {
    name: "Bill",
    phone: "07040159872",
    role: 0,
    email: "straya@gmail.com",
    password: "password",
    password_confirmation: "password"
  },
  {
    name: "Bazza",
    phone: "07049159873",
    role: 0,
    email: "mate@gmail.com",
    password: "password",
    password_confirmation: "password"
  }
])

puts "Added an SM and 2 parents to each school"


timmy = {
  name: "Timmy",
  birthday: "2000-12-18",
  level: "Land 2",
  allergies: "Augmentin"
}

okurayama_parents = okurayama.users.where(role: 0)
okurayama_parents.first.children.create(timmy)
okurayama_parents.last.children.create([timmy, timmy])

shinjo_parents = shinjo.users.where(role: 0)
shinjo_parents.first.children.create(timmy)
shinjo_parents.last.children.create([timmy, timmy])

mizonokuchi_parents = mizonokuchi.users.where(role: 0)
mizonokuchi_parents.first.children.create(timmy)
mizonokuchi_parents.last.children.create([timmy, timmy])


puts "Give the first parent from each school once child, and the second two children"