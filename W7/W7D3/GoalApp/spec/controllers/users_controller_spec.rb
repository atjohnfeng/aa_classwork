require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    describe 'GET#new' do
        it "renders the new user template" do
            get:new
            expect(response).to render_template(:new)
        end
    end

    describe 'POST#create' do
        context "with valid params" do
            let(:user_params) do {  
                user: { username: 'goalman', password: 'abcdef' }
            } end

            it "logs in user" do
                post:create, params:user_params
                user = User.find_by(username: 'goalman')
                expect(session[:session_token]).to eq(user.session_token)
            end

            it "should redirect to user showpage" do
                post:create, params:user_params
                user = User.find_by(username: 'goalman')
                expect(response).to redirect_to(user_url(user))
            end
        end
    end

end