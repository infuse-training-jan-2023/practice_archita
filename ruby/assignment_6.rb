require 'base64'

class Assignment6
    def encode(file_name)
        begin
            file = File.read(file_name)

            if file.length == 0
                return "File is empty"
            end

            file["the string that will be base encoded"] = Base64.encode64("the string that will be base encoded").chomp
            File.write("./archita.txt", file)
            return "#{file_name} encoded successfully!"
        rescue
            return "Error!"
        end
    end
end

# assg6 = Assignment6.new()
# puts assg6.encode('./content.txt')