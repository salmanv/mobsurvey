class Question < ActiveRecord::Base

acts_as_list
has_many :choices
#acts_as_list plugin in this model enables it to alter the order of appearance for each questino in our survey
end
