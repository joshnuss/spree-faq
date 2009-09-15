namespace :db do
  desc "Bootstrap your database for Spree."
  task :bootstrap  => :environment do
    # load initial database fixtures (in db/sample/*.yml) into the current environment's database
    ActiveRecord::Base.establish_connection(RAILS_ENV.to_sym)
    Dir.glob(File.join(FaqExtension.root, "db", 'sample', '*.{yml,csv}')).each do |fixture_file|
      Fixtures.create_fixtures("#{FaqExtension.root}/db/sample", File.basename(fixture_file, '.*'))
    end
  end
end

namespace :spree do
  namespace :extensions do
    namespace :faq do
      desc "Copies public assets of the Spree Faq to the instance public/ directory."
      task :update => :environment do
        is_svn_git_or_dir = proc {|path| path =~ /\.svn/ || path =~ /\.git/ || File.directory?(path) }
        Dir[FaqExtension.root + "/public/**/*"].reject(&is_svn_git_or_dir).each do |file|
          path = file.sub(FaqExtension.root, '')
          directory = File.dirname(path)
          puts "Copying #{path}..."
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  

      desc "Loads sample FAQ questions"
      task :load_samples => :environment do
        sales    = QuestionCategory.create! :name => 'Sales'
        shipping = QuestionCategory.create! :name => 'Shipping'
        billing  = QuestionCategory.create! :name => 'Billing'

        sales.questions << Question.new(:question => 'Who much does it cost?', 
                                        :answer => 'Contact customer support')
        sales.questions << Question.new(:question => 'Does it do X?', 
                                        :answer => 'Duh')
        sales.questions << Question.new(:question => 'Can I return it?', 
                                        :answer => 'Maybe')

        shipping.questions << Question.new(:question => 'How much does shipping cost?', 
                                           :answer => 'Contact customer support')
        shipping.questions << Question.new(:question => 'What if it breaks?', 
                                           :answer => 'At your own risk')

        billing.questions << Question.new(:question => 'Can I use VISA?', 
                                          :answer => 'Yes!')
        billing.questions << Question.new(:question => 'Can I use PayPal?', 
                                          :answer => 'Yes!')
        billing.questions << Question.new(:question => 'Can I use AMEX?', 
                                          :answer => 'Yes!')
        puts "Sample questions loaded"
      end
    end
  end
end
