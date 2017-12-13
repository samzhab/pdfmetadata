#!/usr/bin/env ruby
require 'pdf-reader'
require 'yomu'
require 'date'
  author = 'MarcoVigano'
  yml_path = Dir.pwd + '/pdf/' + author + '_metadata.yml'
  pdf_names = Dir.entries(Dir.pwd + '/pdf/' + author)
  count = pdf_names.count
    metadata_file = File.new(yml_path, 'w')
  range = 0..count-1
  creation_year = []
  Dir.foreach(Dir.pwd + '/pdf/' + author) do |item|
    next if item == '.' or item == '..'
      file = File.open(Dir.pwd + '/pdf/' + author + '/' + item)
      reader = PDF::Reader.new(file)
      puts '---------------xx-x-x-x-x-x-x----------------'
      metadata_file.puts '---------------xx-x-x-x-x-x-x----------------'
      puts item
      metadata_file.puts item
      puts 'PDF VERSION - ' + reader.pdf_version.to_s
      metadata_file.puts 'PDF VERSION - ' + reader.pdf_version.to_s
        if reader.info[:Author]
          puts 'AUTHOR - ' + reader.info[:Author].to_s
          metadata_file.puts 'AUTHOR - ' + reader.info[:Author].to_s
        end
        if reader.page_count
          puts 'PAGES - ' + reader.page_count.to_s
          metadata_file.puts 'PAGES - ' + reader.page_count.to_s
        end
        if reader.info[:Creator]
          puts 'CREATOR - ' + reader.info[:Creator].to_s
          metadata_file.puts 'CREATOR - ' + reader.info[:Creator].to_s
        end
        if reader.info[:Producer]
          puts 'PRODUCER - ' + reader.info[:Producer].to_s
          metadata_file.puts 'PRODUCER - ' + reader.info[:Producer].to_s
        end
        if reader.info[:CreationDate]
          time_stamp = reader.info[:CreationDate][2..15]
          puts reader.info[:CreationDate]
          puts 'CREATED ON - ' + time_stamp[0..3] + ' / ' + time_stamp[4..5] + ' / ' + time_stamp[6..7]
          metadata_file.puts 'CREATED ON - ' + time_stamp[0..3] + ' / ' + time_stamp[4..5] + ' / ' + time_stamp[6..7]
        end

      # if reader.metadata
      #   puts 'METADATA ' + reader.metadata
      #   metadata_file.puts 'METADATA ' + reader.metadata
      # end

      # yomu = Yomu.new(file)
      # puts yomu.metadata.inspect
      # puts yomu.metadata['X-Parsed-By']
      # puts yomu.metadata['Content-Encoding']
end
metadata_file.close
