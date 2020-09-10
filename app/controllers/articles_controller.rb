class ArticlesController < ApplicationController
    def show
        @article = Article.find(params[:id])
        @param = p params
    end
end