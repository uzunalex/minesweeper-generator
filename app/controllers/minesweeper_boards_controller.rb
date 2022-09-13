class MinesweeperBoardsController < ApplicationController
  before_action :set_minesweeper_board, only: %i[show edit update destroy]

  # GET /minesweeper_boards or /minesweeper_boards.json
  def index
    @minesweeper_boards = MinesweeperBoard.all
  end

  # GET /minesweeper_boards/1 or /minesweeper_boards/1.json
  def show; end

  # GET /minesweeper_boards/new
  def new
    @minesweeper_board = MinesweeperBoard.new
    @minesweeper_boards = MinesweeperBoard.all.order(created_at: :desc).limit(10)
  end

  # GET /minesweeper_boards/1/edit
  def edit; end

  # POST /minesweeper_boards or /minesweeper_boards.json
  def create
    @minesweeper_board = MinesweeperBoard.new(minesweeper_board_params)

    respond_to do |format|
      if @minesweeper_board.save
        format.html do
          redirect_to minesweeper_board_url(@minesweeper_board), notice: 'Minesweeper board was successfully created.'
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /minesweeper_boards/1 or /minesweeper_boards/1.json
  def update
    respond_to do |format|
      if @minesweeper_board.update(minesweeper_board_params)
        format.html do
          redirect_to minesweeper_board_url(@minesweeper_board), notice: 'Minesweeper board was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @minesweeper_board }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @minesweeper_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /minesweeper_boards/1 or /minesweeper_boards/1.json
  def destroy
    @minesweeper_board.destroy

    respond_to do |format|
      format.html { redirect_to minesweeper_boards_url, notice: 'Minesweeper board was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_minesweeper_board
    @minesweeper_board = MinesweeperBoard.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def minesweeper_board_params
    params.fetch(:minesweeper_board).permit(:name, :email, :width, :height, :mines)
  end
end
