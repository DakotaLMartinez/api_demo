# ApiDemo

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/api_demo`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'api_demo'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install api_demo

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

This gem connects to the Yelp API to allow a user to list restaurants near their location:
Here's some sample ruby code that interacts with the API: https://github.com/Yelp/yelp-fusion/blob/master/fusion/ruby/sample.rb



It wants us to require json and http up top:
```
require "json"
require "http"
```
These will allow us to make requests to the Yelp API and then parse the responses so we'll be able to interact with them in ruby. I'll show you how we can use `HTTP` to make the requests and also how we'd do the equivalent with `httparty`.

The sample code also recommends setting up some constants to help with the process:

```
API_HOST = "https://api.yelp.com"
SEARCH_PATH = "/v3/businesses/search"
BUSINESS_PATH = "/v3/businesses/"  # trailing / because we append the business id to the path
```
These will be useful when we're putting together the url so we can focus just on the things that are actually going to change. They've added a search method that takes two parameters, a term and a location:

```
def search(term, location)
  url = "#{API_HOST}#{SEARCH_PATH}"
  params = {
    term: term,
    location: location,
    limit: SEARCH_LIMIT
  }

  response = HTTP.auth("Bearer #{API_KEY}").get(url, params: params)
  response.parse
end
```
Note that they have added a constant for SEARCH_LIMIT in the code, but if we read the docs here: https://www.yelp.com/developers/documentation/v3/business_search, we can see that the limit will be 20 if we leave this out, so we can omit it in our method.

Also, instead of using a constant `API_KEY` for our key, we're going to get the key using another class method in our API class. The benefit of this approach is that we can actually read the key from a file on the user's computer and we don't have to store our API_KEY in the code itself. This is important because the key uniquely identifies us and is limited in terms of how many requests we're allowed to make in a certain period of time. We should always keep it private. If you accidentally share your key, most API providers have a way of refreshing the key (invalidating your old key). For yelp, you can reset our API key by going here: https://www.yelp.com/developers/v3/manage_app and scrolling to the bottom.

Even fancier, for our demo here, we'll be using the ruby File class to interact with a hidden file on the user's system. A hidden file is one whose name starts with a . and normally won't appear within the file explorer. What we'll do is try to find this file on the user's system and read the key out of it. If the file isn't there, we'll get an error!  So, we'll need to write our method in such a way that we can rescue ourselves from that error and get the API_KEY from our user. When they enter it, we'll take their input and store it in the hidden file we couldn't find before. This way, next time the same user runs the application they won't have to add their API_KEY again. If we ever need to reset the API key after a refresh we can open up this hidden file to do so.




## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/DakotaLMartinez/api_demo. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ApiDemo project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/DakotaLMartinez/api_demo/blob/master/CODE_OF_CONDUCT.md).
