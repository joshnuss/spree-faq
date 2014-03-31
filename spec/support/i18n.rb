require 'rspec'
require 'i18n-spec'

RSpec.configure do |config|

  config.after(type: :feature) do
    missing_translations = page.body.scan(/translation missing: #{I18n.locale}\.(.*?)[\s<\"&]/)
    if missing_translations.any?
      puts "\e[1m\e[35mFound missing translations: #{missing_translations.inspect}\e[0m"
      puts "\e[1m\e[35mIn spec: #{example.location}\e[0m"
    end
  end
end