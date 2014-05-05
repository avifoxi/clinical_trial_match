Geocoder.configure(

  # geocoding service (see below for supported options):
  :google => {
    :timeout => 5
  },
  :yandex => {
    :timeout => 5
  }

  # # geocoding service request timeout, in seconds (default 3):

  # # set default units to kilometers:
  # :units => :km,

  # caching (see below for details):
  #:cache => Redis.new,
  #:cache_prefix => "..."

)
