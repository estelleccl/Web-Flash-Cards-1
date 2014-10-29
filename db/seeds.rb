class EngMyDictImporter
  def self.import
    deck = Deck.create(title: "english_malay_dict")

    File.open("db/english-malay.txt", "r").each_line do |line|
      row = line.chomp.split("\t")
      Card.create(deck_id: deck.id, question: row[0], answer: row[1])
     end
  end
end

class UsCapDictImporter
 def self.import
    deck = Deck.create(title: "us_capitals_dict")

    File.open("db/us-capitals.txt", "r").each_line do |line|
      line = line.chomp.split("\t")
      Card.create(deck_id: deck.id, question: line[0], answer: line[1])
    end
 end
end

class UserImporter
  def self.import
     20.times do |x|
       User.create(
         username: Faker::Name.name,
        email: Faker::Internet.email,
        password: "111111"
        )
    end
  end
end

UserImporter.import
EngMyDictImporter.import
UsCapDictImporter.import