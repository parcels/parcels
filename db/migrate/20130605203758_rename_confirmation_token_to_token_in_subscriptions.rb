class RenameConfirmationTokenToTokenInSubscriptions < ActiveRecord::Migration
  def change
    rename_column :subscriptions, :confirmation_token, :token
  end
end
