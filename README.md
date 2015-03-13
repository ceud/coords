[![Gem Version](https://badge.fury.io/rb/coords.svg)](http://badge.fury.io/rb/coords)

# Coords

A small suite of coordinate system classes allowing distance calculations and conversions between types.

## Installation

Add this line to your application's Gemfile:

    gem 'coords'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install coords

## Usage
```ruby
point = Coords::Cartesian2d.new(1, 2)
d = point.distance(point2)
polar_point = point.to_polar
```
## Contributing

1. Fork it ( https://github.com/ceud/coords/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
