class NotesController < ApplicationController

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(
                      brew_id: params[:brew_id],
                      text: params[:text])
    @note.save

    flash[:success] = "Added Note"
    redirect_back(fallback_location: :new)
  end

end
