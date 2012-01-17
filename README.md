# coffee-script-pure

**coffee-script-pure** is a CoffeeScript compiler running in pure Ruby. It adopts the same protocol as [ruby-coffee-script](https://github.com/josh/ruby-coffee-script):

    require "coffee-script-pure"
    CoffeeScriptPure.compile "console.log 'hello world'", bare: true
      # => "\nconsole.log('hello world');\n"

coffee-script-pure uses [Twostroke](https://github.com/charliesome/twostroke) - a Javascript interpreter written in Ruby.

A compiled and deflated copy of the CoffeeScript 1.2.0 compiler is bundled with coffee-script-pure.

## Installation

    gem install coffee-script-pure

## Does it work?

Mostly. Nearly all the files in the CoffeeScript compiler can be compiled successfully by coffee-script-pure.

If you have a program that breaks, please let me know about it.