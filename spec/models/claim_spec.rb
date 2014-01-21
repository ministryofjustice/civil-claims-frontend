require 'spec_helper'

describe Claim do

  subject { Claim.new }
  it { should respond_to :id }
  it { should respond_to :property }
  it { should respond_to :landlords }
  it { should respond_to :tenants }

end
