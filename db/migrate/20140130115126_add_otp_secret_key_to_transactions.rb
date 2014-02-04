class AddOtpSecretKeyToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :otp_secret_key, :string
  end
end
