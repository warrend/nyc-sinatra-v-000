class FigureTitle < ActiveRecord::Base
  include Concerns::InstanceMethods
  extend Concerns::ClassMethods

  belongs_to :figure
  belongs_to :title
end