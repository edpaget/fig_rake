# FigRake

Allows you to use rake commands transparently with a dev environment set up using [fig](http://fig.sh).

## Installation

Add this line to your application's Gemfile:

    gem 'fig_rake'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fig_rake

## Usage

Fig Rake offers two ways to use it: the `frake` command and by monkey-patching Rake.

### frake

`frake` is probably the easiest and least dangerous (and ulitmately least satisifying) way to use FigRake. Simply execute `frake` followed by rake commads as you would normally use rake, ie `rake db:migrate` or `frake spec`. FigRake will automatically determine which container to run the commands on by looking for the one with a `build: .` in your `fig.yml` file.

You can configure the container rake is run on by passing its name as to the `--container` argument by setting a `FRAKE_DEFAULT` environment variable, or by adding its name to a `.frake` file in the project's root directory.

For more information type `frake --help`

### Monkey Patching

I don't think there's anything wrong with monkey patching, so let's do it.

Just add `require 'fig_rake/rake'` to your Rakefile and frake will automatically intercept your rake commands and run them against its default container. The default container will be determined in the same manner as the `frake` command. You can optionally call `FigRake::Rake.default_container "name"` in your Rakefile to set the default container name there.

If you need to run rake commands locally after installing FigRake, add `FIG_RAKE=off` to the end of your rake command to disable FigRake for that command.

## Contributing

1. Fork it ( https://github.com/edpaget/fig_rake/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
