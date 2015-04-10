guard :haml, input: 'haml', output: 'public', run_at_start: true do
  watch %r{^haml/.+(\.html\.haml)}
end

guard 'sass', :input => 'sass', :output => 'public/css', :all_on_start => true do
  watch %r{^sass/.+(\.s[ac]ss)$}
end

coffeescript_options = {
  input: 'coffee',
  output: 'public/js',
  bare: true,
  all_on_start: true,
  patterns: [%r{^coffee/(.+\.(?:coffee|coffee\.md|litcoffee))$}]
}

guard 'coffeescript', coffeescript_options do
  coffeescript_options[:patterns].each { |pattern| watch(pattern) }
end
