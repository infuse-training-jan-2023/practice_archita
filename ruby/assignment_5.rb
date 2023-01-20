require 'json'

class Assignment5
    def changingJSON(file_name)
        begin
            file = File.read(file_name)

            if file.length == 0
                return "File is empty"
            end

            data = JSON.parse(file)
            if data.empty?
                return "File is empty"
            end

            new_data = {}
            new_data['first name'] = data['name'].split()[0]
            new_data['last name'] = data['name'].split()[1]
    
            data.delete('name')
            new_data = new_data.merge(data)
    
            # File.write("./archita_#{Time.now.to_i}.json", JSON.dump(new_data))
            File.write("./archita_#{Time.now.strftime("%Y-%m-%dT%H-%M-%SZ")}.json", JSON.dump(new_data))
            return "#{file_name} modified successfully!"
        rescue 
            return "Error!"
        end
    end

    def read_file(file_name)
        
    end
end

# assg5 = Assignment5.new
# assg5.changingJSON('./person.json')