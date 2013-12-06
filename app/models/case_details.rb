class CaseDetails < ActiveResource::Base
  self.site = Rails.configuration.api_uri

  belongs_to :claim

  schema do
    integer 'id'

    boolean :non_payment_of_rent
    boolean :anti_social_behaviour
    boolean :property_misuse
    boolean :other_breach_of_tenancy
    string  :other_breach_text

    # notices
    boolean :notice_to_quit
    date    :notice_served_date
    boolean :breach_of_lease
    boolean :seeking_possession
    boolean :other_recovery_steps_taken
    string  :other_recovery_steps_text

    # about the tenancy
    string :tenancy_type
    date   :tenancy_start_date

    # unpaid rent
    decimal :rental_amount
    string  :payment_frequency
    decimal :daily_rent_amount

    # additional information
    string  :other_information
    boolean :includes_human_rights_issues
  end
end
