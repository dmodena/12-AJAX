# Options available
guard = false
haml = false
sass = false

# Overwriting options
gemfile_overwrite = true
guardfile_overwrite = true

# Guarfile user I/O options
haml_input = ""
haml_output = ""
sass_input = ""
sass_output = ""

# Auto-flushing keyboard input
STDOUT.sync = true

# Defining methods
#
# Deletes the file
def delete_file(filename)
	File.delete(filename)
end

# Returns TRUE if Gemfile exists, FALSE otherwise
def gemfile?
	return File.exist?("Gemfile")
end

# Returns TRUE if Guardfile exists, FALSE otherwise
def guardfile?
	return File.exist?("Guardfile")
end

# Returns String with Gemfile content
def gemfile_write(guard, haml, sass)
	output = "source 'https://rubygems.org'\n\n"
	if haml
		output += "gem 'haml'\n"
	end
	if sass
		output += "gem 'sass'\n"
	end
	if guard
		output += "gem 'guard'\n"
		if haml
			output += "gem 'guard-haml'\n"
		end
		if sass
			output += "gem 'guard-sass'\n"
		end
	end
	output
end

# Returns String with Guardfile content
def guardfile_write(haml_input, haml_output, sass_input, sass_output)
	output = ""
	if haml_input == "this"
		haml_input = "."
	end
	if haml_output == "this"
		haml_output = "."
	end
	if sass_input == "this"
		sass_input = "."
	end
	if sass_output == "this"
		sass_output = "."
	end
	if ((haml_input != "") && (haml_output != ""))
		output += "guard :haml, input: '#{haml_input}', output: '#{haml_output}', run_at_start: true do\n"
		output += "  watch %r{^#{haml_input}/.+(\\.html\\.haml)}\n"
		output += "end\n"
	end
	if ((sass_input != "") && (sass_output != ""))
		output += "guard 'sass', :input => '#{sass_input}', :output => '#{sass_output}', :all_on_start => true do\n"
		output += "  watch %r{^#{sass_input}/.+(\\.s[ac]ss)$}\n"
		output += "end\n"
	end
	output
end

# Substitutes the symbol / for \ to create folder path
def reverse_slash(path)
  if path.include? "/"
    path["/"] = "\\"
  end
  path
end

# Checks for directory existence
def directory_exists?(directory)
  File.directory?(directory)
end

# Checking for Gemfile existence and overwriting
if gemfile?
	overwrite_option = ""
	loop do		
		print "Gemfile already exists. Overwrite? Y | N: "
		overwrite_option = gets.chr
		overwrite_option = overwrite_option.upcase
	break if((overwrite_option == "Y") || (overwrite_option == "N"))		
	end
	if overwrite_option == "Y"
		delete_file("Gemfile")
	else
		gemfile_overwrite = false
	end
end

# Getting user gem options
if gemfile_overwrite
	gem_options = ""
	loop do
		puts "Please choose the gems you want to use"
		print "Options - G (Guard) | H (Haml) | S (Sass/Scss): "
		gem_options = gets.chomp
		gem_options = gem_options.upcase
	  break if((gem_options.include? "G") || (gem_options.include? "H") || (gem_options.include? "S"))
	end
	if gem_options.include? "G"
		guard = true;
	end
	if gem_options.include? "H"
		haml = true;
	end
	if gem_options.include? "S"
		sass = true;
	end
end

# Writing gemfile
if gemfile_overwrite
	gemfile = File.new("Gemfile", "w")
	gemfile_content = gemfile_write(guard, haml, sass)
	gemfile.puts(gemfile_content)
end

# Checking for Guarfile existence and overwriting
if guard
	if guardfile?
		overwrite_option = ""
		loop do		
			print "Guarfile already exists. Overwrite? Y | N: "
			overwrite_option = gets.chr
			overwrite_option = overwrite_option.upcase
		break if((overwrite_option == "Y") || (overwrite_option == "N"))		
		end
		if overwrite_option == "Y"
			delete_file("Guardfile")
		else
			guardfile_overwrite = false
		end
	end
end

# Getting user guardfile options
if guard
	if guardfile_overwrite
		if haml
			print "Location of haml input ( 'this' for current folder): "
			haml_input = gets.chomp
			print "Location of haml output ( 'this' for current folder): "
			haml_output = gets.chomp
		end
		if sass
			print "Location of sass input ( 'this' for current folder): "
			sass_input = gets.chomp
			print "Location of sass output ( 'this' for current folder): "
			sass_output = gets.chomp
		end
	end
end

# Writing guardfile
if guard
	if guardfile_overwrite
		guardfile = File.new("Guardfile", "w")
		guardfile_content = guardfile_write(haml_input, haml_output, sass_input, sass_output)
		guardfile.puts(guardfile_content)
	end
end

# Creating folder structure
if guard
	if haml
		if haml_input.downcase != "this"
			haml_in = reverse_slash(haml_input)
			if !directory_exists?(haml_in)
				`md #{haml_in}`
			end
		end
		if haml_output.downcase != "this"
			haml_out = reverse_slash(haml_output)
			if !directory_exists?(haml_out)
				`md #{haml_out}`
			end
		end
	end
	if sass
		if sass_input.downcase != "this"
			sass_in = reverse_slash(sass_input)
			if !directory_exists?(sass_in)
				`md #{sass_in}`
			end
		end
		if sass_output.downcase != "this"
			sass_out = reverse_slash(sass_output)
			if !directory_exists?(sass_out)
				`md #{sass_out}`
			end
		end
	end
end
