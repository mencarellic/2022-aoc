#!/usr/bin/env ruby

count_monkey=-1
starting_items={}
operations={}
tests={}
tr={}
fa={}
total_inspected={}
verbose = false

div = 3 ## Part 1
rounds = 20 ## Part 1
# div = 1 ## Part 2
# rounds = 10000 ## Part 2



def get_throw_target(bored_val, test_val, tr,fa, lcm)
  calc = bored_val % lcm
  if (calc % test_val).zero? then
    tr.to_i
  else
    fa.to_i
  end
end

File.readlines('day11.test', chomp: true).each do |line|
  case
  when line.match("Monkey")
    count_monkey += 1
    total_inspected[count_monkey] = 0
  when line.match("Starting items: ")
    items = []
    line.scan(/(\d+)/).each do |item|
      items.append(item[0])
    end
    starting_items[count_monkey] = items
  when line.match("Operation:")
    case
    when line.include?("*")
      op = "multiply"
    when line.include?("+")
      op = "add"
    end
    val = line.match(/.*\s(.*)$/).captures[0]
    operations[count_monkey] = [op,val]
  when line.match("Test:")
    tests[count_monkey] = line.match(/(\d+)/).captures[0].to_i
  when line.match("If true")
    tr[count_monkey] = line.match(/(\d+)/).captures[0].to_i
  when line.match("If false")
    fa[count_monkey] = line.match(/(\d+)/).captures[0].to_i
  end
end

lcm = tests.values.reduce(:lcm)
puts "LCM: #{lcm}" if verbose == true

(1..rounds).each do |round|
  puts "Round #{round}" if round % 100 == 0
  (0..count_monkey).each do |monkey|
    del_items = []
    puts "Monkey #{monkey}" if verbose == true
    starting_items[monkey].each do |item|
      puts "Inspecting item #{item}" if verbose == true
      op = operations[monkey]

      case
      when op[0] == "multiply" && op[1] == "old"
        new_worry = item.to_i * item.to_i
      when op[0] == "multiply" && op[1] != "old"
        new_worry = item.to_i * op[1].to_i
      when op[0] == "add"
        new_worry = item.to_i + op[1].to_i
      end
      puts "New worry is #{new_worry}" if verbose == true
      bored_val = new_worry.div(div)
      puts "Bored worry is #{bored_val}" if verbose == true

      thrown_to = get_throw_target(bored_val, tests[monkey], tr[monkey], fa[monkey], lcm)
      puts "Throwing to #{thrown_to}" if verbose == true
      starting_items[thrown_to].append(bored_val)
      del_items.append(item)
      total_inspected[monkey] += 1
    end
    del_items.each do |item|
      starting_items[monkey].delete(item)
    end
  end
  puts '-------------' if verbose == true
end
puts starting_items if verbose == true
puts total_inspected if verbose == true
puts total_inspected.values.max(2)[0] * total_inspected.values.max(2)[1]

