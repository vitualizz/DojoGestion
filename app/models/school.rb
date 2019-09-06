class School < ApplicationRecord
  validates :name, :email, :locale, presence: true
  validates_uniqueness_of :subdomain, presence: true

  after_create :create_tenant

  def create_tenant
    Apartment::Tenant.create(subdomain)
  end
end
