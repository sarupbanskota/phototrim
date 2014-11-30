#! /usr/local/bin/ruby -w
# Sarup Banskota, 1 December 2014

require 'RMagick'
include Magick

class Phototrim
	def self.trim(max_size, root_dir)
		Dir.foreach(root_dir) do |subdir|
			unless subdir == "." or subdir == ".."
				print "Processing images within " + subdir.to_s + "\n"
				Dir.foreach(File.join(root_dir, subdir)) do |victimfile|
					unless victimfile == "." or victimfile ==  ".." or File.extname(victimfile) == ".svg"
						print "Processing file " + victimfile + "\n"
						victim = ImageList.new(File.join(root_dir, subdir, victimfile))
						if victim.columns > max_size
							print victimfile.to_s + " is beyond " + max_size.to_s + "px wide, scaling down.. \n"
							victim = victim.scale(max_size.to_f/victim.columns)
							print "Scaled down " + victimfile.to_s + ".\n"
							victim.write(File.join(root_dir, subdir, victimfile))
						end 
					end
				end
			end
		end

		print "Done! \n"
	end
end

