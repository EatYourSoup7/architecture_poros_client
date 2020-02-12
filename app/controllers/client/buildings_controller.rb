class Client::BuildingsController < ApplicationController

  def index
    @buildings = Building.all
    render 'index.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    @building = Building.create(
                               name: params[:name],
                               address: params[:address],
                               height: params[:height],
                               construction_date: params[:construction_date],
                               architect: params[:architect]
                              )

    redirect_to "/client/buildings/#{@building.id}"
  end

  def show
    @building = Building.find(params[:id])
    render 'show.html.erb'
  end

  def edit
    @building = Building.find(params[:id])
    render "edit.html.erb"
    # response = HTTP.get("http://localhost:3000/api/buildings/#{params[:id]}")
    # @building = response.parse
    # render "edit.html.erb"
  end

  def update
    @building = Building.find(params[:id])
    @building.update(
                      name: params[:name],
                      address: params[:address],
                      height: params[:height],
                      construction_date: params[:construction_date],
                      architect: params[:architect]
                      )
    redirect_to "/client/buildings/#{@building.id}"
    # client_params = {
    #                  name: params[:name],
    #                  address: params[:address],
    #                  height: params[:height],
    #                  construction_date: params[:construction_date],
    #                  architect: params[:architect]
    #                 }

    # response = HTTP.patch(
    #                       "http://localhost:3000/api/buildings/#{params[:id]}", 
    #                       form: client_params
    #                       )

    # redirect_to "/client/buildings/#{params[:id]}"
  end

  def destroy
    response = HTTP.delete("http://localhost:3000/api/buildings/#{params[:id]}")
    redirect_to "/"
  end
end

