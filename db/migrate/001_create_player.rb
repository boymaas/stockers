class CreatePlayer < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.references 'account' # , Integer, ForeignKey('account.id')),
      t.string 'email' # , Unicode(255), unique=True),
      t.string 'nick' # , Unicode(32), unique=True),
      t.string 'fullname' # , Unicode(56)),
      t.string 'password' # , Unicode(32)),
      t.string 'password_md5' # , Unicode(32)),
    end
  end
end

