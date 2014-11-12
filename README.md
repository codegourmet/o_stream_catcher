OStreamCatcher
==============

Catches stdout and stderr for ruby blocks.

## Installation

Add this to your Gemfile:

    gem 'o_stream_catcher'

## Example

``` ruby
    require 'o_stream_catcher'

    result, stdout, stderr = OStreamCatcher.catch do
      print "Hello World!"
      42
    end

    result # => 42
    stdout # => "Hello World!"
```

## Further reading

For a more detailed description, see
[this article](http://blog.codegourmet.de/2014/11/11/ruby-capturing-and-mocking-stdout/)
on my blog.

## TODO

- Add an option to read caught output without muting it.
