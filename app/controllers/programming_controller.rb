class ProgrammingController < ApplicationController
    before_action :authenticate_account!, only: [:login_check, :show, :new ,:edit ,:add ,:find]

    def login_check
        @account = current_account
        @msg = 'you logined at: '+ @account.current_sign_in_at.to_s
    end

   def index
    if current_account 
        @programming = current_account.programming.page params[:page]
    else
        @programming = Programming.page params[:page]
    end
   end

   def show
    @programming = current_account.programming.find(params[:id])
   end

   def add
     @programming = current_account.programming.new
   end

   def create
    if request.post? then
        ogj = current_account.programming.create(programming_params)
    end
    redirect_to '/programming'
   end
   
   def edit
    @programming = Programming.find(params[:id])
   end

   def update
    obj = Programming.find(params[:id])
    obj.update(programming_params)
    redirect_to '/programming'   
   end

   def delete
    Programming.find(params[:id]).destroy
    redirect_to '/programming'
   end

   def find
    #ViewのFormで取得したパラメータをモデルに渡す
    @programming = Programming.search(params[:search])
   end

    private
    def programming_params
        params.require(:programming).permit(:account_id, :title, :question, :answer, :url)
    end   
end

