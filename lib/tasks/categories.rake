namespace :categories do
  desc "Task description"
  task init: :environment do
    name = ["Hội họa", "Ảnh", "Video"]
    name.each do |i|
      puts i
      category = Category.new(name: i, description: "Tập hợp ảnh",
        image: "/images/category_1.jpg")
      category.save(validate: false)
      category.update_columns(image: "category_1.jpg")
    end
  end
end
