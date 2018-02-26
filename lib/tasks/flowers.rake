namespace :flowers do
  desc 'Generate Flowers'

  task generate: :environment do
    flowers_dir = "#{Rails.root}/public/flowers"
    count = 0

    puts 'Generating flowers...'

    FileUtils.rm_r flowers_dir if File.directory? flowers_dir

    100.times do |i|
      print "\r#{i}%\t"

      album = i + 1
      album_dir = "#{flowers_dir}/#{album}"

      FileUtils.mkdir_p album_dir

      rand(5..20).times do |j|
        picture = j + 1
        color = ChunkyPNG::Color.rgb rand(255), rand(255), rand(255)

        ChunkyPNG::Image.new(16, 16, color).save "#{album_dir}/#{picture}.png"

        count += 1
      end
    end

    print "\rDone! #{count} flowers generated\n"
  end
end
