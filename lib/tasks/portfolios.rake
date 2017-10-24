namespace :portfolios do
  desc "Task description"
  task init: :environment do
    users = User.all
    image = "portfico.png"
    categories = Category.all
    users.each do |user|
      categories.each do |category|
        1.upto(20) do |i|
          puts "portfolios #{i}"
          content_data = Faker::Lorem.paragraph
          portfolico = Portfolio.create(description: content_data, content: content_data,
            user_id: user.id, category_id: category.id, view: Faker::Number.between(100, 10000),
            like: Faker::Number.between(100, 10000))
          portfolico.update_columns(image: image)

          1.upto(10) do |j|
            puts "portfolios #{j}"
            content = Content.create(content: content_data, description: "description",
              portfolio_id: portfolico.id)
            content.update_columns(link: image, typee: "image")
          end
        end
      end
    end
  end
end
