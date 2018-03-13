require_relative "lib/post"
require_relative "lib/link"
require_relative "lib/memo"
require_relative "lib/task"

puts "Программа Memento - заметки v2"
puts
puts "Что хочешь записать в блокнот?"

choices = Post.post_types.keys
choice = -1

until choice >= 0 && choice < choice.size
  choices.each_with_index do |type, index|
    puts "\t#{index}. #{type}"
  end

  choice = STDIN.gets.chomp.to_i
end

entry = Post.create(choices[choice])

entry.read_from_console

rowid = entry.save_to_db

puts "Запись сохранена в базе, id = #{rowid}"