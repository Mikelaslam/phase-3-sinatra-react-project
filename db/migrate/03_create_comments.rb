class CreateComments < ActiveRecord::Migration[6.1]
    create_table :comments do |t|
        t.string :title
        t.string :category
        t.text :content
        t.references :user, foreign_key: true
        t.references :question, foreign_key: true
        
        t.timestamps

end