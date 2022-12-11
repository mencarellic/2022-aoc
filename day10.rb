#!/usr/bin/env ruby

x=1
cycle=0
totals=[]
pos=[0,1,2]

def cycle_check(cyc, x)
  checks = [20,60,100,140,180,220]
  if checks.include?(cyc) then
    return x * cyc
  end
  return 0
end

File.readlines('day10.input', chomp: true).each do |line|
  case
  when line.match("noop")
    cycle += 1
    totals << cycle_check(cycle, x)
  when line.match("add.*")
    cycle += 1
    totals << cycle_check(cycle, x)
    cycle += 1
    totals << cycle_check(cycle, x)
    x += line.split(" ")[1].to_i
  end
end

totals.delete_if {|x| x == 0}
# puts totals.sum ## Pt2

h = 6
w = 40


# fname = './day10.test'
# input = File.read(fname)
# lines = input.split("\n")

# x = 1; c = 0; a = {}
# op = []
# sprt = [0,1,2]
# lines.each do |l|
#   if l == 'noop'
#     c += 1
#     next
#   end
#   c += 2
#   x += l.split(' ')[1].to_i
#   a[c] = x
# end
# x = 2
# (0..239).each do |c|
#   x = a.select{|k,v| k <= c}.values.last || 1
#   sprt = [x-1, x, x+1]
#   op << "\n" if c % 40 == 0
#   sprt.include?(c % 40) ? (op << '#') : (op <<  '.')
#  end
# pp op.join('')