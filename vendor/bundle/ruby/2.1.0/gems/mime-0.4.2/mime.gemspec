version = File.read('./lib/mime.rb')[/VERSION = '(.*)'/, 1]

Gem::Specification.new('mime', version) do |s|
  s.author      = 'Clint Pachl'
  s.email       = 'pachl@ecentryx.com'
  s.homepage    = 'http://ecentryx.com/gems/mime'
  s.license     = 'ISC'
  s.summary     = 'Multipurpose Internet Mail Extensions (MIME) Library'
  s.description = <<-EOF
A library for building RFC compliant Multipurpose Internet Mail Extensions
(MIME) messages. It can be used to construct standardized MIME messages for use
in client/server communications, such as Internet mail or HTTP
multipart/form-data transactions.
  EOF
  s.files       = Dir['README.rdoc', 'Rakefile', 'mime.gemspec',
                      'lib/**/*.rb', 'test/**/*']
  s.test_files  = Dir['test/*.rb']
end
