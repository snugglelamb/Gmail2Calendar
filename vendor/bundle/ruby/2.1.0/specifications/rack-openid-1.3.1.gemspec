# -*- encoding: utf-8 -*-
# stub: rack-openid 1.3.1 ruby lib

Gem::Specification.new do |s|
  s.name = "rack-openid"
  s.version = "1.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Joshua Peek"]
  s.date = "2011-02-24"
  s.description = "    Provides a more HTTPish API around the ruby-openid library\n"
  s.email = "josh@joshpeek.com"
  s.homepage = "http://github.com/josh/rack-openid"
  s.rubygems_version = "2.2.2"
  s.summary = "Provides a more HTTPish API around the ruby-openid library"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rack>, [">= 1.1.0"])
      s.add_runtime_dependency(%q<ruby-openid>, [">= 2.1.8"])
    else
      s.add_dependency(%q<rack>, [">= 1.1.0"])
      s.add_dependency(%q<ruby-openid>, [">= 2.1.8"])
    end
  else
    s.add_dependency(%q<rack>, [">= 1.1.0"])
    s.add_dependency(%q<ruby-openid>, [">= 2.1.8"])
  end
end
