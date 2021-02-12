# frozen_string_literal: true

$gvar = 'I\'m a global!'
# variable scope
class C
  def examine_global
    puts $gvar
  end
end
c = C.new
c.examine_global
puts $gvar

class D
  def x(value_for_a,recurse=false)
    a = value_for_a
    print "Here's the inspect-string for 'self':"
    p self
    puts "And here's a:"
    puts a
    if recurse
      puts 'Calling myself (recursion)...'
      x('Second value for a')
      puts 'Back after recursion; here\'s a:'
      puts a
    end
  end
end
d = D.new
d.x('First value for a', true)

# nested constants
module M
  class R
    X = 2
    class F
      module N
        X = 1
      end
    end
  end
end
puts M::R::F::N::X
puts M::R::X
