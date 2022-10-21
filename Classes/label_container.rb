class LableContainer
  def initialize
    @labels = read_labels
    all_labels = File.read('./Classes/json_files/label.json')
    File.write('./Classes/json_files/label.json', []) if all_labels.empty?
  end

  def add_label
    puts 'Enter the following details to fill the label'
    puts ''
    puts 'Enter Title: '
    title = gets.chomp
    puts 'Enter Color: '
    color = gets.chomp
    new_label = Label.new(title, color)
    write_labels(new_label)
    @labels << new_label
    puts '***Label created successfully!***'
  end

  def list_of_labels
    if @labels.empty?
      puts 'There is no available labels!'
    else
      puts ''
      puts 'List of Labels: '
      @labels.each_with_index do |label, index|
        puts "#{index + 1}) Title: #{label.title} | Color: #{label.color}"
      end
    end
  end
end
