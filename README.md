# TimestampedOut

A class for prepending timestamps to Ruby standard out and error. Published as a Ruby Gem.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'timestamped_out'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install timestamped_out

## Usage

```ruby
    TimestampedOut.new.call do
      print "\nTest"
    end
    2016-05-29 14:34:18 UTC 24342 TID-ovyq9cdtw INFO: Test => #<TimestampedOut:0x007fb6ca83e4a0>
```

```ruby
    TimestampedOut.new.call do
      1 / 0
    end
    2016-05-29 14:34:56 UTC 24342 TID-ovyq9cdtw ERROR: divided by 0
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/maicher/timestamped_out. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

