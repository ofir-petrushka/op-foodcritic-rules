# op-foodcritic-rules

[![Build Status](https://travis-ci.org/ofir-petrushka/op-foodcritic-rules.png?branch=master)](https://travis-ci.org/ofir-petrushka/op-foodcritic-rules)

Custom foodcritic rules.
Should be generic for everyone working with Chef.
Current focus is on automated testing.

## Installation

Add this line to your Gemfile in chef-repo:

    gem 'op-foodcritic-rules', git: 'git@github.com:ofir-petrushka/op-foodcritic-rules.git'

And then execute `bundle` to install the gem.

## Usage

Once you have installed the gem, simply run foodcritic with the `-G` option:

    bundle exec foodcritic -G .

# Rules

## <a id="OP001"></a>OP001: Include a kitchen test suite for every recipe not included by another

[Kitchen tests](https://docs.chef.io/kitchen.html) are the recommended way for automated chef recipe testing.
Generally speaking every recipe should have be in at least one test suite.
This is a laxed rule not requiring recipes included by other recipes to have test suites.

This rules looks for entries in .kitchen.yml under runlists to have every recipe under your recipe directory.

For example:

    # Good
    $ ls cookbooks/my_cookbook/recipes/tested.rb
    cookbooks/my_cookbook/recipes/tested.rb
    $ grep tested cookbooks/my_cookbook/.kitchen.yml
      - recipe[tested]

    # Bad
    $ ls cookbooks/my_cookbook/recipes/not_tested.rb
    cookbooks/my_cookbook/recipes/not_tested.rb
    $ grep tested cookbooks/my_cookbook/.kitchen.yml

    (empty result)

# License

OP Foodcritic Rules

* Author: Ofir Petrushka <ofir.petrushka AT gmail DOT com>
* Copyright: Copyright (c) Ofir Petrushka.
* License: Apache License, Version 2.0
