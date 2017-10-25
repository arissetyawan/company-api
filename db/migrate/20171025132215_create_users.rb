class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :fullname
      t.string :token
      t.string :email
      t.timestamps
    end
    10.times do |t|
       u= User.new(email: "#{Time.now.to_i}@gmail.com")
       u.fullname= "Client #{t}"
       u.save
    end
  end
end
