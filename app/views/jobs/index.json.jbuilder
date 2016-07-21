json.array!(@jobs) do |job|
  json.extract! job, :id, :companyName, :positionTitle, :positionDescription, :location, :category
  json.url job_url(job, format: :json)
end
