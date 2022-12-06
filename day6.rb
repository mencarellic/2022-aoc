#!/usr/bin/env ruby

# val = "mjqjpqmgbljsphdztnvjfqwrcgsmlb"
# val = "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg"
val = File.read('day6.input').to_s

(0..val.length).each do |i|
  if i > 3
    prior_str = val.split("").values_at(i-4..i).join("").each_char.tally
    if prior_str.values.uniq.length == 1
      puts "Start of packet #{i}"
      break
    end
  end
end

(0..val.length).each do |i|
  prior_str = val.split("").values_at(i-13..i).join("").each_char.tally
  if prior_str.values.uniq.length == 1
    puts "Start of message #{i + 1}"
    break
  end
end
