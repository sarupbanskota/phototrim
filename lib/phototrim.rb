#! /usr/local/bin/ruby -w
# Sarup Banskota

require 'phototrim/version'
require 'RMagick'
include Magick

class Phototrim
  def self.trim max_size, src_photo_path, dest_photo_path
    puts "Processing file #{src_photo_path}"
    victim = ImageList.new src_photo_path
    if victim.columns > max_size
      puts "#{src_photo_path} is beyond #{max_size}px wide, scaling down.."
      victim = victim.scale(max_size.to_f/victim.columns)
      puts "Scaled down #{src_photo_path}"
      victim.write dest_photo_path
    end
  end

  def self.wrangle max_size, src_path, dest_path
    Dir.foreach src_path do |src_object|
      # reduce that check into a method
      unless src_object == "." or src_object == ".." or File.extname(src_object) == ".svg"
        if File.directory? File.join(src_path, src_object)
          puts "Processing images within #{src_object}..."
          system "mkdir -p #{File.join(dest_path, src_object)}"
          wrangle max_size, File.join(src_path, src_object), File.join(dest_path, src_object)
        else
          trim max_size, File.join(src_path, src_object), File.join(dest_path, src_object)
        end
      end
    end
  end

  def self.main max_size, src_path, dest_path=nil
    dest_path ? system("mkdir -p #{dest_path}") : (dest_path = src_path)
    File.directory?(src_path) ? wrangle(max_size, src_path, dest_path) : trim(max_size, src_path, dest_path)
  end

end

