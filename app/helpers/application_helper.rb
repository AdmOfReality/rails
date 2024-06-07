module ApplicationHelper
  def flash_class(level)
    case level
        when 'notice' then "flash notice"
        when 'success' then "flash success"
        when 'alert' then "flash alert"
    end
  end
end
