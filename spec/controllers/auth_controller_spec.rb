require 'rails_helper'

describe AuthController, type: :controller do

  describe 'GET #login' do
    it "renders the :login template" do
     get :login_form
     expect(response).to render_template :login_form
    end
  end

  describe 'GET #signup' do
    it "renders the :signup template" do
     get :signup_form
     expect(response).to render_template :signup_form
    end
  end

end
