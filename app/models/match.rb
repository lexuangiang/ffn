class Match < ApplicationRecord
  belongs_to :rate
  belongs_to :home, class_name: Club.name, foreign_key: :home_id
  belongs_to :away, class_name: Club.name, foreign_key: :away_id

  has_many :bets, dependent: :destroy

  validates :match_date, presence: true
  validates :match_time, presence: true
  validates :home, presence: true
  validates :away, presence: true
  validates :rate, presence: true
  validate :check_home_id_and_away_id

  scope :desc_by_match_date, ->{order match_date: :desc}

  private
  def check_home_id_and_away_id
    if (self.home_id == self.away_id)
      errors.add :home_id, I18n.t("match.check_club")
    end
  end
end
