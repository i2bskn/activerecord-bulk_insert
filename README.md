# Activerecord::BulkInsert

`activerecord-bulk_insert` is provide bulk update and insert for ActiveRecord.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "activerecord-bulk_insert"
```

And then execute:

    $ bundle

## Usage

```ruby
users = [*1..10].map { |i| User.new(name: "user#{i}") }
User.bulk_insert(users, ignore_new_record: false)

users = User.all
users.each do |user|
  user.name = "user#{user.id * 2}"
end
User.bulk_insert(users)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/i2bskn/activerecord-bulk_insert.
