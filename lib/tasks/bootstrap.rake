namespace :db do
  task bootstrap: %w(db:drop db:setup) do
    puts 'Bootstrap started.'

    puts 'Creating videos...'
    videos = [
      { title: 'Preparing To Bring Baby Home', description: 'Preparing To Bring Baby Home',
        youtube_url: 'http://www.youtube.com/watch?v=LKEbfLS0-Sg', sponsored: true },
      { title: 'Instructions for New Parents', description: 'Instructions for New Parents',
        youtube_url: 'http://www.youtube.com/watch?v=LJxshHjUvPc', sponsored: false },
      { title: 'How To Bathe a Newborn', description: 'How To Bathe a Newborn',
        youtube_url: 'http://www.youtube.com/watch?v=-RnxD-KRkw8', sponsored: false }
    ]

    10.times { videos.each { |video| Video.create!(video) } }

    puts 'Bootstrap completed.\n'
  end
end
