# This repo demos a PR process for resolving issues

`main.rb` - runs each function available

`lib/greeter.rb` - a class that implements functionality to greet people; methods include:
* `Greeter#greet` - returns an anonymous friendly greeting
* `Greeter#greet_by_name` - returns a greeting to the person named
* `Greeter#greet_as` - returns a greeting to the person named, styled with the given style
* `Greeter::greeting_styles` - with no arguments, returns the available greeting styles as a `Hash`; with a style identifier (`Symbol`), returns the styled greeting for that style; supported styles are:
  - `:pirate`
  - `:victorian`
  - `:aussie`


## To run tests
```
bundle exec rspec
```

## To run main
```
bundle exec ruby main.rb
```

## To setup
```
bundle install
```
