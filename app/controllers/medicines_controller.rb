class MedicinesController < ApplicationController
  get '/medicines/new' do
    if logged_in?
      erb :'/medicines/new'
    else
      redirect '/login'
    end
  end

  post '/medicines' do
    if logged_in?
      if params[:medicine][:name].present? ||
        params[:medicine][:dose].present? ||
        params[:medicine][:description].present?
        @medicine = current_user.medicines.create(params[:medicine])
        redirect '/dashboard'
      else
        redirect '/notes/new'
      end
    else
      redirect '/login'
    end
  end

  get '/medicines/:id/edit' do
    if logged_in?
      @medicine = current_user.medicines.find_by(id: params[:id])
      if @medicine
        erb :'/medicines/edit'
      else
        redirect '/dashboard'
      end
    else
      redirect '/login'
    end
  end

  patch '/medicines/:id' do
    if logged_in?
      @medicine = current_user.medicines.find_by(id: params[:id])
      if params[:medicine][:name].present? ||
        params[:medicine][:dose].present? ||
        params[:medicine][:description].present?
        @medicine.update(params[:medicine])
        redirect '/dashboard'
      else
        redirect "/medicines/#{@medicine.id}/edit"
      end
    else
      redirect '/login'
    end
  end

  delete '/medicines/:id' do
    if logged_in?
      @medicine = current_user.medicines.find_by(id: params[:id])
      if @medicine
        @medicine.destroy
      end
      redirect '/dashboard'
    else
      redirect '/login'
    end
  end
end