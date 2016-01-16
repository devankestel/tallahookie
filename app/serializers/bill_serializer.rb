class BillSerializer < ActiveModel::Serializer
  attributes :id, :title, :identifier, :legislative_session, :year, :subject
end
