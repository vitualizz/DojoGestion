class CreateSchool < ActiveRecord::Migration[6.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :subdomain
      t.string :email
      t.string :locale
      t.timestamp
    end
  end
end
