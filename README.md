# AutoSpecs

*Don't Write specs yourself.*

You might be caught up in the situation where all the development work is done first and then you have to write specs.

The purpose of this gem is to serve as the bootstrap tool where all the known specs are already written for you.

## Prerequisites

In order to use this gem, the following steps needs to be done before installing this gem.

1. install `rspec-rails` gem. Refer to the official page of the gem to know more.
2. install `shoulda-matchers` gem. Refer to the official page of the gem to know more.

The reason we chose `rspec` and `shoulda-matcher` is due to their simple and efficient DSL which makes writing tests easier.

### Currently we are generating the `associations` but it is being planned for `validations` too. There is an [open issue](https://github.com/aditya-kapoor/auto-specs/issues/5) for this.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'auto_specs'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install auto_specs

## Usage

Upon installation in the rails app, the gem presents you with two `rake` tasks namely:

1. auto_specs:model
2. auto_spec:controller [TODO]

Running `rake auto_specs:model` would generate the model file specs in the `spec` directory.

## Contributing

1. Fork it ( https://github.com/aditya-kapoor/auto_specs/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
