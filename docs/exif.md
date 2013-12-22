# Exif

These are my notes about [exif data](http://en.wikipedia.org/wiki/Exchangeable_image_file_format).

Sample exif from `spec/fixtures/jonmagic.jpg`. Captured using the [exifr](http://exifr.rubyforge.org/api/index.html) gem.

```
{
  :make=>"Apple",
  :model=>"iPhone 5s",
  :orientation => #<EXIFR::TIFF::Orientation:TopLeft(1)>,
  :x_resolution=>(72/1),
  :y_resolution=>(72/1),
  :resolution_unit=>2,
  :software=>"Aperture 3.5.1",
  :date_time=>2013-12-02 09:49:39 -0800,
  :exposure_time=>(1/30),
  :f_number=>(12/5),
  :exposure_program=>2,
  :iso_speed_ratings=>80,
  :date_time_original=>2013-12-02 09:49:39 -0800,
  :date_time_digitized=>2013-12-02 09:49:39 -0800,
  :shutter_speed_value=>(1/30),
  :aperture_value=>2.4,
  :brightness_value=>(7779/2158),
  :metering_mode=>5,
  :flash=>32,
  :focal_length=>(43/20),
  :subsec_time_orginal=>"657",
  :subsec_time_digitized=>"657",
  :color_space=>1,
  :pixel_x_dimension=>960,
  :pixel_y_dimension=>1280,
  :sensing_method=>2,
  :exposure_mode=>0,
  :white_balance=>0,
  :focal_length_in_35mm_film=>33,
  :scene_capture_type=>0,
  :gps_latitude_ref=>"N",
  :gps_latitude=>[(37/1), (36/1), (613/100)],
  :gps_longitude_ref=>"W",
  :gps_longitude=>[(122/1), (23/1), (98/5)],
  :gps_altitude_ref=>"\x00",
  :gps_altitude=>(9986/1485),
  :gps_time_stamp=>[(17/1), (49/1), (39/1)],
  :gps_img_direction_ref=>"T",
  :gps_img_direction=>(16889/111),
  :gps_date_stamp=>"2013:12:02"
}
```
