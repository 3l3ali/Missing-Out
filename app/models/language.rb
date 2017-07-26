class Language < ApplicationRecord
  belongs_to :user

  validates :name, uniqueness: { scope: :user_id }

  def self.available(user)
    I18nData.languages.values.reject { |language| user.languages.pluck(:name).include?(language) }
  end
end
