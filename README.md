# Vue Delayed Job Dashboard

![screenshot0](https://cloud.githubusercontent.com/assets/2282642/24899863/0bad5384-1ecc-11e7-9729-9c2939f3fdae.png)

![screenshot1](https://cloud.githubusercontent.com/assets/2282642/24899673/52d7ad8c-1ecb-11e7-84bc-a59f3f8779a2.png)

![screenshot2](https://cloud.githubusercontent.com/assets/2282642/24899676/545b18ec-1ecb-11e7-9505-76977ef51379.png)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'vue_delayed_job_dashboard'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install vue_delayed_job_dashboard

## Usage

Add the following line to top of `route.rb`

```ruby
mount VueDelayedJobDashboard::WebApplication => '/delayed_job'
```

vue_delayed_job_dashboard will require basic authentication by default. Add the following configuration to environment variable.

```ruby
ENV["VUE_DELAYED_JOB_USERNAME"] = "username"
ENV["VUE_DELAYED_JOB_PASSWORD"] = "password"
```

## TODO

- Add unit tests
- Add pagination [DONE]
- Stats [DONE]
- Add authentication [DONE]
- Add search box

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kimquy/vue_delayed_job_dashboard. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
