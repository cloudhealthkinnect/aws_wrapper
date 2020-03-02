Gem::Specification.new do |spec|
  spec.name          = 'carelever_syncable'
  spec.version       = File.read(File.expand_path('../VERSION', __FILE__)).strip
  spec.date          = '2020-02-27'
  spec.summary       = 'Syncing models in carelever to other microservices'
  spec.files         = Dir['lib/**/*.rb']
  spec.require_paths = ['lib']
  spec.authors       = ['Carelever']
  spec.email         = 'dev@carelever.com'
  spec.license       = 'Carelever'
end
