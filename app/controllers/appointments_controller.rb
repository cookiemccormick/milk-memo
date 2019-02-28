class AppointmentsController < ApplicationController
  get '/appointments/new' do
    if logged_in?
      erb :'/appointments/new'
    else
      redirect '/login'
    end
  end

  post '/appointments' do
    if logged_in?
      if params[:appointment][:name].present? ||
        params[:appointment][:date].present? ||
        params[:appointment][:time].present?
        @appointment = current_user.appointments.create(params[:appointment])
        redirect '/dashboard'
      else
        redirect '/appointments/new'
      end
    else
      redirect '/login'
    end
  end

  get '/appointments/:id/edit' do
    if logged_in?
      @appointments = current_user.appointments.find_by(id: params[:id])
      if @appointment
        erb :'/appointments/edit'
      else
        redirect '/dashboard'
      end
    else
      redirect '/login'
    end
  end

  patch '/appointments/:id' do
    if logged_in?
      @appointment = current_user.appointments.find_by(id: params[:id])
      if params[:appointment][:name].present? ||
        params[:appointment][:date].present? ||
        params[:appointment][:time].present?
        @appointments.update(params[:appointment])
        redirect '/dashboard'
      else
        redirect "/appointments/#{@appointment.id}/edit"
      end
    else
      redirect '/login'
    end
  end

  delete '/appointments/:id' do
    if logged_in?
      @appointment = current_user.appointments.find_by(id: params[:id])
      if @appointment
        @appointment.destroy
      end
      redirect '/dashboard'
    else
      redirect '/login'
    end
  end
end