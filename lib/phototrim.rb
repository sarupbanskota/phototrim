#! /usr/local/bin/ruby -w
# Sarup Banskota

require 'phototrim/version'
require 'RMagick'
include Magick

class Phototrim
  def self.trim(max_size, root_path)
    Dir.foreach root_path do |path_object|
      unless path_object == "." or path_object == ".." or File.extname(path_object) == ".svg"
        if File.directory? File.join(root_path, path_object)
          puts "Processing images within #{path_object}..."
          trim(max_size, File.join(root_path, path_object))
        else
          puts "Processing file #{path_object}"
          victim = ImageList.new(File.join(root_path, path_object))
          if victim.columns > max_size
            puts "#{path_object} is beyond #{max_size}px wide, scaling down.."
            victim = victim.scale(max_size.to_f/victim.columns)
            puts "Scaled down #{path_object}"
            victim.write(File.join(root_path, path_object))
          end
        end
      end
    end
    puts "Done!"
  end
end

