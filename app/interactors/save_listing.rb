class SaveListing < BaseInteractor
  record :service_area
  hash   :person, strip: false

  string :description
  string :title
  string :type

  # todo: add other fields here and in nested interactors

  def execute
    merging_errors(in_transaction: true) do
      person_record = compose SavePerson, person
      Listing.create inputs.merge person: person_record
    end
  end

  def id; nil end # helps serialization
end
