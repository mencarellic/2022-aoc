#!/usr/bin/env ruby

elves = []
current_elf = 0

File.read('day1.input').lines do |line|
  if line.chomp.empty?
    elves << current_elf
    current_elf = 0
  else
    current_elf += line.chomp.to_i
  end
end

puts elves.max(3).sum
