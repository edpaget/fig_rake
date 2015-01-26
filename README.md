# FigRake

Allows you to use rake and rails commands transparently with a dev environment set up using [fig](http://fig.sh).

## Installation

Add this line to your application's Gemfile:

    gem 'fig_rake', require: false

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fig_rake

## Usage

Fig Rake offers two ways to use it: the `frake` and `frails` commands and by monkey-patching Rake and the Rails command line.

### frake

`frake` and `frails` are probably the easiest and least dangerous (and ulitmately least satisifying) ways to use FigRake. Simply execute `frake` or `frails` followed by rake  or rails commads as you would normally use rake or the rails command line, ie `rake db:migrate`,  `frake spec`, `frails console`. FigRake will automatically determine which container to run the commands on by looking for the one with a `build: .` in your `fig.yml` file.

You can configure the container fig_rake is run on by passing its name as to the `--container-name` argument, by setting a `FRAKE_DEFAULT` environment variable, or by adding its name to a `.frake` file in the project's root directory.

For more information type `frake --help` or `frails --help`

### Monkey Patching

I don't think there's anything wrong with monkey patching, so let's do it.

Just add `require 'fig_rake/rake'` to your Rakefile or `require 'fig_rake/rails'` and frake will automatically intercept your rake and rails commands and run them against its default container. The default container will be determined in the same manner as the `frake` command. You can optionally call `FigRake::Rake.default_container "name"` in your Rakefile or `FigRake::Rails.default_container "name"` in your config/boot.rb to set the default container name there.

You still need to explicity enable Fig Rake after including it in Rake or Rails by setting the environment variable `FIG_RAKE`.

## Versioning

This Gem is feature complete for my purposes. However it lacks tests. As soon as I have added enough of a test suite to feel comfortable, I will cut a 1.0.0 release. 

## Contributing

1. Fork it ( https://github.com/edpaget/fig_rake/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
