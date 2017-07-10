class CreateForms < ActiveRecord::Migration[5.1]
  def change
    create_table :forms do |t|
      t.string :name
      t.string :parent_name
      t.string :dob
      t.string :phone
      t.string :email
      t.string :social
      t.string :course

      t.timestamps
    end
  end
end
