#!/usr/bin/env ruby

total = 0
total2 = 0

File.read('day2.input').lines do |line|
  pts, opp, sel = nil

  opt = line.split

  case opt[0]
  when "A"
    opp = 1 # rock
  when "B"
    opp = 2 # paper
  when "C"
    opp = 3 # scissor
  end

  case opt[1]
  when "X"
    sel = 1 # rock
  when "Y"
    sel = 2 # paper
  when "Z"
    sel = 3 # scissor
  end

  if sel == 3 && opp == 1 then
    opp = 4
  elsif sel == 1 && opp == 3 then
    opp = 0
  end

  if opp == sel then
    outcome = 3
  elsif opp > sel then
    outcome = 0
  elsif opp < sel then
    outcome = 6
  end

  pts = sel + outcome

  total += pts
end

File.read('day2.input').lines do |line|
  pts, opp, sel, outcome = nil

  opt = line.split

  if opt[1] == "X" then
    outcome = 0
  elsif opt[1] == "Y" then
    outcome = 3
  elsif opt[1] == "Z" then
    outcome = 6
  end

  case opt[0]
  when "A"
    opp = 1 # rock
    if outcome == 0 then
      sel = 3 # scissor
    elsif outcome == 3 then
      sel = 1 # rock
    elsif outcome == 6 then
      sel = 2 # paper
    end
  when "B"
    opp = 2 # paper
    if outcome == 0 then
      sel = 1 # rock
    elsif outcome == 3 then
      sel = 2 # paper
    elsif outcome == 6 then
      sel = 3 # scissor
    end
  when "C"
    opp = 3 # scissor
    if outcome == 0 then
      sel = 2 # paper
    elsif outcome == 3 then
      sel = 3 # scissor
    elsif outcome == 6 then
      sel = 1 # rock
    end
  end
  pts = sel + outcome

  total2 += pts
end

puts total
puts total2
