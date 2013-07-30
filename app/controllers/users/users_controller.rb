# coding: utf-8
class Users::UsersController < ApplicationController
  expose(:user) { User.find(params[:id]) }

  def show
  end
end