namespace :rate do
  desc "Task description"
  task init: :environment do
    portfolicos = Portfolio.all
    portfolicos.each do |portfolico|
      1.upto(20) do |i|
        puts "rate #{i}"
        comment = Rate.create(description: Faker::Commerce.department,
          number: rand(1..5),
          portfolio_id: portfolico.id,
          user_id: portfolico.user_id)
      end
    end
  end
end
