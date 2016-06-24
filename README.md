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

Prints STDOUT as INFO:

```ruby
    TimestampedOut.new.call do
      print "\nTest"
    end
    2016-06-23 17:08:10 +0200 95434 TID-out0sge0o INFO: Test
```

Prints STDERR (including backtrace) as ERROR:

```ruby
    TimestampedOut.new.call do
      1 / 0
    end
    2016-06-23 17:20:42 +0200 95986 TID-ow6a19fy4 ERROR: divided by 0
    ...backtrace...
```

Works also with embedded shell commands:

```ruby
    TimestampedOut.new.call do
      system 'echo "abc"'
      result = `echo "2"`
      p result.to_i * 3
    end
    2016-06-23 17:23:07 +0200 95986 TID-ow6a2el10 INFO: abc
    2016-06-23 17:23:07 +0200 95986 TID-ow6a2el10 INFO: 6
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/maicher/timestamped_out. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
