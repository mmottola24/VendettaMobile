module ApplicationHelper
  def check_game game

    now = Time.now
    gametime = Time.parse(game['date'] + ' ' + game['end_time'])

    if (gametime >= now)
      return true
    else
      return false
    end
  end

  def does_date_have_games? day, games
      total = 0
      games[day].each do |game|
        if check_game game
          total += 1
          break
        end
      end
      if total > 0
        return true
      else
        return false
      end
  end
end
