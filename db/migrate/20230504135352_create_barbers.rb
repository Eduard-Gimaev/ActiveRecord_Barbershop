class CreateBarbers < ActiveRecord::Migration[7.0]
  def change

    create_table :barbers do |t| 
      t.text :name

      t.timestamps  
    end 
    
    Barber.create :name => 'Andrey Trost'
    Barber.create :name => 'Dima Zab'
    Barber.create :name => 'Shamil Nur'

  end
end
