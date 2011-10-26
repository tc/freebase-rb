# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "freebase/version"

Gem::Specification.new do |s|
  s.name        = "freebase-rb"
  s.version     = Freebase::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Tommy Chheng", "Kevin Po"]
  s.email       = ["tommy.chheng@gmail.com"]
  s.homepage    = "http://github.com/tc/freebase-rb"
  s.summary = %q{Freebase helper code.}
  s.description = %q{Freebase helper code.}

  s.rubyforge_project = "freebase-rb"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
