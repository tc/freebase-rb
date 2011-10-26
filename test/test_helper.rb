$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", "lib"))

#simulate rails env
class Rails
  def self.env
    "test"
  end
end

require "rubygems"
require "test/unit"
require 'freebase'
