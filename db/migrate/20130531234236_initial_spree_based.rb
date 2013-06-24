class InitialSpreeBased < ActiveRecord::Migration
  def up

  	create_table :addresses do |t|
      t.string     :firstname
      t.string     :lastname
      t.string     :address1
      t.string     :address2
      t.string     :city
      t.string     :zipcode
      t.string     :phone
      t.string     :state_name
      t.string     :alternative_phone
      t.string     :company
      t.references :state
      t.references :country
      t.timestamps
    end

    add_index :addresses, [:firstname], :name => 'index_addresses_on_firstname'
    add_index :addresses, [:lastname],  :name => 'index_addresses_on_lastname'

    create_table :states do |t|
      t.string     :name
      t.string     :abbr
      t.references :country
    end

    create_table :orders do |t|
      t.string     :number,               :limit => 15
      t.decimal    :item_total,                         :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.decimal    :total,                              :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.string     :state
      t.decimal    :adjustment_total,                   :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.references :user
      t.datetime   :completed_at
      t.references :bill_address
      t.references :ship_address
      t.decimal    :payment_total,                      :precision => 8, :scale => 2, :default => 0.0
      t.references :shipping_method
      t.string     :shipment_state
      t.string     :payment_state
      t.string     :email
      t.text       :special_instructions
      t.timestamps
    end

    add_index :orders, [:number], :name => 'index_orders_on_number'


  	create_table :products do |t|
      t.string     :name,                 :default => '', :null => false
      t.string     :title
      t.string     :cover_image_uid
      t.references :categoria
      t.references :color
      t.references :tamanho
      t.text       :description
      t.decimal    :price
      t.decimal    :discount
      t.datetime   :available_on
      t.datetime   :deleted_at
      t.string     :permalink
      t.string     :meta_description
      t.string     :meta_keywords
      t.references :shipping_category
      t.integer    :count_on_hand,        :default => 0,  :null => false
      t.timestamps
    end

    add_index :products, [:available_on], :name => 'index_products_on_available_on'
    add_index :products, [:deleted_at],   :name => 'index_products_on_deleted_at'
    add_index :products, [:name],         :name => 'index_products_on_name'
    add_index :products, [:permalink],    :name => 'index_products_on_permalink'


    create_table :shipping_categories do |t|
      t.string   :name
      t.timestamps
    end

    #verify
    create_table :roles do |t|
      t.string :name
    end

    create_table :roles_users, :id => false do |t|
      t.references :role
      t.references :user
    end
	  add_index :roles_users, [:role_id], :name => 'index_roles_users_on_role_id'
    add_index :roles_users, [:user_id], :name => 'index_roles_users_on_user_id'

    create_table :users do |t|
      t.string     :encrypted_password,     :limit => 128
      t.string     :password_salt,          :limit => 128
      t.string     :email
      t.string     :remember_token
      t.string     :persistence_token
      t.string     :reset_password_token
      t.string     :perishable_token
      t.integer    :sign_in_count,                         :default => 0, :null => false
      t.integer    :failed_attempts,                       :default => 0, :null => false
      t.datetime   :last_request_at
      t.datetime   :current_sign_in_at
      t.datetime   :last_sign_in_at
      t.string     :current_sign_in_ip
      t.string     :last_sign_in_ip
      t.string     :login
      t.references :ship_address
      t.references :bill_address
      t.string     :authentication_token
      t.string     :unlock_token
      t.datetime   :locked_at
      t.datetime   :remember_created_at
      t.datetime   :reset_password_sent_at
      t.timestamps
    end
    add_index :users, [:email], :name => 'index_users_on_email'

  end

  def down
  end
end
