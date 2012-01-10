require "twostroke"
require "zlib"

module CoffeeScriptPure
  class EngineError < StandardError; end
  class CompilationError < StandardError; end
  
  def self.instance
    twostroke_vm.global_scope.get_var "CoffeeScript"
  end
  
  def self.twostroke_vm
    unless defined? @@twostroke_vm
      # twostroke is dog slow at parsing/compiling,
      # so here's some bytecode I prepared earlier!
      path = File.expand_path "../coffee-script.tsz", __FILE__
      bytecode = Marshal.load Zlib.inflate File.read path
      
      @@twostroke_vm = Twostroke::Runtime::VM.new bytecode
      Twostroke::Runtime::Lib.setup_environment @@twostroke_vm
      @@twostroke_vm.execute
    end
    @@twostroke_vm
  end
  
  def self.version
    @@version ||= instance.get("VERSION").string
  end
  
  def self.compile(src, opts = {})
    src = src.read if src.respond_to? :read
    js_src = Twostroke::Runtime::Types::String.new src
    js_opts = Twostroke::Runtime::Types::Object.new
    if opts[:bare] or opts[:no_wrap]
      js_opts.put "bare", Twostroke::Runtime::Types::Boolean.true
    end
    ex = catch :exception do
      retn = instance.get("compile").call(nil, instance, [js_src, js_opts])
      return retn.string
    end
    # if we're here, an exception was thrown javascript-side
    to_str = ex.get("toString").call(nil, ex, [])
    mesg = Twostroke::Runtime::Types.to_string(to_str).string
    raise CompilationError, mesg
  end
end