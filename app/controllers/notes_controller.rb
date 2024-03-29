class NotesController < ApplicationController
  def index
    @notes = Article.all.order(publish_date: :desc).load
  end

  def show
    @note = Article.find_by(slug: params[:id]).load.first
  end

  def rss
    @notes = Article.all.order(publish_date: :desc).load
    render 'rss', content_type: 'text/xml', formats: :xml
  end
end
