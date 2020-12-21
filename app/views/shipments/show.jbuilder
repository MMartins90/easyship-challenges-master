json.shipment do 
  json.company_id           @shipment.company.id
  json.destination_country  @shipment.destination_country
  json.origin_country       @shipment.origin_country
  json.tracking_number      @shipment.tracking_number
  json.slug                 @shipment.slug
  json.created_at           @shipment.created_at.strftime('%A, %d %B %Y at%l:%M %p')
  json.items                @shipment.group_items

  if @tracking["checkpoints"].present?
    json.tracking do
      json.status                  @tracking["tag"]
      json.current_location        @tracking["location"]
      json.last_checkpoint_message @tracking["message"]
      json.last_checkpoint_time    @tracking["checkpoint_time"]
    end
  else
    json.tracking "No tracking information present"
  end
end
