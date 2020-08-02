class School < ApplicationRecord
  validates :name, :email, :locale, presence: true
  validates_uniqueness_of :subdomain, presence: true

  after_create :create_tenant, :create_setting

  private

  def create_tenant
    Apartment::Tenant.create(subdomain)
  end

  def create_setting
    Setting.create
  end
end
