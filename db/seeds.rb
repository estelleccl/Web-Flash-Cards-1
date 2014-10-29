class EngMyDictImporter
  deck = Deck.create(title: "english_malay_dict")


  File.open("db/english-malay.txt", "r") do |f|
    f.each do |row|
      row = row.chomp.split("\t")
      Card.create(deck_id: deck.id, question: row[0], answer: row[1])
    end
  end
end

class UsCapDictImporter
  deck = Deck.create(title: "us_capitals_dict")


  File.open("db/us-capitals.txt", "r") do |f|
    f.each do |row|
      row = row.chomp.split("\t")
      Card.create(deck_id: deck.id, question: row[0], answer: row[1])
    end
  end
end

EngMyDictImporter.import
UsCapDictImporter.import
  
