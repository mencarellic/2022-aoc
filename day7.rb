#!/usr/bin/env ruby

def solve(inputfilename)
  commands = File.read(inputfilename)
                 .split('$ ')
                 .reject(&:empty?)
                 .map{ _1.split("\n").map(&:split) }

  dirs = Hash.new(0)
  cwd = []
  commands.each do |cmd, *args|
    case cmd
    in ['ls']
      total_contents_size = args.sum{ |sz, _fname| sz.to_i }
      (0..cwd.size).each do |i|
        dirs[cwd[0, i]] += total_contents_size
      end
    in ['cd','..'] then cwd.pop
    in ['cd', '/'] then cwd = []
    in ['cd', dir] then cwd.push(dir)
    else warn "unknown command #{cmd}"
    end
  end

  # Part 1
  puts dirs.values.reject{_1 > 100000}.sum

  # Part 2
  total = 70000000
  required = 30000000
  free = total - dirs[[]]
  required -= free
  puts dirs.values.select{|size| size >= required}.min
end

solve('day7.input')