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

`bulk_insert` with new records.  
Insert new records one by one.

```ruby
users = [*1..10].map { |i| User.new(name: "user#{i}") }
User.bulk_insert(users)
```

```sql
INSERT INTO `users` (`name`, `created_at`, `updated_at`) VALUES ('user1', '2019-08-23 15:37:46', '2019-08-23 15:37:46');
INSERT INTO `users` (`name`, `created_at`, `updated_at`) VALUES ('user2', '2019-08-23 15:37:46', '2019-08-23 15:37:46');
INSERT INTO `users` (`name`, `created_at`, `updated_at`) VALUES ('user3', '2019-08-23 15:37:46', '2019-08-23 15:37:46');
INSERT INTO `users` (`name`, `created_at`, `updated_at`) VALUES ('user4', '2019-08-23 15:37:46', '2019-08-23 15:37:46');
INSERT INTO `users` (`name`, `created_at`, `updated_at`) VALUES ('user5', '2019-08-23 15:37:46', '2019-08-23 15:37:46');
INSERT INTO `users` (`name`, `created_at`, `updated_at`) VALUES ('user6', '2019-08-23 15:37:46', '2019-08-23 15:37:46');
INSERT INTO `users` (`name`, `created_at`, `updated_at`) VALUES ('user7', '2019-08-23 15:37:46', '2019-08-23 15:37:46');
INSERT INTO `users` (`name`, `created_at`, `updated_at`) VALUES ('user8', '2019-08-23 15:37:46', '2019-08-23 15:37:46');
INSERT INTO `users` (`name`, `created_at`, `updated_at`) VALUES ('user9', '2019-08-23 15:37:46', '2019-08-23 15:37:46');
INSERT INTO `users` (`name`, `created_at`, `updated_at`) VALUES ('user10', '2019-08-23 15:37:46', '2019-08-23 15:37:46');
```

Specify `ignore_new_record` for bulk insert.  
autoincrement and default values are not reflected.

```ruby
users = [*1..10].map { |i| User.new(name: "user#{i}") }
User.bulk_insert(users, ignore_new_record: false)
```

```sql
INSERT INTO `users`(`created_at`,`updated_at`,`name`) VALUES ('2019-08-23 15:28:35', '2019-08-23 15:28:35', 'user1'), ('2019-08-23 15:28:35', '2019-08-23 15:28:35', 'user2'), ('2019-08-23 15:28:35', '2019-08-23 15:28:35', 'user3'), ('2019-08-23 15:28:35', '2019-08-23 15:28:35', 'user4'), ('2019-08-23 15:28:35', '2019-08-23 15:28:35', 'user5'), ('2019-08-23 15:28:35', '2019-08-23 15:28:35', 'user6'), ('2019-08-23 15:28:35', '2019-08-23 15:28:35', 'user7'), ('2019-08-23 15:28:35', '2019-08-23 15:28:35', 'user8'), ('2019-08-23 15:28:35', '2019-08-23 15:28:35', 'user9'), ('2019-08-23 15:28:35', '2019-08-23 15:28:35.964720', 'user10');
```

Existing records are bulk updated.

```ruby
users = User.all
users.each do |user|
  user.name = "user#{user.id * 2}"
end
User.bulk_insert(users)
```

```sql
INSERT INTO `users`(`created_at`,`updated_at`,`name`) VALUES ('2019-08-23 15:28:35', '2019-08-23 15:34:49', 'user2'), ('2019-08-23 15:28:35', '2019-08-23 15:34:49', 'user4'), ('2019-08-23 15:28:35', '2019-08-23 15:34:49', 'user6'), ('2019-08-23 15:28:35', '2019-08-23 15:34:49', 'user8'), ('2019-08-23 15:28:35', '2019-08-23 15:34:49', 'user10'), ('2019-08-23 15:28:35', '2019-08-23 15:34:49', 'user12'), ('2019-08-23 15:28:35', '2019-08-23 15:34:49', 'user14'), ('2019-08-23 15:28:35', '2019-08-23 15:34:49', 'user16'), ('2019-08-23 15:28:35', '2019-08-23 15:34:49', 'user18'), ('2019-08-23 15:28:35', '2019-08-23 15:34:49', 'user20') ON DUPLICATE KEY UPDATE `created_at`=VALUES(`created_at`),`updated_at`=VALUES(`updated_at`),`name`=VALUES(`name`);
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/i2bskn/activerecord-bulk_insert.
