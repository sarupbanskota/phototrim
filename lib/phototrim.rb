#! /usr/local/bin/ruby -w
# Sarup Banskota

require 'phototrim/version'
require 'RMagick'
include Magick

class Phototrim
  def self.trim(max_size, root_dir)
    Dir.foreach(root_dir) do |subdir|
      unless subdir == "." or subdir == ".."
        puts "Processing images within #{subdir}..." 
        Dir.foreach(File.join(root_dir, subdir)) do |victimfile|
          unless victimfile == "." or victimfile ==  ".." or File.extname(victimfile) == ".svg"
            puts "Processing file #{victimfile}.."
            victim = ImageList.new(File.join(root_dir, subdir, victimfile))
            if victim.columns > max_size
              puts "#{victimfile} is beyond #{max_size} px wide, scaling down.."
              victim = victim.scale(max_size.to_f/victim.columns)
              puts "Scaled down #{victimfile}."
              victim.write(File.join(root_dir, subdir, victimfile))
            end 
          end
        end
      end
    end

    puts "Done!"
  end
end

