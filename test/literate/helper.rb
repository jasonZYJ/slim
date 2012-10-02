require 'slim'
require 'slim/logic_less'
require 'slim/translator'
require 'slim/grammar'
require 'minitest/autorun'

Slim::Engine.after  Slim::Parser, Temple::Filters::Validator, :grammar => Slim::Grammar
Slim::Engine.before :Pretty, Temple::Filters::Validator
Slim::Engine.set_default_options :tr => false, :logic_less => false

module Helper
  def render(source, options = {}, &block)
    Slim::Template.new(options) { source }.render(self, &block)
  end
end
