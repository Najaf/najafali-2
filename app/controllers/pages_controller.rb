class PagesController < ApplicationController
  def home
    @articles = Article.all.order(publish_date: :desc).limit(5).load
  end
end
