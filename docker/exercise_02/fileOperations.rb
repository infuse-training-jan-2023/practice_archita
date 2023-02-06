require 'json'

# ENV["INPUT"] = "./person.json"
# puts "#{ENV["INPUT"]}"
begin
    file = File.read(ENV["INPUT"])
    if file.length == 0
        return "File is empty"
    end

    data = JSON.parse(file)
    if data.empty?
        return "File is empty"
    end

    new_data = {}
    new_data['first name'] = data['name'].split()[0]
    new_data['last name'] = data['name'].split()[-1]
    data.delete('name')
    new_data = new_data.merge(data)

    File.write(ARGV[0], JSON.dump(new_data))
rescue => exception
    puts exception
end
