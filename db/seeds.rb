User.destroy_all
School.destroy_all
Child.destroy_all
Event.destroy_all

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

admin = {
  name: "admin",
  phone: "07042159875",
  role: 2,
  email: "admin@gmail.com",
  password: "adminpass",
  password_confirmation: "adminpass"
}

School.all.each do |school|
  school.users.create(admin)
end

puts "Added the admin as a user to each school"

okurayama = School.find_by(name: "Okurayama")
okurayama.users.create([
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
shinjo.users.create([
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
mizonokuchi.users.create([
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


puts "Gave the first parent from each school once child, and the second two children"

winter_school = {
  title: "Winter School 2022",
  description: "Fun winter activities for all!",
  start_date: "2022-12-07",
  end_date: "2022-12-09",
  event_days_attributes: {
    1 => {
    date: "2022-12-7",
    fee: 500,
    morning_description: "Fun for everyone!",
    afternoon_description: "Fun for everyone!"
    },
    2 => {
    date: "2022-12-8",
    fee: 500,
    morning_description: "Fun for everyone!",
    afternoon_description: "Fun for everyone!"
    },
    3 => {
    date: "2022-12-9",
    fee: 500,
    morning_description: "Fun for everyone!",
    afternoon_description: "Fun for everyone!"
    }
  }
}

School.all.each do |school|
  school.events.create(winter_school)
end

okurayama.events.create(
  title: "Summer School 2023",
  description: "Fun summer activities for all!",
  start_date: "2023-06-07",
  end_date: "2023-06-08",
  event_days_attributes: {
    1 => {
    date: "2023-06-07",
    fee: 800,
    morning_description: "Fun for everyone!",
    afternoon_description: "Fun for everyone!"
    },
    2 => {
    date: "2023-06-08",
    fee: 800,
    morning_description: "Fun for everyone!",
    afternoon_description: "Fun for everyone!"
    }
  }
)

puts "Added a unique 'Winter School' event to each school, plus 'Summer School' to Okurayama"
puts "Created 3 event days for each Winter School, 2 for Summer School"

okurayama.event_days.each do |day|
  day.registrations.create(child_id: rand(1..9), attend_morning: true, attend_afternoon: false)
end

puts "Added a random child to each event_day"

children = Child.all
contacts = [
  {
    name: "Jill",
    relationship: "Mum",
    phone: "1111111111"
  },
  {
    name: "Jack",
    relationship: "Dad",
    phone: "222222222222"
  }
]

children.each do |child|
  child.emergency_contacts.create(contacts)
end

puts "Added two emergency contacts to each child"