#! /usr/local/bin/ruby -w
# Sarup Banskota

require 'phototrim/version'
require 'RMagick'
include Magick

class Phototrimmer

  def initialize max_size, src_path, dest_path=nil
    @size = max_size
    @src = src_path
    @dest = dest_path.nil? ? @src : dest_path
  end

  def main
    system("mkdir -p #{@dest}")
    File.directory?(@src)? wrangle : trim
  end

  def wrangle
    Dir.foreach @src do |object|
      next if ignored_type object
      subtrimmer = Phototrimmer.new @size, 
                                    File.join(@src, object), 
                                    File.join(@dest, object)
      if File.directory? File.join @src, object
        puts "Processing images within #{object}..."
        system "mkdir -p #{ File.join @dest, object }"
        subtrimmer.wrangle
      else
        subtrimmer.trim
      end
    end
  end

  def trim
    puts "Processing file #{@src}"
    victim = ImageList.new @src
    if victim.columns > @size
      puts "#{@src} is beyond #{@size}px wide, scaling down.."
      victim = victim.scale @size.to_f/victim.columns
      puts "Scaled down #{@src}"
      victim.write @dest
    end
  end

  def ignored_type object
    %w[. ..].include? object or %w[.svg].include? File.extname object
  end

end
