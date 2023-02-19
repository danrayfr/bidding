module ApplicationHelper
  def full_title(page_title = '')
    base_title = "Online Bidding"
    if page_title.empty? 
      base_title
    else
      page_title + " | " + page_title
    end
  end
end