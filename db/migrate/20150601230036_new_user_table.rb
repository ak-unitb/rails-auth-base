class NewUserTable < ActiveRecord::Migration
  def change

    drop_table :users

    create_table(:users) do |t|

      ## custom
      t.string :firstname
      t.string :middlename
      t.string :lastname
      t.string :title
      t.integer :sex
      t.string :salutation

      ## Database authenticatable (1)
      t.string :email, null: false, default: ""

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Database authenticatable (2)
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## custom
      t.integer :roles ## realized with https://github.com/joelmoss/bitmask_attributes
      t.integer :status

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip


      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      ## Rememberable
      t.datetime :remember_created_at

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    ## Confirmable
    add_index :users, :confirmation_token,   unique: true
    ## Lockable
    # add_index :users, :unlock_token,         unique: true

  end
end
