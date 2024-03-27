class Book < ApplicationRecord
    # You can add validations here. For example:
    validates :title, presence: true
    validates :isbn, uniqueness: true, allow_blank: false
    # remember isbn is important
    
    # Add any custom logic, methods, or validations as needed.
  end
  