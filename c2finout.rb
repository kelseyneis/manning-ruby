celcius = File.read("temp.dat")
print "Celsius value from file: ", celcius
fh = File.new("temp.out", "w")
fh.puts celcius.to_i * 9 / 5 + 32
fh.close
