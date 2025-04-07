# decidim-sweden

Free Open-Source participatory democracy, citizen participation and open government for cities and organizations

This is the open-source repository for decidim-sweden, based on [Decidim](https://github.com/decidim/decidim).

## Versions

* `c0e30a56`: `release/0.28-stable`
* `b6d06fee`: `release/0.27-stable`
* `704f9f8d`: `release/0.26-stable`

## Setting up the application

You will need to do some steps before having the app working properly once you've deployed it:

1. Open a Rails console in the server: `bundle exec rails console`
2. Create a System Admin user:
```ruby
user = Decidim::System::Admin.new(email: <email>, password: <password>, password_confirmation: <password>)
user.save!
```
3. Visit `<your app url>/system` and login with your system admin credentials
4. Create a new organization. Check the locales you want to use for that organization, and select a default locale.
5. Set the correct default host for the organization, otherwise the app will not work properly. Note that you need to include any subdomain you might be using.
6. Fill the rest of the form and submit it.

You're good to go!

## Debugging SMTP

The simplest way to debug mail sending is to Do It Yourself. This means,
dropping into the rails console and writing a mail by hand. The advantage is
that you see the errors immediately.

```
export RAILS_ENV=production; bin/rails console
irb(main):012:0> mailer = ActionMailer::Base.new
=> #<ActionMailer::Base:0x000000000d92b0>
irb(main):013:0> mailer.smtp_settings
=>
{:address=>"smtp.somewhere.com",
 :port=>"587",
 :authentication=>"plain",
 :user_name=>"foobar",
 :password=>"...",
 :domain=>"foo.com",
 :enable_starttls_auto=>true,
 :openssl_verify_mode=>"none"}
irb(main):014:1* mailer.mail(from: "foo.com",
irb(main):015:1*             to: "bar@thing.com",
irb(main):016:1*             subject: "debuggin' smtp",
irb(main):017:0>             body: "does it work?\n\n")
mailer.message.deliver
```
