class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_record
    rescue_from ActiveRecord::RecordNotFound, with: :unfound_record


    def invalid_record invalid
        render json: {errors: invalid.record.errors.full_messages},status: :unprocessable_entity
    end
    
    def unfound_record (error)
        render json:{errors: error},status: :not_found
    end

end
