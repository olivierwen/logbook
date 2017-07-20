class SessionsController < ApplicationController
  def new
  end

  def create
    pilot = Pilot.find_by(pseudo: params[:pseudo])
    if pilot && pilot.authenticate(params[:password])
      session[:pilot_id] = pilot.id
      redirect_to pilot_path, notice: 'Connecté !'
    else
      flash.now.alert = 'Pseudo ou mot de passe invalide !'
      render :new
    end
  end

  def destroy
    session.delete(:pilot_id)
    redirect_to pilots_url, notice: 'Déconnecté !'
  end
end
