module StatsHelper

  def convert_label_to_whole_words category

    case category
      when 'pts'
        return 'Points'
      when 'g'
        return 'Goals'
      when 'a'
        return 'Assists'
      when 'gaa'
        return 'Goals Against Avg'
      when 'so'
        return 'Shutouts'
      else
        return ''
    end

  end

  def print_games_played player
  ap player

    if player['gp'].nil? or player['gp'].blank?
      gp = player['w'].to_i + player['l'].to_i
      ap gp
    else
      gp = player['gp']
    end

    gp

  end

end
