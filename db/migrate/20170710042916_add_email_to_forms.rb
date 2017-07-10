class AddEmailToForms < ActiveRecord::Migration[5.1]
  def change
    add_column :forms, :email, :string
  end
end
