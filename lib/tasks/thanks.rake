task :thanks => :environment do
  Message.find_each do |message|
    if ((message.text.include? "thank you" or message.text.include? "thanks") and thanked_person = Person.find_by("nick ILIKE ? ESCAPE ''", message.text.split(":")[0]))
      thanked_person.thanks = thanked_person.thanks + 1
      thanked_person.save
    end
  end
end