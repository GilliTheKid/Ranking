module PagesHelper
  
  def title
    base_title = "Rank Your Team-mates"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end
