# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Post.destroy_all
Game.destroy_all
User.destroy_all


PASSWORD = "123"
user = User.create(
    first_name: "User1",
    last_name: "User1",
    email: "admin@user1.com",
    av_highscore: 1080,
    av_moves_per_game: 10,
    img: "https://proofmart.com/wp-content/uploads/2021/06/6web.png",
    password: PASSWORD
)

user2 = User.create(
    first_name: "User2",
    last_name: "User2",
    email: "admin@user2.com",
    av_highscore: 2080,
    av_moves_per_game: 20,
    img: "https://proofmart.com/wp-content/uploads/2021/06/6web.png",
    password: PASSWORD
)

user3 = User.create(
    first_name: "User3",
    last_name: "User3",
    email: "admin@user3.com",
    av_highscore: 10000,
    av_moves_per_game: 20,
    img: "https://proofmart.com/wp-content/uploads/2021/06/6web.png",
    password: PASSWORD
)

3.times do 
    created_at = Faker::Date.backward(days:365 * 5)

    g = Game.create(
        moves: 10,
        highscore: 1080,
        created_at: created_at,
        updated_at: created_at,
        user_id: user.id
    )
end

3.times do 
    created_at = Faker::Date.backward(days:365 * 5)

    g = Game.create(
        moves: 20,
        highscore: 2080,
        created_at: created_at,
        updated_at: created_at,
        user_id: user2.id
    )
end

3.times do 
    created_at = Faker::Date.backward(days:365 * 5)

    g = Game.create(
        moves: 20,
        highscore: 10000,
        created_at: created_at,
        updated_at: created_at,
        user_id: user2.id
    )
end



users = User.all
games = Game.all


puts "generated user #{users.count}"

puts "generated games #{games.count}"
