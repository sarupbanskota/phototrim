#! /usr/local/bin/ruby -w
# Sarup Banskota, 1 December 2014

require 'RMagick'
include Magick

Dir.foreach('images') do |subdir|
	unless subdir == "." or subdir == ".."
		print "Processing images within " + subdir.to_s + "\n"
		Dir.foreach(File.join("images", subdir)) do |victimfile|
			unless victimfile == "." or victimfile ==  ".."
				print "Processing file " + victimfile + "\n"
				victim = ImageList.new(File.join("images", subdir, victimfile))
				if victim.columns > 640
					print victimfile.to_s + " is beyond 640px wide, scaling down.. \n"
					victim = victim.scale(640.0/victim.columns)
					print "Scaled down " + victimfile.to_s + ".\n"
					victim.write(File.join("images", subdir, victimfile))
				end 
			end
		end
	end
end

exit