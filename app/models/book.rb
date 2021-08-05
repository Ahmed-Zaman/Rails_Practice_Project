class TitleValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A[a-zA-Z]+\z/
      record.errors.add attribute, (options[:message] || "No space or numbers allowed in Title. Only letters")
    end
  end
end


class Book < ApplicationRecord
  validates :title, presence: true, confirmation: true, uniqueness: true, exclusion: { in: %w(www com), message: "%{value} can not be used in Title"}, title: true
  validates :body, presence: true, length:  {minimum: 10}, format: { with: /^[a-zA-Z\s]*$/, multiline: true, message: "Only accepts letters"} 
  validates :confirm, acceptance: { accept: ['1', 'accepted'], message: " the dialog box", on: :create } 
  validates :title_confirmation, presence: true

  after_initialize do |book|
    puts "You initialized an object"
  end

  after_save :saved

  def saved   
    puts "You saved, #{title}"
  end

end