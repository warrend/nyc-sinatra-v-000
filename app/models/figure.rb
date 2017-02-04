class Figure < ActiveRecord::Base
  include Concerns::InstanceMethods
  extend Concerns::ClassMethods
  
  has_many :landmarks
  has_many :titles
  has_many :figure_titles 
  has_many :titles, through: :figure_titles
end