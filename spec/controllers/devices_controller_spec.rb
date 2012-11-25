require 'spec_helper'

describe DevicesController do
  include EventedSpec::SpecHelper
  # This should return the minimal set of attributes required to create a valid
  # Device. As you add validations to Device, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {state: 'ok', hostname: 'foo.lvh.me'}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DevicesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  before(:each) do
    sign_in FactoryGirl.create(:user)
  end

  describe "GET index" do
    it "assigns all devices as @devices" do
      device = Device.create! valid_attributes
      get :index, {}
      assigns(:devices).should eq([device])
    end
  end

  describe "GET show" do
    it "assigns the requested device as @device" do
      device = Device.create! valid_attributes
      get :show, {:id => device.to_param}
      assigns(:device).should eq(device)
    end
  end

  describe "GET new" do
    it "assigns a new device as @device" do
      get :new, {}
      assigns(:device).should be_a_new(Device)
    end
  end

  describe "GET edit" do
    it "assigns the requested device as @device" do
      device = Device.create! valid_attributes
      get :edit, {:id => device.to_param}
      assigns(:device).should eq(device)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Device" do
          Device.any_instance.stub(:scan => nil)
          expect {
            post :create, {:device => valid_attributes}
          }.to change(Device, :count).by(1)
      end

      it "assigns a newly created device as @device" do
        Device.any_instance.stub(:scan => nil)
        post :create, {:device => valid_attributes}
        assigns(:device).should be_a(Device)
        assigns(:device).should be_persisted
      end

      it "redirects to the created device" do
        Device.any_instance.stub(:scan => nil)
        post :create, {:device => valid_attributes}
        response.should redirect_to(Device.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved device as @device" do
        # Trigger the behavior that occurs when invalid params are submitted
        Device.any_instance.stub(:save).and_return(false)
        post :create, {:device => {}}
        assigns(:device).should be_a_new(Device)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Device.any_instance.stub(:save).and_return(false)
        Device.any_instance.stub(:errors).and_return({:error => 'foo'})
        post :create, {:device => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested device" do
        device = Device.create! valid_attributes
        # Assuming there are no other devices in the database, this
        # specifies that the Device created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Device.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => device.to_param, :device => {'these' => 'params'}}
      end

      it "assigns the requested device as @device" do
        device = Device.create! valid_attributes
        put :update, {:id => device.to_param, :device => valid_attributes}
        assigns(:device).should eq(device)
      end

      it "redirects to the device" do
        device = Device.create! valid_attributes
        put :update, {:id => device.to_param, :device => valid_attributes}
        response.should redirect_to(device)
      end
    end

    describe "with invalid params" do
      it "assigns the device as @device" do
        device = Device.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Device.any_instance.stub(:save).and_return(false)
        put :update, {:id => device.to_param, :device => {}}
        assigns(:device).should eq(device)
      end

      it "re-renders the 'edit' template" do
        device = Device.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Device.any_instance.stub(:save => false, :errors => {:a => '1'})
        put :update, {:id => device.to_param, :device => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested device" do
      device = Device.create! valid_attributes
      expect {
        delete :destroy, {:id => device.to_param}
      }.to change(Device, :count).by(-1)
    end

    it "redirects to the devices list" do
      device = Device.create! valid_attributes
      delete :destroy, {:id => device.to_param}
      response.should redirect_to(devices_url)
    end
  end

end
