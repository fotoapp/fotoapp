class Role < ActiveRecord::Base

  has_and_belongs_to_many :users, :join_table => :users_roles
  belongs_to :resource, :polymorphic => true

  # https://github.com/EppO/rolify
  scopify

  # Public: Role name.
  # column :name

  # Public: Resource this role controls.
  # column :resource_id, :resource_type

  # Public: Created at date and time.
  # column :created_at

  # Public: Updated at date and time.
  # column :updated_at
end
