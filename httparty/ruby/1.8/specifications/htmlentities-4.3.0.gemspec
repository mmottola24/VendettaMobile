# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{htmlentities}
  s.version = "4.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Paul Battley}]
  s.date = %q{2011-03-28}
  s.email = %q{pbattley@gmail.com}
  s.extra_rdoc_files = [%q{History.txt}, %q{COPYING.txt}]
  s.files = [%q{History.txt}, %q{COPYING.txt}]
  s.homepage = %q{http://htmlentities.rubyforge.org/}
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.5}
  s.summary = %q{A module for encoding and decoding (X)HTML entities.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
