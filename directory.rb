require "io/console"

def input_students

  students = []
  next_student, stdnt = "y", 0

  $arr = [[:name, "Which cohort?: "], [:cohort, "Enter hobbies: "], [:hobbies, "Enter favourite food: "],
        [:favourite_food, "Enter country of birth: "], [:country, "Please check for errors."]]

  until next_student == "n"
    student = {}
    count = -1
    err_input = 0
    puts
    puts first_line = "Please enter the name of the student"
    info = STDIN.noecho(&:gets).chomp

    while count < $arr.size - 1 do
      info = "[No input]" if info == ""
      count += 1
      puts ("#{count + 1}) #{info.center(first_line.size - 2)}").center(36)
      puts
      puts ($arr[count][1]).center(first_line.size)
      student[($arr[count][0])] = info

      error = "y"
      if count == $arr.size - 1
        until error == "n"
          puts "To corrct an entry just enter".center(36)
          puts "the corresponding number".center(36)
          puts "To exit this option, ENTER.".center(36)
          error_num = STDIN.noecho(&:gets).chomp

          error_num == "" ? break : error_num = error_num.to_i

          while !(1..(($arr.size) -1)).include?(error_num)
            puts "Invalid entry. Try again.".center(36)
            error_num = STDIN.noecho(&:gets).chomp.to_i
            break if error_num == ""
          end

          wrong = student[($arr[error_num -1][0])]
          puts
          puts "Changing: #{wrong}".center(36)
          right = STDIN.noecho(&:gets).chomp
          student[($arr[error_num - 1][0])] = right
          puts "Changed #{wrong} to #{right}.".center(36)
          puts "Any more errors? y : n".center(36)
          error = gets.chomp


# implant error block here



        end
      end
      info = STDIN.noecho(&:gets).chomp if count < $arr.size - 1
      if count == $arr.size - 1
        puts
        puts "Add another student? y : n ?".center(36)
        next_student = STDIN.noecho(&:gets).chomp
        puts next_student.center(36)
      end
    end
    students << student
  end
  students
end


def print_header
  puts
  puts "The students of Villains Academy".center(36)
  puts "--------------------------------".center(36)
end

def print_students(students)
  count = 0
  while count != students.size
    student = students[count]
    puts "(#{count +1})".center(36)
    x = 0
    until x == $arr.size
      puts "#{($arr[x][0]).to_s}: #{student[($arr[x][0])]}".center(36)
      x += 1
    end
    count += 1
    puts
  end
end

def print_footer(students)
  students.size > 1 ? s = "s" : s = ""
  puts "Overall, we have #{students.count} great student#{s}".center(36)
  puts
end

students = input_students
print_header
print_students(students)
puts
print_footer(students)
