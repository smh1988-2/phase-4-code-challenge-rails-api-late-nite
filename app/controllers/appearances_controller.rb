class AppearancesController < ApplicationController

rescue_from ActiveRecord::RecordInvalid, with: :invalid_record

    def create
        new_appearance = Appearance.create!(appearance_params)
        render json: new_appearance, status: :created
    end

    private

    def appearance_params
        params.permit(:id, :rating, :episode_id, :guest_id)
    end

    def invalid_record(invalid)
        # byebug
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

end
