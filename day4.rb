#!/usr/bin/env ruby

total1 = 0
total2 = 0

File.readlines('day4.input', chomp: true).each do |line|
  e1_range, e2_range, pair = nil
  pair = line.split(",")

  e1_range = pair[0].split('-')[0].to_i..pair[0].split('-')[1].to_i
  e2_range = pair[1].split('-')[0].to_i..pair[1].split('-')[1].to_i

  if e1_range.cover?(e2_range) then
    total1 += 1
  elsif e2_range.cover?(e1_range) then
    total1 += 1
  end

  if e1_range.cover?(e2_range.first) then
    total2 += 1
  elsif e2_range.cover?(e1_range.first) then
    total2 += 1
  end

end

puts total1
puts total2