class CaseDetail < ActiveResource::Base
  self.site = Rails.configuration.api_uri

  belongs_to :claim

  schema do
    integer 'id'

    # about the tenancy
    string :tenancy_type
    date   :tenancy_start_date
    decimal :rental_amount
    string  :payment_frequency
    decimal :daily_rent_amount

    # about the case
    string  :type_of_notice_served
    date    :notice_served_date
    decimal :total_unpaid_rent

    # additional information
    string  :other_information
    boolean :includes_human_rights_issues
  end
end
