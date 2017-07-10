class RemoveEmailFromForms < ActiveRecord::Migration[5.1]
  def change
    remove_column :forms, :email, :string
  end
end
