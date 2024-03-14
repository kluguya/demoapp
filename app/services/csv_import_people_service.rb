class CsvImportPeopleService
  require "csv"
  def importfile(file, checkgroups)
    file = File.open(file)
    csv = CSV.parse(file, headers: true)
    result_hash = {}
    count = 0
    csv.each do |row|
      person_hash = Hash.new
      person_hash[:firstname] = row["firstname"]
      person_hash[:lastname] = row["lastname"]
      person_hash[:groupname] = row["groupname"]
      person_hash[:role] = row["role"]
      ##Create Person
      newperson = Person.new(person_hash)
      if newperson.save
        count += 1 
        checkgroups.call(row["groupname"], newperson)
      else
        result_hash[row] = newperson.errors.full_messages
      end
    end
    result_hash["number of rows successfully imported"] = count
    result_hash
  end
end