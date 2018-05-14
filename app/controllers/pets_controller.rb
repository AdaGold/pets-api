class PetsController < ApplicationController
  def dan
    render json: { cool: true, awesome: true }
  end

  def index
    pets = Pet.all
    render :json => pets.to_json, :callback => params['callback'],
      :status => :ok
  end

  def show
    pet = Pet.find(params[:id])

    render :json => pet.to_json, :callback => params['callback'],
      :status => :ok
  end


  def create
    pet = Pet.new(
      name: params[:name],
      age: params[:age],
      breed: params[:breed],
      about: params[:about],
      vaccinated: params[:vaccinated]
    )

    if pet.save
      render :json => pet.to_json, :status => :ok
    end
  end


  def destroy
    pet = Pet.find(params[:id])

    if pet.destroy
      render :json => pet.to_json, :status => :no_content
    end
  end

  def vaccinated
    pet = Pet.find(params[:id])
    pet.vaccinated = params[:vaccinated]

    if pet.save
      render :json => pet.to_json, :status => :ok
    end
  end

  def dibs
    pet = Pet.find(params[:id])

    unless pet.owner
      pet.owner = params[:owner]
      if pet.save
        render :json => pet.to_json, :callback => params['callback'],
      :status => :ok
      end
    else
      render :json => [], :callback => params['callback'], :status => :no_content
    end
  end

end
