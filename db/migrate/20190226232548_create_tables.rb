class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.timestamps null: false
    end

    create_table :medicines do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.string :dose, null: false
      t.string :description, null: false
      t.timestamps null: false
    end

    create_table :notes do |t|
      t.integer :user_id, null: false
      t.string :content, null: false
      t.timestamps null: false
    end

    create_table :babies do |t|
      t.integer :user_id, null: false
      t.string :name
      t.datetime :due_date, null: false
      t.string :gender, null: false
      t.timestamps null: false
    end

    create_table :appointments do |t|
      t.integer :baby_id, null: false
      t.string :name, null: false
      t.datetime :date, null: false
      t.timestamps null: false
    end
  end
end