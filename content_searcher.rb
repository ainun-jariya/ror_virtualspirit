print "Enter path (ex:/foldername/subfoldername): "
path = gets.chomp
if File.directory?(path)
    puts "#{path} is a directory."
    files = Dir.glob("#{path}/*")

    # Print the list of files
    h_comparing = Hash.new(0)
    diff_values = Hash.new()
    files.each_with_index do |file, index|
        filesize = File.size(file).to_f
        if filesize < (2**20) # less than 1mb
            h_comparing[File.read(file)] += 1
        else
            puts 'large file'
        end
    end
    max_pair = h_comparing.max_by{|key, value| value }
    puts "#{max_pair[0].chomp("\n")}: #{max_pair[1]}"
else
    puts "#{path} doesn't exist or is not a directory."
end