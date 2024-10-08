class UserMatcher
  def initialize(current_user)
    @current_user = current_user
  end

  def find_matching_user
    matching_users_in_same_city = find_users_by_city_and_hobbies(@current_user.location)
    return matching_users_in_same_city.sample if matching_users_in_same_city.any?

    matching_users_in_other_cities = find_users_by_hobbies
    return matching_users_in_other_cities.sample if matching_users_in_other_cities.any?

    nil
  end

  private

  def find_users_by_city_and_hobbies(city)
    User.joins(:hobbies)
        .where(location: city)
        .where.not(id: @current_user.id)
        .where(hobbies: { id: @current_user.hobby_ids })
        .distinct
  end

  def find_users_by_hobbies
    User.joins(:hobbies)
        .where.not(location: @current_user.location)
        .where.not(id: @current_user.id)
        .where(hobbies: { id: @current_user.hobby_ids })
        .distinct
  end
end
