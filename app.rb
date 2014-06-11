require 'bundler'
Bundler.require

Dir.glob('./lib/*.rb') do |model|
  require model
end

module Name
  class App < Sinatra::Application

    #configure
    configure do
      set :root, File.dirname(__FILE__)
      set :public_folder, 'public'
      
      ActiveRecord::Base.establish_connection(
        :adapter  => 'postgresql',
        :host     => "localhost",
        :username => "blake",
        :database => "mydb",
        :encoding => 'utf8'
      )

    end

    #database

    #filters
    # @@people = [{:name => "ashley", :compliment => "you classy as fuck"}, {:name => "frantz", :compliment => "you're the best mafia"},
    #   {:name => "steven", :compliment => "not so classy"}, {:name => "george", :compliment => "you're a great dad"}, {:name => "natacha", :compliment => "you're a great mom"}]
    # #routes

    # def self.get_people
    #   @@people
    # end

    get '/person/:index' do
      # /person/0
      # params = {}
      # params[:index] = some_value_typed_in_the_path
      @person = Person.find_by_id(params[:index])
      erb :compliment
    end

    #helpers
    helpers do

      def give_compliment(person)
        "#{person[:name]} #{person[:compliment]}"
      end
      # def get_people
      #   @@people
      # end
      def partial(file_name)
        erb file_name, :layout => false
      end
    end

  end
end
