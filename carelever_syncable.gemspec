Gem::Specification.new do |spec|
  spec.name          = 'carelever_syncable'
  spec.version       = '0.0.1'
  spec.date          = '2020-02-27'
  spec.summary       = 'Syncing models in carelever to other microservices'
  spec.files         = [
    'lib/carelever_syncable.rb',
    'lib/aws/sns_publisher.rb',
    'lib/aws/client.rb'
  ]
  spec.require_paths = ['lib']
  spec.authors       = ['Carelever']
  spec.email         = 'dev@carelever.com'
  spec.license       = 'Carelever'
end
