class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    def new
    end

    def create
        @new_article = Article.new(title: params[:title], description: params[:description])
        @new_article.save
        render json: {article: @new_article}
    end
end