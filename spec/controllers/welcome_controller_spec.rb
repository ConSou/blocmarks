require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  describe "get #index" do

    it "renders the index view" do

      get :index
      expect(response).to render_template("index")
    end
  end

end
