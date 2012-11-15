require 'jekyll'
require 'rails'
require "bloggy/version"

module Jekyll
  module Rails
  end

  require 'haml'
  class HamlConverter < Converter
    safe true
    priority :low

    def matches(ext)
      ext =~ /haml/i
    end

    def output_ext(ext)
      ".html"
    end

    def convert(content)
      engine = Haml::Engine.new(content)
      engine.render
    end
  end

  require 'sass'
  class SassConverter < Converter
    safe true
    priority :low

    def matches(ext)
      ext =~ /sass/i
    end

    def output_ext(ext)
      ".css"
    end

    def convert(content)
      engine = Sass::Engine.new(content)
      engine.render
    end
  end
end

#Rails::Generators.hidden_namespaces << "rails"
#Rails::Generators.hidden_namespaces << "jekyll:install"
#Rails::Generators.hidden_namespaces.flatten!