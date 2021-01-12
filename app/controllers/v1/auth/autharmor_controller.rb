# frozen_string_literal: true

module V1
  module Auth
    class AutharmorController < ApplicationController
      def invite
        render json: {
          success: 'User found'
        }, status: 200
      end

      def logout
        render json: {
          success: 'User found'
        }, status: 200
      end

      def auth
        render json: {
          success: 'User found'
        }, status: 200
      end

      def me
        render json: {
          success: 'User found'
        }, status: 200
      end

      def confirm
        @user = User.find_by(username: params[:username])
        if @user.present?
          render json: {
            success: 'User found'
          }, status: 200
        else
          render json: {
            error: 'No such user; check the submitted username'
          }, status: 404
        end
      end
    end
  end
end
