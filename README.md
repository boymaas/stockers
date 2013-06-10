# Stockers

Business Logic for stockers

## Installation

Add this line to your application's Gemfile:

    gem 'stockers'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stockers

## Usage

Go through contexts to update stockers business model, or create a new one

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Philosophy

DCI, see stockers/ctx directory for contexts. 

Context instantiates domain objects, assigns roles, and SAVES all changes
to database. This way Contexts can be reused.
