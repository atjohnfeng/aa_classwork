print @guests[0]
@guests.each do |guest|
    # json.set! guest.id do
        # json.id guest.id
        # json.name guest.name
        # json.favorite_color guest.favorite_color
        json.partial! 'api/guests/guest', guest: guest
    # end
end