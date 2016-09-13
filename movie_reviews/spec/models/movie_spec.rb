require 'rails_helper'

describe Movie, type: :model do
  # def bad_movie
  #   @bad_movie ||= create(:movie, :with_poor_rating)
  # end

  it 'is valid with a title and release year' do
    movie = Movie.new(title: "Hello", release_year: 1990)
    expect(movie).to be_valid
  end

  it 'is invalid without a title' do
    movie = Movie.new(release_year: 1990)
    movie.valid?
    expect(movie.errors[:title]).to include("can't be blank")
  end

  describe 'returning lists of movies' do
    let(:bad_movie) { create(:movie, :with_poor_rating ) }
    let(:good_movie) { create(:movie, :with_good_rating) }
    let(:okay_movie) { create(:movie, :with_okay_rating) }

    it 'returns a list of all of the movies ordered from highest to lowest rated' do

      expect(Movie.highest_to_lowest).to eq([good_movie, okay_movie, bad_movie])
    end

    it 'returns a list of the movies from the 1980s' do
      eighties_movie = create(:movie, :from_eighties)
      nineties_movie = create(:movie, :from_nineties)
      expect(Movie.eighties).to eq([eighties_movie])
    end

    it 'returns a list of all of the movies ordered from lowest to highest rated' do
      expect(Movie.lowest_to_highest).to eq([bad_movie, okay_movie, good_movie])
    end
  end

  describe 'data about one particular movie'
end
