# Foto

A simple platform for storing and viewing photos. For the first version I'd really like to:

* Automatic sync with iPhoto Library
* Cheap storage (via S3)
* View photos
* Edit photo metadata

The sky is the limit though, I've been thinking about collections, automatic collections, analysis (facial recognition, color, shape, ???), time machine emails (I loved this feature on everpix), whatever we can dream up.

## Ruby on Rails

This application requires:

* Ruby version 1.9.3
* Rails version 4.0.2

Learn more about [Installing Rails](http://railsapps.github.io/installing-rails.html).

## Database

This application uses PostgreSQL with ActiveRecord.

## Development

* Template Engine: ERB
* Testing Framework: RSpec and Machinist
* Front-end Framework: Twitter Bootstrap 3.0 (Sass)
* Authentication: OmniAuth
* Authorization: CanCan

## Email

The application is configured to send email using a Gmail account.

## Getting Started

```
git clone https://github.com/fotoapp/fotoapp.git
cd fotoapp
bundle
rake db:create db:migrate db:test:prepare
```

Start the server with `rails server` or the console with `rails console`.

Run the tests with `rake`.

## Documentation and Support

This is the only documentation for now.

## Similar Projects

* [Gallery](http://galleryproject.org)

## Contributing

If you make improvements to this application, please share with others.

* Fork the project on GitHub.
* Make your feature addition or bug fix.
* Commit with Git.
* Send the author a pull request.

If you add functionality to this application, create an alternative implementation, or build an application that is similar, please contact me and I'll add a note to the README so that others can find your work.

## License

See [LICENSE](https://github.com/fotoapp/fotoapp/blob/master/LICENSE)
