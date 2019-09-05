class School < ApplicationRecord
  validates_uniqueness_of :subdomain

  after_create :create_tenant

  def create_tenant
    Apartment::Tenant.create(subdomain)
  end
end
