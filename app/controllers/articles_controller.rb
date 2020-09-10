class ArticlesController < ApplicationController
    def show
        byebug
        @article = Article.find(params[:id])
        @param = p params
    end
end