#!/usr/bin/env ruby

def get_answer(arr)
  answer = []
  arr.each do |key,value|
    answer.append(value[0])
  end
  answer.join("")
end

def create_stacks()
  i=0
  stack = {
    1 => [],
    2 => [],
    3 => [],
    4 => [],
    5 => [],
    6 => [],
    7 => [],
    8 => [],
    9 => [],
  }

  File.readlines('day5.input', chomp: true).each do |line|
    splits = line.chars.each_slice(4).map(&:join)
    ind = 1
    splits.each do |s|
      unless s.strip.length == 0
        stack[ind].append(s.split("")[1])
      end
      ind += 1
    end

    i += 1
    if i == 8 then
      break
    end
  end
  return stack
end


## Part 1

stacks = create_stacks
moves = `tail -n +11 day5.input`
moves.split("\n").each do |line|
  match = line.match(/move (\d+) from (\d+) to (\d+)/)
  count, from, to = match[1..].map(&:to_i)

  (1..count).each do |move|
    crate = stacks[from][0]
    stacks[to].unshift(crate)
    stacks[from].delete_at(stacks[from].index(stacks[from][0]))
  end
end

puts get_answer(stacks)

## Part 2

stacks = create_stacks
moves = `tail -n +11 day5.input`
moves.split("\n").each do |line|
  match = line.match(/move (\d+) from (\d+) to (\d+)/)
  count, from, to = match[1..].map(&:to_i)

  crate = stacks[from].values_at(0..count-1)
  stacks[to].unshift(crate)
  stacks[to].flatten!
  (1..count).each do |move|
    stacks[from].delete_at(stacks[from].index(stacks[from][0]))
  end
end

puts get_answer(stacks)
