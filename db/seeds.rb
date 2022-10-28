
puts "Seeding!"

Role.destroy_all
Audition.destroy_all

15.times do 
    Role.create(character_name: Faker::Movies::StarWars.character)
end


30.times {

    Audition.create(
        actor: Faker::Name.name,
        location: ["NY", "SF", "Seattle", "Chicago", "LA"].sample,
        phone: Faker::PhoneNumber.phone_number,
        hired: [true, false].sample,
        role_id: Role.pluck(:id).sample
    )
}


puts "Done seeding!"