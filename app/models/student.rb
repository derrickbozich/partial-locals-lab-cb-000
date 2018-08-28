# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(input)
    if input.empty?
      Student.all
    else
      matches = []
      Student.all.each do |student|
        binding.pry
        if !student.name.scan(/#{input}/i).first.empty?
          matches << student
        end
      end

    end



    binding.pry
    matches
  end


end
