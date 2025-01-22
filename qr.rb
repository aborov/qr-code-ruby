require "rqrcode"

puts "Welcome to QR code generator!"
puts "What kind of QR code would you like to generate?"
puts
puts "1. Open a URL"
puts "2. Join a wifi network"
puts "3. Send a text message"
puts
puts "Press 4 to exit"

input = gets.chomp

if input == "4"
  puts "Goodbye!"
  exit
elsif input == "1"
  puts "Enter the URL that you'd like to encode:"
  url = gets.chomp
  encode = url

  puts "Enter the name for the PNG file:"
  name = gets.chomp

elsif input == "2"
  puts "Enter the name of the wifi network:"
  ssid = gets.chomp

  puts "Enter the password:"
  password = gets.chomp

  puts "Enter the name for the PNG file:"
  name = gets.chomp

  encode = "WIFI:T:WPA;S:#{ssid};P:#{password};;"

elsif input == "3"
  puts "Enter the phone number you want the code to send a message to:"
  phone = gets.chomp

  puts "Enter the text for the message:"
  message = gets.chomp

  puts "Enter the name for the PNG file:"
  name = gets.chomp

  encode = "SMSTO:#{phone}:#{message}"
end

if encode
  # Generate the QR code
  qrcode = RQRCode::QRCode.new(encode)

  # Convert the QR code to a PNG image
  png = qrcode.as_png(size: 500)

  # Write the QR code image to a file
  IO.binwrite("#{name}.png", png.to_s)

  puts "QR Code saved as #{name}.png!"
end
