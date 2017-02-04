class Title < ActiveRecord::Base
  include Concerns::InstanceMethods
  extend Concerns::ClassMethods
  
  has_many :figures, through: :figure_titles
  has_many :figure_titles
end