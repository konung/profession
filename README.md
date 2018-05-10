# Profession

Simple gem with a list of professions (over 1000), for matching and parsing professions in a large body of text. For instance this was helpful for parsing out Wikipedia articles for a little school project for my kids.

Please fill free to add more professions to the list, just send a simple PR. Thank you!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'profession'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install profession

## Usage

```ruby
  # Return a sorted unique list of all professions
  Profession::Profession.list


  # Check if your value is in the list, and has an exact match
  Profession::Profession.contains_exact?('Zoo Keeper')

  # Return exact match
  Profession::Profession.exact_match('Zoo Keeper')

  # Do a fuzzy match
  Profession::Profession.match('Keeper')

  #   [
  #     [0] "Book-keeper",
  #     [1] "Gamekeeper",
  #     [2] "Gate Keeper",
  #     [3] "Green Keeper",
  #     [4] "Housekeeper",
  #     [5] "Lighthouse Keeper",
  #     [6] "Lock Keeper",
  #     [7] "Park Keeper",
  #     [8] "Shop Keeper",
  #     [9] "Zoo Keeper"
  # ]

```

### Important!

Matching is NOT case-sensitive and will also strip extra spaces when comparing.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/konung/profession. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Profession project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/profession/blob/master/CODE_OF_CONDUCT.md).
