User.destroy_all
Pet.destroy_all
Routine.destroy_all

User.create(name: "Pan")
User.create(name: "Sin")


5.times do
    Pet.create(name:Faker::Name.first_name, age:Faker::Number.within(range: 1..10), species: "dog")
end

5.times do
    Pet.create(name:Faker::Name.first_name, age:Faker::Number.within(range: 1..10), species: "cat")
end

30.times do
    Routine.create(name:Faker::Verb.simple_present, description:Faker::Food.description, if_complete:true, user_id:1, pet_id:Faker::Number.within(range: 1..10), on_date:nil)
end

30.times do
    Routine.create(name:Faker::Verb.simple_present, description:Faker::Food.description, if_complete:false, user_id:2, pet_id:Faker::Number.within(range: 1..10), on_date:nil)
end
