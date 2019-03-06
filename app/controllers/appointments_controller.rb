class AppointmentsController < ApplicationController
  get '/appointments/new' do
    if logged_in?
      erb :'/appointments/new'
    else
      flash[:message] = "Please login."
      redirect '/login'
    end
  end

  post '/appointments' do
    if logged_in?
      if params[:appointment][:name].present? &&
        params[:appointment][:date].present? &&
        params[:appointment][:time].present?
        @appointment = current_user.appointments.create(params[:appointment])

        flash[:message] = "Your appointment has been added to the dashboard."
        redirect '/dashboard'
      else
        flash[:message] = "Please enter content for all fields."
        redirect '/appointments/new'
      end
    else
      flash[:message] = "Please login."
      redirect '/login'
    end
  end

  get '/appointments/:id/edit' do
    if logged_in?
      @appointment = current_user.appointments.find_by(id: params[:id])
      if @appointment
        erb :'/appointments/edit'
      else
        flash[:message] = "Could not find appointment."
        redirect '/dashboard'
      end
    else
      flash[:message] = "Please login."
      redirect '/login'
    end
  end

  patch '/appointments/:id' do
    if logged_in?
      @appointment = current_user.appointments.find_by(id: params[:id])
      if params[:appointment][:name].present? &&
        params[:appointment][:date].present? &&
        params[:appointment][:time].present?
        @appointment.update(params[:appointment])

        flash[:message] = "Your appointment has been updated."
        redirect '/dashboard'
      else
        flash[:message] = "Please enter content for all fields."
        redirect "/appointments/#{@appointment.id}/edit"
      end
    else
      flash[:message] = "Please login."
      redirect '/login'
    end
  end

  delete '/appointments/:id' do
    if logged_in?
      @appointment = current_user.appointments.find_by(id: params[:id])
      if @appointment
        @appointment.destroy
        flash[:message] = "Appointment deleted."
      end
      redirect '/dashboard'
    else
      redirect '/login'
    end
  end
end