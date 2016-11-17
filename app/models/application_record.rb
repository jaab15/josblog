class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  NBR_LINE = 10


  def self.calculate_nbr_req(query)
      search(query).count
  end

  def self.search_pag(query, page_off)
      search(query).all.limit(NBR_LINE).offset(page_off)
  end

  def self.search(query)
      Post.where( ["title       LIKE ?","%#{query}%"] ).or(
      Post.where( ["body        LIKE ?","%#{query}%"] )
      )
  end


end
