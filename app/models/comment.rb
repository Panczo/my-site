class Comment < ActiveRecord::Base
	validates :podpis, presence: { message: "Musisz się podpisać" }
  validates :komentarz, presence: { message: "Pole komentarz musi być uzupełnione" }
  
  belongs_to :post


  scope :persisted, -> { where "id IS NOT NULL" }


end
