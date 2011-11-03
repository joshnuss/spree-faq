module SpreeFaq
  module Generators
    class InstallGenerator < Rails::Generators::Base

      def add_javascripts
        append_file "app/assets/javascripts/admin/all.js", "//= require admin/jquery.scrollTo-min\n" 
        append_file "app/assets/javascripts/store/all.js", "//= require store/spree_faq"
      end

      def add_stylesheets
        inject_into_file "app/assets/stylesheets/admin/all.css", " *= require admin/spree_faq\n", :before => /\*\//, :verbose => true
      end
    end

      def add_migrations
        run 'rake railties:install:migrations FROM=spree_faq'
      end

      def run_migrations
        res = ask "Would you like to run the migrations now? [Y/n]"
        if res == "" || res.downcase == "y"
          run 'rake db:migrate'
        else
          puts "Skiping rake db:migrate, don't forget to run it!"
        end
      end
    end
  end
end

