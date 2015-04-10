guard :haml, input: 'haml', output: 'public', run_at_start: true do
  watch %r{^haml/.+(\.html\.haml)}
end

guard 'sass', :input => 'sass', :output => 'public/css', :all_on_start => true do
  watch %r{^sass/.+(\.s[ac]ss)$}
end

guard 'coffeescript', :input => 'coffee', :output => 'public/js', :all_on_start => true do
  watch %r{^coffee/.+(\.coffee)$}
end
