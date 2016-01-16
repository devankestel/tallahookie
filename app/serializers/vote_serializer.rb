class VoteSerializer < ActiveModel::Serializer
  attributes :id, :t_id, :bill_t_id, :name, :option, :counts
  has_one :bill
end
