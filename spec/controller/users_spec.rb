RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:example) { get('/users') }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders "index" template' do
      expect(response).to render_template('index')
    end
    it 'assigns all users to @users' do
      expect(assigns(:users)).to eq(User.all)
    end
  end

  describe 'GET #show' do
    before(:example) { get('/users/1') }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders "show" template' do
      expect(response).to render_template('show')
    end
  end
end
