namespace :comments do
  desc "Task description"
  task init: :environment do
    portfolicos = Portfolio.all
    portfolicos.each do |portfolico|
      1.upto(20) do |i|
        puts "comment #{i}"
        comment = Comment.create(content: Faker::Commerce.department, portfolio_id: portfolico.id,
          user_id: portfolico.user_id)
      end
    end
  end
end
