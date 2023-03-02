class CreateUsers < ActiveRecord::Migration[6.1]
    create_table :users do |t|
        t.string :name
        t.string :username
        t.string :email
        t.string :phone
    end

end