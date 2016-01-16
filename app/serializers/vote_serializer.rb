class VoteSerializer < ActiveModel::Serializer
  attributes :id, :t_id, :bill_t_id, :fancy_name, :option, :counts
  has_one :bill
  def fancy_name()
    object.name.gsub!(/\"/, '\'')
  end
end
