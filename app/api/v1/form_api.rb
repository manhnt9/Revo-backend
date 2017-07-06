class V1::FormAPI < Grape::API
  desc "Test form"
  get :form do
    reply = { 'test': 1234 }
    render :json => reply
  end
end