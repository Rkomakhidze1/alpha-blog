class ArticlesController < ApplicationController
    before_action :authorized

    def index
        @articles = @user.articles
        render json: {user: @user, articles: @articles}
    end

    def show
        @article = Article.find(params[:id])
    end

    def new
        @new_article = Article.new
    end

    def create
        @new_article = Article.new(title: params[:title], description: params[:description])
        if @new_article.save
            redirect_to @new_article
        else 
            render "new"
        end
        
    end

    def edit 
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])

        if @article.update(title: params[:title], description: params[:description])
            redirect_to @article
        else
            render "edit"
        end
    end

    def destroy 
        @article = Article.find(params[:id])
        if @article.destroy
            redirect_to articles_path
        end
    end
end