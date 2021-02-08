# frozen_string_literal: true

# first module
module MyFirstModule
  def ruby_version
    system('ruby -v')
  end
end

class ModuleTester
  include MyFirstModule
end
mt = ModuleTester.new
mt.ruby_version
