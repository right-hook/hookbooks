# Load multiple Gemfiles from http://madebynathan.com/2010/10/19/how-to-use-bundler-with-plugins-extensions/
Dir.glob(File.join(File.dirname(__FILE__), '**', "Gemfile")) do |gemfile|
  next if File.realpath(gemfile) == File.realpath(__FILE__, File.dirname(__FILE__))
  eval(IO.read(gemfile), binding)
end
