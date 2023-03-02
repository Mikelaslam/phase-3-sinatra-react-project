class CreateQuestions < ActiveRecord::Migration[6.1]
    create_table :questions do |t|
        t.string :title
        t.string :category
        t.text :description
        t.boolean :archive, :default => false
        t.references :user, foreign_key: true
    end

end