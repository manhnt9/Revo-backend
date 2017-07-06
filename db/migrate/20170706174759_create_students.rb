class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name
      t.datetime :birthday
      t.string :phone_number
      t.string :email
      t.string :social_network_link
      t.string :note
      t.references :course,      index: true, null: false, foreign_key: true

      t.timestamps
    end
  end
end
