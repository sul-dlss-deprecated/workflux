json.array!(@statuses) do |status|
  json.extract! status, :id, :druid, :datastream, :process, :status, :error_msg, :error_txt, :datetime, :attempts, :elapsed, :lifecycle, :repository, :note, :priority, :lane_id
  json.url status_url(status, format: :json)
end
