class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_record


    def invalid_record invalid
        render json: {errors: invalid.record.errors.full_messages},status: :unprocessable_entity
    end
    
end
