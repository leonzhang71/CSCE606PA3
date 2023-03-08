require 'rails_helper'

RSpec.describe Movie, type: :model do
  before(:all) do
    if Movie.where(:title => "Big Hero 6").empty?
      Movie.create(:title => "Big Hero 6", 
                   :rating => "PG", :release_date => "2014-11-07")
    end
    
    # TODO(student): add more movies to use for testing
  end
  
  describe "others_by_same_director method" do
    it "returns all other movies by the same director"
      # TODO(student): implement this test
    
    it "does not return movies by other directors"
      # TODO(student): implement this test
  end
  describe "#find_similar_movies" do
    context "when the movie has a director" do
      let(:movie) { FactoryBot.create(:movie, director: "George Lucas") }
      let(:similar_movie_1) { FactoryBot.create(:movie, director: "George Lucas") }
      let(:similar_movie_2) { FactoryBot.create(:movie, director: "Steven Spielberg") }
      let(:different_director_movie) { FactoryBot.create(:movie, director: "Quentin Tarantino") }

      it "returns similar movies" do
        expect(movie.find_similar_movies).to match_array([similar_movie_1, similar_movie_2])
      end

      it "does not include itself" do
        expect(movie.find_similar_movies).not_to include(movie)
      end
      it "does not include movies with a different director" do
        expect(movie.find_similar_movies).not_to include(different_director_movie)
      end
    end
    
    context "when the movie has no director" do
      let(:movie) { FactoryBot.create(:movie, director: nil) }
    
      it "returns an empty array" do
        expect(movie.find_similar_movies).to eq([])
      end
    end
  end
end


