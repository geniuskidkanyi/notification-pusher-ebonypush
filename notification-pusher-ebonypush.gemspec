# frozen_string_literal: true

# version = File.read(File.expand_path('../../VERSION', __dir__)).strip

Gem::Specification.new do |gem|
  gem.name                  = 'notification-pusher-ebonypush'
  gem.version               = "4.0.0"
  gem.platform              = Gem::Platform::RUBY
  gem.summary               = 'A delivery method to send your notifications '\
                              'to devices on all platforms with webpush'
  gem.description           = 'A delivery method to send your notifications '\
                              'to devices on all platforms with ebonypush.'
  gem.authors               = 'Muhammed Kanyi'
  gem.email                 = 'kanyi@gcubed.gm'
  gem.homepage              = 'https://github.com/geniuskid/notification-pusher-ebonypush'
  gem.license               = 'MIT'

  gem.files                 = Dir['README.md', 'LICENSE', 'lib/**/*']
  gem.require_paths         = ['lib']
  gem.metadata              = {
    'github_repo' => 'ssh://github.com/geniuskid/notification-pusher-ebonypush'
  }

  gem.required_ruby_version = '>= 2.7'

  gem.add_dependency 'notification-pusher'

  gem.add_development_dependency 'factory_bot'
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'rails'
  gem.add_development_dependency 'rspec-rails'
  gem.add_development_dependency 'rubocop'
  gem.add_development_dependency 'rubocop-rspec'
  gem.add_development_dependency 'sqlite3'
end
