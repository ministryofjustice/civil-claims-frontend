module Presenters
  module Claim
    class SocialLandlord < Presenter

      def claim
        @claim ||= Claim.new
      end

      def landlords
        @landlords ||= [Landlord.new]
      end

      def tenants
        @tenants ||= [Tenant.new]
      end
    end
  end
end