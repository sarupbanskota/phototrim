# Phototrim

Simple gem that helps with resizing a bunch of photos

## Installation

Phototrim has `rmagick` as dependency and it requires MagicWand to run. Depending on your distribution, you'll have to install MagickWand headers first:


	$ sudo apt-get install libmagickwand-dev
	$ sudo yum install ImageMagick-devel


Add this line to your application's Gemfile:

     gem 'phototrim'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install phototrim

## Usage

The `Phototrimmer` class makes available to you the `main` function, that does all your heavy lifting. Simply do a:
		
```ruby

	require 'phototrim'

        trimmer = Phototrimmer.new max_size_in_px, src_dir, dest_dir
        trimmer.main
	# example: 
	# trimmer = Phototrimmer.new 640, "/home/sarupbanskota/old_images", "/home/sarupbanskota/better_destination"
        # trimmer.main
 
```

Phototrim also shows up as a terminal command you can use. Assuming you want to *trim* photos to a width of 50px within `~/memories/goa_photos`, you can use the `phototrim` command. If you like, there's also a destination option.
	
	$ phototrim 50 ~/memories/goa_photos
	$ phototrim 640 ~/memories/goa_photos ~/Pictures/Goa        

Boom! :)

## Contributing

1. Fork it ( https://github.com/sarupbanskota/phototrim/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
