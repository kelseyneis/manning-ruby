# frozen_string_literal: true

# override method_missing Kernel method
class Student
  def method_missing(m, *args)
    if m.to_s.start_with?('grade_for_')
      puts "You got an A in #{m.to_s.split('_').last.capitalize}!"
    else
      super
    end
  end

  def respond_to_missing?
    true
  end
end
