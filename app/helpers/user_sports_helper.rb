module UserSportsHelper


def match_sport_ids( all_user_sports )
    user_sports = []
    all_user_sports.each do |sports|
      sport_ids = []
      sports.each do |sport|
        sport_ids << sport.id
      end
      user_sports.push( sport_ids )
    end
    return user_sports
  end



end
