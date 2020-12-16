json.shipment do 
  json.company_id           @shipment.company.id
  json.destination_country  @shipment.destination_country
  json.origin_country       @shipment.origin_country
  json.tracking_number      @shipment.tracking_number
  json.slug                 @shipment.slug
  json.created_at           @shipment.created_at.strftime('%A, %d %B %Y at%l:%M %p')
  json.items                @shipment.group_items

  if @tracker.present?
    json.tracker do
      json.status                   @tracker.status
      json.current_location         @tracker.current_location
      json.last_checkpoint_message  @tracker.last_checkpoint_message
      json.last_checkpoint_time     @tracker.last_checkpoint_time
    end
  else
    json.tracker 'No tracking information is available at this time'
  end
end
