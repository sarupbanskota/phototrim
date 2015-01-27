#! /usr/local/bin/ruby -w
# Sarup Banskota

require 'phototrim/version'
require 'RMagick'
include Magick

class Phototrim
  def self.trim(max_size, src_path, dest_path=nil)
    unless dest_path
      dest_path = src_path
    end
    Dir.foreach src_path do |src_object|
      unless src_object == "." or src_object == ".." or File.extname(src_object) == ".svg"
        if File.directory? File.join(src_path, src_object)
          puts "Processing images within #{src_object}..."
          system "mkdir -p #{File.join(dest_path, src_object)}"
          trim(max_size, File.join(src_path, src_object), File.join(dest_path, src_object))
        else
          puts "Processing file #{src_object}"
          victim = ImageList.new(File.join(src_path, src_object))
          if victim.columns > max_size
            puts "#{src_object} is beyond #{max_size}px wide, scaling down.."
            victim = victim.scale(max_size.to_f/victim.columns)
            puts "Scaled down #{src_object}"
            victim.write(File.join(dest_path, src_object))
          end
        end
      end
    end
  end
end

