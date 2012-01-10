# Modified ruby-coffee-script test suite

# Copyright (c) 2010 Joshua Peek
# 
# Permission is hereby granted, free of charge, to any person
# obtaining a copy of this software and associated documentation
# files (the "Software"), to deal in the Software without
# restriction, including without limitation the rights to use,
# copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following
# conditions:
# 
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
# OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
# WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.

require 'coffee-script-pure'
require 'test/unit'
require 'stringio'

class TestCoffeeScriptPure < Test::Unit::TestCase
  def test_compile
    assert_equal "(function() {\n\n  puts('Hello, World!');\n\n}).call(this);\n",
      CoffeeScriptPure.compile("puts 'Hello, World!'\n")
  end

  def test_compile_with_io
    io = StringIO.new("puts 'Hello, World!'\n")
    assert_equal "(function() {\n\n  puts('Hello, World!');\n\n}).call(this);\n",
      CoffeeScriptPure.compile(io)
  end

  def test_compile_with_bare_true
    assert_equal "\nputs('Hello, World!');\n",
      CoffeeScriptPure.compile("puts 'Hello, World!'\n", :bare => true)
  end

  def test_compile_with_bare_false
    assert_equal "(function() {\n\n  puts('Hello, World!');\n\n}).call(this);\n",
      CoffeeScriptPure.compile("puts 'Hello, World!'\n", :bare => false)
  end

  def test_compile_with_no_wrap_true
    assert_equal "\nputs('Hello, World!');\n",
      CoffeeScriptPure.compile("puts 'Hello, World!'\n", :no_wrap => true)
  end

  def test_compile_with_no_wrap
    assert_equal "(function() {\n\n  puts('Hello, World!');\n\n}).call(this);\n",
      CoffeeScriptPure.compile("puts 'Hello, World!'\n", :no_wrap => false)
  end

  def test_compilation_error
    assert_raise CoffeeScriptPure::CompilationError do
      CoffeeScriptPure.compile("unless")
    end
  end
end