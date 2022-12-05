#!/usr/bin/env ruby

def get_score(letter)
  if /[[:upper:]]/.match(letter) then
  val = 64
  modifier = 26
  else
  val = 96
  modifier = 0
  end
  letter.bytes.map{|b| b - val}[0] + modifier
end

total = 0
total_score = 0
elf_group = []

File.read('day3.input').lines do |line|
  first,second = line.partition(/.{#{line.size/2}}/)[1,2]
  subtotal, modifier = nil

  first.chars.each do |char|
    if second.include? char
      puts "----- #{char} -----"
      puts get_score(char)
      subtotal = get_score(char)
      break
    end
  end

  total += subtotal
end

puts total

File.readlines('day3.input', chomp: true).each do |line|
  elf_group.push(line)

  if elf_group.length == 3
    elf_group[0].split('').each do |l|
      if elf_group[1].include?(l) && elf_group[2].include?(l)
        total_score += get_score(l)

        break
      end
    end

    elf_group = []
  end
end

puts total_score
