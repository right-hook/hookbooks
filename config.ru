require File.expand_path('responder/responder', File.dirname(__FILE__))

run Rack::URLMap.new('/responder' => Responder.new)
