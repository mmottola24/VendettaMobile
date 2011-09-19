module ApplicationHelper
  def check_game game
    date = "2011-06-23"
    time = "9:20 pm"

    now = Time.parse(date + ' ' + time)
    gametime = Time.parse(game['date'] + ' ' + game['end_time'])

    if (gametime >= now)
      return true
    else
      return false
    end
  end
end
