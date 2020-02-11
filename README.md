# Ruby on Rails Twitter Clone

This is the finished product of [*Ruby on Rails Tutorial:
Learn Web Development with Rails*](https://www.railstutorial.org/)
by [Michael Hartl](http://www.michaelhartl.com/) which provides a fantastic resource
to learn and practice Ruby on Rails. During the book there are many examples of exercises
to do so you may further practice your skills but there isn't a final solution containing
those exercises so hopefully this can help someone who might be struggling on them or someone
who just wants to see an example of a Ruby on Rails project.

## License

All source code in the [Ruby on Rails Tutorial](https://www.railstutorial.org/)
is available jointly under the MIT License and the Beerware License. See
[LICENSE.md](LICENSE.md) for details.

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```
