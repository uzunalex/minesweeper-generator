class MinesweeperBoard < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :name, presence: true
  validates :height, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :width, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :mines, presence: true, numericality: { only_integer: true, greater_than: 0 }

  validate :mines_are_less_than_cells, on: :create

  def mines_are_less_than_cells
    return if mines.blank? || width.blank? || height.blank?

    errors.add(:mines, "can't be greater than number of cells") if mines > width * height
  end

  before_save :generate_board

  def generate_board
    self.board_state = BoardGeneratorService.create_board(width, height, mines)
  end
end
