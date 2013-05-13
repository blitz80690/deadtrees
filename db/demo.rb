Tag.create(:text => 'star wars')

Item.create(
  :title => 'The Paradise Snare',
  :author => 'Ann C. Crispin',
  :publisher => 'Bantam Spectra',
  :isbn => '0-553-57415-9',
  :series => 'The Han Solo Trilogy',
  :published_at => Date.new(1997, 5, 5),
)

Item.create(
  :title => 'The Hutt Gambit',
  :author => 'Ann C. Crispin',
  :publisher => 'Bantam Spectra',
  :isbn => '0-553-57416-7',
  :series => 'The Han Solo Trilogy',
  :published_at => Date.new(1997, 8, 11)
)

Item.create(
  :title => 'Rebel Dawn',
  :author => 'Ann C. Crispin',
  :publisher => 'Bantam Spectra',
  :isbn => '0-553-57417-5',
  :series => 'The Han Solo Trilogy',
  :published_at => Date.new(1998, 3, 9)
)
