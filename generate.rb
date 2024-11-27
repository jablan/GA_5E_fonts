bytesize = 33
bytes_per_row = 4
total_width = 20
font_width = 12
font_height = 20
left_offset = 4

File.open('12X20B.font', 'wb') { |file|
  File.foreach('12X20B.hex').with_index { |line, i|
    next if i <= 32 || i >= 0x7f

    puts "\n\ni: #{i} #{line}\n"

    line = line.chomp
    _addr, data = line.split(':', 2)

    single_char = data
      .chars
      .each_slice(bytes_per_row)
      .map(&:join)
      .map{|row| row.to_i(16).to_s(2).rjust(total_width, '0').split('')[left_offset, font_width]} # [0, font_height]
      .tap{|o| o.each {|row| puts "#{row.join} #{row.size}"}}
      .transpose
      .map{|row| row.join.ljust(24, '0')} # always 3 bytes per column
      # .tap{|o| p o}
      .join
      .split('')
      .each_slice(8)
      .map{|b| b.join.to_i(2).chr}
      .join

    single_char = single_char[0, bytesize]

    # pos.times { file.write("\0"*bytesize) }
    file.write(single_char)
    file.write("\x00"*(bytesize-single_char.bytesize))
  }
  file.write("\x00"*bytesize) # last char, blank
}
