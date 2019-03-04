class MedicinesController < ApplicationController
  get '/medicines/new' do
    if logged_in?
      erb :'/medicines/new'
    else
      flash[:message] = "Please login."
      redirect '/login'
    end
  end

  post '/medicines' do
    if logged_in?
      if params[:medicine][:name].present? &&
        params[:medicine][:dose].present? &&
        params[:medicine][:description].present?
        @medicine = current_user.medicines.create(params[:medicine])

        flash[:message] = "Your medication has been added to the dashboard."
        redirect '/dashboard'
      else
        flash[:message] = "Please enter content for all fields."
        redirect '/medicines/new'
      end
    else
      flash[:message] = "Please login."
      redirect '/login'
    end
  end

  get '/medicines/:id/edit' do
    if logged_in?
      @medicine = current_user.medicines.find_by(id: params[:id])
      if @medicine
        erb :'/medicines/edit'
      else
        flash[:message] = "Could not find medicine."
        redirect '/dashboard'
      end
    else
      flash[:message] = "Please login."
      redirect '/login'
    end
  end

  patch '/medicines/:id' do
    if logged_in?
      @medicine = current_user.medicines.find_by(id: params[:id])
      if params[:medicine][:name].present? &&
        params[:medicine][:dose].present? &&
        params[:medicine][:description].present?
        @medicine.update(params[:medicine])

        flash[:message] = "Your medication has been updated."
        redirect '/dashboard'
      else
        flash[:message] = "Please enter content for all fields."
        redirect "/medicines/#{@medicine.id}/edit"
      end
    else
      flash[:message] = "Please login."
      redirect '/login'
    end
  end

  delete '/medicines/:id' do
    if logged_in?
      @medicine = current_user.medicines.find_by(id: params[:id])
      if @medicine
        @medicine.destroy
      end
      flash[:message] = "Medication deleted."
      redirect '/dashboard'
    else
      flash[:message] = "Please login."
      redirect '/login'
    end
  end
end