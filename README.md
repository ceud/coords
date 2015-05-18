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

### Utilities
```ruby
# convert degrees to radians
Coords.radians(180)
 => 3.141592653589793

# convert radians to degrees
Coords.degrees(Math::PI)
 => 180.0
```

### Cartesian (2D)
```ruby
# create a new point
p = Cartesian2d.new(1, 2)

# access point coordinates
p.x
 => 1
p.y
 => 2

# find distances between points
p2 = Cartesian2d.new(3, 3)
p.distance_squared(p2)
 => 5
p.distance(p2)
 => 2.23606797749979

# convert to polar coordinate system
p.to_polar
 => #<Coords::Polar @radius=2.2360679775, @theta=1.107148717794>

# translate coordinates (add values to them)
p.translate(1, 1)
 => #<Coords::Cartesian2d @x=2, @y=3>

# rotate point around origin
p.rotate(Coords.radians(180))
 => #<Coords::Cartesian2d @x=-1.0, @y=-2.0>

# reflect point against origin, line, x-axis or y-axis
p.reflect('origin')
 => #<Coords::Cartesian2d @x=-1, @y=-2> 
p.reflect('line')
 => #<Coords::Cartesian2d @x=2, @y=1> 
p.reflect('x')
 => #<Coords::Cartesian2d @x=1, @y=-2> 
p.reflect('y')
 => #<Coords::Cartesian2d @x=-1, @y=2> 
```

## Contributing

1. Fork it ( https://github.com/ceud/coords/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
