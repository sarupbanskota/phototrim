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

The `Phototrim` class makes available to you the `trim max_size, root_dir` function, that you can use to *trim* photos within a directory. Simply do a:
		
```ruby

	require 'phototrim'

	Phototrim.trim max_size_in_px, root_dir
	# example: 
	# Phototrim.trim 640, "images" 

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
