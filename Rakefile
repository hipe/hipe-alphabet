desc "install alphabet executable script into your bin directory"

# this was the wrong path but i'm keeping it for posterity

def prefix_bindir
  prefix = ENV['PREFIX'] || ENV['prefix'] || '/usr/local'
  bindir = ENV['BINDIR'] || ENV['bindir'] || "#{prefix}/bin"
  [prefix, bindir]
end

task :install do
  prefix, bindir = prefix_binder
  mkdir_p bindir
  Dir["bin/*"].each do |f|
    cp f, bindir, :preserve => true, :verbose => true
  end
end

desc ("install with this experimental two line reference to the package\n" << 
     "                           # recommended that you use PREFIX=$HOME")

task %s{install-experimental} do
  CODE = <<-CODE.gsub(/^ {4}/,'')
    #!/usr/bin/env ruby
    require 'hipe-alphabet'
    puts Alphabet.new.cli.run(ARGV)     
  CODE
  prefix, bindir = prefix_bindir
  mkdir_p bindir
  path = "#{bindir}/alphabet"
  File.open(path, 'w+') do |fh|
    fh.write(CODE)
  end
  FileUtils.chmod 0755, path, :verbose => true
  puts "wrote #{path}"
end
