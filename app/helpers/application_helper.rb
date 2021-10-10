module ApplicationHelper
  def initials(string)
    string.split.map(&:first).join.upcase
  end
end
