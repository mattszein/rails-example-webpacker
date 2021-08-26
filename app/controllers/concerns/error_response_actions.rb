# frozen_string_literal: true

module ErrorResponseActions
  ERROR_RESPONSE_ACTIONS = %(resource_not_found
                             page_not_found
                            )

  def resource_not_found
    respond_to do |format|
      format.html { render template: "/rescues/record_not_found", status: :not_found }
      format.json { render json: "Record Not Found", status: :not_found }
    end
  end

  def page_not_found
    respond_to do |format|
      format.html { render template: "/rescues/page_not_found", status: :not_found }
      format.json { render json: "Page Not Found", status: :not_found }
    end
  end
end
