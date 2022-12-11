#!/usr/bin/env ruby

fname = './day8.input'
input = File.read(fname)
input = File.read(fname)


def scenic_score(i, j, mp)
  curr = mp[i][j]

  if i == (mp.size - 1) || j == (mp.size - 1) || i == 0 || j == 0
    return 0
  end

  left_score(i, j, mp) * right_score(i, j, mp) * top_score(i, j, mp) * bottom_score(i, j, mp)
end


def top_score(i, j, mp)
  k = i - 1; d = 0
   while k >= 0
    d += 1; break if mp[k][j] >= mp[i][j]; k -= 1
  end
  d
end


def bottom_score(i, j, mp)
  k = i+1; d = 0
  while k < mp.size
    d += 1; break if mp[k][j] >= mp[i][j]; k += 1
  end
  d
end


def left_score(i, j, mp)
  arr = mp[i].take(j).reverse; curr = mp[i][j]; d = 0;
  arr.each do |a|
    d += 1; break if a >= curr
  end
  d
end


def right_score(i, j, mp)
  arr = mp[i].last(mp.size-j-1); curr = mp[i][j]; d = 0
  arr.each do |a|
    d += 1; break if a >= curr
  end
  d
end

mp = []
scores = []
lines = input.split("\n")
lines.each { |l| mp << l.split('').map(&:to_i)}

i = 0; j = 0;
while i < lines.size
  j = 0
  while j < lines.size
    scores << scenic_score(i,j,mp)
    j += 1
  end
  i += 1
end
pp scores.max