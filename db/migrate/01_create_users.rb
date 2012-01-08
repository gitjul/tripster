class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :crypted_password
      t.string :email
      t.boolean :admin
      t.string :fullname
      t.string :bio
      t.string :location
      t.string :persistence_token

      t.timestamps
    end
  end
end
