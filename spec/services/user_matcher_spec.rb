require 'rails_helper'

RSpec.describe UserMatcher, type: :service do
  let(:current_user) { create(:user, location: "Berlin", hobbies: [ hobby1, hobby2 ]) }
  let(:hobby1) { create(:hobby, name: "Schwimmen") }
  let(:hobby2) { create(:hobby, name: "Lesen") }

  context 'User mit gleichen Interessen im gleichen Wohnort vorhanden' do
    let!(:matching_user) { create(:user, location: "Berlin", hobbies: [ hobby1, hobby2 ]) }

    it 'findet User' do
      matcher = UserMatcher.new(current_user)
      result = matcher.find_matching_user

      expect(result).to eq(matching_user)
    end
  end

  context 'Kein User mit gleichen Interessen im gleichen Wohnort vorhanden (aber in einem anderen Wohnort)' do
    let!(:matching_user) { create(:user, location: "Hamburg", hobbies: [ hobby1, hobby2 ]) }

    it 'Findet User aus andere Stadt' do
      matcher = UserMatcher.new(current_user)
      result = matcher.find_matching_user

      expect(result).to eq(matching_user)
    end
  end

  context 'Kein User User mit gleichen Interessen im gesamten System zu finden' do
    it 'return nil' do
      matcher = UserMatcher.new(current_user)
      result = matcher.find_matching_user

      expect(result).to be_nil
    end
  end
end
