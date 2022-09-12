class MinesweeperBoard < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :height, presence: true, numericality: { only_integer: true, greater_than: 1 }
  validates :width, presence: true, numericality: { only_integer: true, greater_than: 1 }
  validates :mines, presence: true, numericality: { only_integer: true, greater_than: 0 }

  validate :mines_are_less_than_cells

  def mines_are_less_than_cells
    errors.add(:mines, "can't be greater than or equal to cells") if mines >= width * height
  end

  before_save :generate_board

  def generate_board
    self.board_state = BoardGeneratorService.create_board(width, height, mines)
  end
end
