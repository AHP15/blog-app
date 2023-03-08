class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, default: 'username'
      t.string :photo, default: 'https://png.pngtree.com/png-vector/20190625/ourlarge/pngtree-business-male-user-avatar-vector-png-image_1511454.jpg'
      t.text :bio
      t.integer :posts_counter, default: 0

      t.timestamps
    end
  end
end
