guard 'rspec', cmd: 'bundle exec rspec', all_on_start: true do
  watch('spec/spec_helper.rb')            { 'spec' }
  watch('config/routes.rb')               { 'spec/routing' }
  watch(%r{^spec/(.+)_spec\.rb$})         { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^app/(.+)_decorator\.rb$})     { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^(app|lib)/(.+)(\.rb|\.erb)$}) { |m| "spec/#{m[2]}_spec.rb" }
  watch(%r{^config/locales/(.+)\.yml$})   { 'spec/translations' }
end