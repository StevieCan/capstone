json.array! @tee_times.each do |tee_time|
  json.id tee_time.id
  json.caddy_id tee_time.caddy_id
  json.golfer_id tee_time.golfer_id
  json.location_id tee_time.location_id
  json.confirmed tee_time.confirmed
  json.no_caddy tee_time.no_caddy
  json.cart tee_time.cart
  json.number_of_holes tee_time.number_of_holes
  json.start_time tee_time.start_time
end