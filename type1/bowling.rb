require "bundler/setup"
require 'tapp'

def frame_generator(pins)
  Enumerator.new do |y|
    index = 0
    terminate_index = pins.count - 1

    loop do
      cpin = pins[index]
      if cpin == 10
        from, to = index, index + 2
      else
        index += 1
        npin = pins[index]
        if (cpin + npin) == 10
          from, to = index - 1, index + 1      
        else
          from, to = index - 1, index              
        end
      end
      y << pins[from..to].inject(:+)
      break if to == terminate_index
      index += 1
    end
    
  end  
end

if __FILE__ == $0

  pins = ARGV.shift.split(/,/).map(&:to_i)

  puts frame_generator(pins).inject(:+)

else
  
end
