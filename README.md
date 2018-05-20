# web_achecker

Basic Ruby gem to allow developers to easily check sites for accessability issues utilizing [AChecker Web Service API](https://achecker.ca/documentation/web_service_api.php).

## Installation

Add this line to your application's Gemfile:

```ruby
gem "web_achecker"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install web_achecker

## Usage

```ruby
require "web_achecker/web_service_api"

r = WebAchecker::WebServiceApi.validate(url: "https://google.com")
r.status # => "SUCCESS" or "FAILURE"
```

Next work is intended to improve the interface and output of the service.

## Development

### Current Work

- [x] Basic structure for web service interface.
- [x] Configurable Web Service ID (via .env).
- [x] Format query to AChecker.
- [x] Structure results in response object.
- [ ] Simple Rake task to easily get "FAILED" / "SUCCESS" back from URL.
- [ ] Provide RSpec-like report for more detailed findings report for given URL.
- [ ] Tests.
  - [ ] Formatted request URL based on various params. Should not pass defaults when not provided  (e.g., WebServiceApi spec).
  - [ ] Handled stubbed responses received from API service  (e.g., ValidationRequest spec).

### Contributing

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/timimsms/web_achecker.
